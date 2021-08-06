package com.example.demo.module1.dao;

import com.example.demo.module1.entity.Student;

import java.util.*;

public class Store implements StudentDao {
    private static Map<Integer, Student> Students = new HashMap<>();

    static {
        Students.put(1, new Student(1, "张1", "001", "18"));
        Students.put(2, new Student(2, "张2", "002", "18"));
        Students.put(3, new Student(3, "张3", "003", "18"));
        Students.put(4, new Student(4, "张4", "004", "18"));
        Students.put(5, new Student(5, "张5", "005", "18"));
        Students.put(6, new Student(6, "张6", "006", "18"));
        Students.put(7, new Student(7, "张7", "007", "18"));
    }


    @Override
    public List<Object> findAll() {
        List<Object> students = new ArrayList<>();
        Iterator<Student> iterator = Students.values().iterator();
        while (iterator.hasNext()) {
            students.add(iterator.next());
        }
        return students;
    }

    @Override
    public Object findById(int id) {
        return Students.get(id);
    }

    @Override
    public Student add(Student student) {
        return Students.put(student.getId(),student);
    }

    @Override
    public void update(Student student) {
        Students.put(student.getId(), student);
    }

    @Override
    public void delete(Student student) {
        Students.remove(student.getId());
    }


    @Override
    public void delete(int id) {
        Students.remove(id);
    }
}
