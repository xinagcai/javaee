package com.example.second.store;
import com.example.second.entity.Teacher;

import java.util.ArrayList;
import java.util.List;

public class StoreTeacher {
    private static List<Teacher> teachers = new ArrayList<Teacher>();
    private static Long uid = 6L;

    static {
        Teacher stu1 = new Teacher(0L, "小王", "男", 21,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","教师","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        Teacher stu2 = new Teacher(1L, "小李", "女", 22,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","办公室主任","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        Teacher stu3 = new Teacher(2L, "张三", "男", 21,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","教师","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        Teacher stu4 = new Teacher(3L, "李四", "女", 22,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","助教","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        Teacher stu5 = new Teacher(4L, "王麻子", "男", 21,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","教师","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        Teacher stu6 = new Teacher(5L, "老张", "女", 22,"1994.8",223,"软件工程","设计模式","1182230202","是","博士","文明教师","未婚","13508021999","1298842199@qq.com","重庆市渝北区龙兴镇","教师","汉族",new String[]{"四川省","成都市"},"2017.6","2018.2","清华大学");
        teachers.add(stu1);
        teachers.add(stu2);
        teachers.add(stu3);
        teachers.add(stu4);
        teachers.add(stu5);
        teachers.add(stu6);
    }

    public static List<Teacher> findAllTeachers() {
        return teachers;
    }

    public static void addTeacher(Teacher teacher) {
        teacher.setUid(uid++);
        teachers.add(teacher);
    }

    public static void deleteTeacherById(Long uid) {
        for (Teacher teacher : teachers) {
            if (teacher.getUid().equals(uid)) {
                teachers.remove(teacher);
                return;
            }
        }
    }

    public static void editTeacherById(Teacher teacher) {
        for (int i = 0; i < teachers.size(); i++) {
            if (teachers.get(i).getUid() == teacher.getUid()) {
                teachers.set(i, teacher);
                return;
            }
        }
    }
}
