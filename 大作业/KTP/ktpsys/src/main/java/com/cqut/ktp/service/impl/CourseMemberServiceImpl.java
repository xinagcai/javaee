package com.cqut.ktp.service.impl;

import com.cqut.ktp.entity.*;
import com.cqut.ktp.mapper.*;
import com.cqut.ktp.service.CourseMemberService;
import com.cqut.ktp.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;


@Service
public class CourseMemberServiceImpl implements CourseMemberService {
    @Autowired
    private CourseMemberMapper mapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private TaskMapper taskMapper;
    @Autowired
    private CourseMapper courseMapper;
    @Autowired
    private MessageService messageService;
    @Autowired
    private UserMapper userMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean addMember(String cno, String uid) {
        Object savePoint = null;
        try {
            // 设置回滚点
            savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();

            // 判断该课程是否被删除或归档
            Course course = courseMapper.getCourseByCno(cno);
            if (course.getDeleteStatus() == 1 || course.getArchiveStatus() == 1) {
                // 不能加入
                return false;
            }

            // 首先判断是否原本就有该学生
            CourseMember c = mapper.getCourseMember(cno, uid);
            if (c != null) {
                if ("1".equals(c.getStatus())) {
                    return false;
                } else {
                    mapper.changeStatus(cno, uid, "0");
                    mapper.updateMember(cno);
                    User from = new User();
                    User to = new User();
                    to.setUserId(course.getAdmin().getUserId());
                    from.setUserId(uid);
                    String msg = userMapper.findEntityByUid(uid).getName()+"加入了你的课程:"+course.getName();
                    messageService.send(new Message(null,from,to,msg,null));

                    return true;
                }
            } else {
                mapper.addMember(cno, uid);
                mapper.updateMember(cno);
                //发送信息给教师
                User from = new User();
                User to = new User();
                to.setUserId(course.getAdmin().getUserId());
                from.setUserId(uid);
                String msg = userMapper.findEntityByUid(uid).getName()+"加入了你的课程:"+course.getName();
                messageService.send(new Message(null,from,to,msg,null));
            }

            List<Task> tasks = taskMapper.selectTasks(null, cno);
            // 一个新学生加入该课程，需要将他进入到对应的作业当中
            for (Task task: tasks) {
                gradeMapper.addGrade(uid, task.getTno());
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            assert savePoint != null;
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            return false;
        }
    }

    @Override
    public Boolean changeStatus(String cno, String uid, String status) {
        try {
            if ("2".equals(status)) {
                mapper.changeStatus(cno, uid, status);
                mapper.minusMember(cno);
            } else {
                mapper.changeStatus(cno, uid, status);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Boolean deleteMembers(String cno, List<User> members) {
        Object savePoint = null;
        try {
            savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();

            for (User user: members) {
                changeStatus(cno, user.getUserId(), "2");
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            assert savePoint != null;
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
            return false;
        }
    }

    @Override
    public Boolean changeAllStatus(String cno, String status) {
        try {
            mapper.changeAllStatus(cno, status);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getCourseMembers(String cno) {
        return mapper.getCourseMembers(cno);
    }

    @Override
    public List<Course> getCourse(String uid) {
        return mapper.getCourse(uid);
    }

    @Override
    public Integer getMemberCount(String cno) {
        return mapper.getMemberCount(cno);
    }
}
