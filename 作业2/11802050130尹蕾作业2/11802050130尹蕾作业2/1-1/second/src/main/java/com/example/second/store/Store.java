package com.example.second.store;

import com.example.second.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class Store {
    private static List<Student> students = new ArrayList<Student>();
    private static Long uid = 6L;

    static {
        Student stu1 = new Student(0L, "小王", "男", 21);
        Student stu2 = new Student(1L, "小李", "女", 22);
        Student stu3 = new Student(2L, "张三", "男", 21);
        Student stu4 = new Student(3L, "李四", "女", 22);
        Student stu5 = new Student(4L, "王麻子", "男", 21);
        Student stu6 = new Student(5L, "老张", "女", 22);
        students.add(stu1);
        students.add(stu2);
        students.add(stu3);
        students.add(stu4);
        students.add(stu5);
        students.add(stu6);
    }

    public static List<Student> findAllStudents() {
        return students;
    }

    public static void addStudent(Student student) {
        student.setUid(uid++);
        students.add(student);
    }

    public static void deleteStudentById(Long uid) {
        for (Student student : students) {
            if (student.getUid().equals(uid)) {
                students.remove(student);
                return;
            }
        }
    }

    public static void editStudentById(Student student) {
        for (int i = 0; i < students.size(); i++) {
            if (students.get(i).getUid() == student.getUid()) {
                students.set(i, student);
                return;
            }
        }
    }
}
