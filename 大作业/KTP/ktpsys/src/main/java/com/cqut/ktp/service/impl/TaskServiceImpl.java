package com.cqut.ktp.service.impl;

import com.cqut.ktp.mapper.*;
import com.cqut.ktp.entity.Course;
import com.cqut.ktp.entity.Message;
import com.cqut.ktp.entity.Task;
import com.cqut.ktp.entity.User;
import com.cqut.ktp.service.MessageService;
import com.cqut.ktp.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.List;
import java.util.UUID;


@Service
public class TaskServiceImpl implements TaskService {
    @Autowired
    private TaskMapper mapper;
    @Autowired
    private GradeMapper gradeMapper;
    @Autowired
    private CourseMemberMapper courseMemberMapper;
    @Autowired
    private MessageService messageService;
    @Autowired
    private CourseMapper courseMapper;
    @Override
    public List<Task> selectTasks(String tno, String cno) {
        return mapper.selectTasks(tno, cno);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertTask(Task task) {
        Object savePoint = null;
        try {
            savePoint = TransactionAspectSupport.currentTransactionStatus().createSavepoint();

            String tno = UUID.randomUUID().toString().replace("-", "").substring(0, 6);
            task.setTno(tno);

            mapper.insertTask(task);
            List<User> users = courseMemberMapper.getCourseMembers(task.getCno());
            // 通过课程号获取到课程
            Course course = courseMapper.getCourseByCno(task.getCno());
            // 将选了这门课程的学生添加到对应的作业中，并且对每一个学生新建一个成绩，发送消息给学生
            for (User user: users) {
                gradeMapper.addGrade(user.getUserId(), tno);
                messageService.send(new Message(null, course.getAdmin(), user,
                        course.getName() + "发布了" + task.getTname() + ", 请注意查收。", null));
            }
        } catch (Exception e) {
            e.printStackTrace();
            assert savePoint != null;
            TransactionAspectSupport.currentTransactionStatus().rollbackToSavepoint(savePoint);
        }

    }

    @Override
    public void updateTask(Task task) {
        mapper.updateTask(task);
    }

    @Override
    public void deleteTask(String tno) {
        mapper.deleteTask(tno);
    }
}
