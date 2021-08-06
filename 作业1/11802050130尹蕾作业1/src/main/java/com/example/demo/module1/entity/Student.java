package com.example.demo.module1.entity;

public class Student {
    private int id;
    private String name;
    private String code;
    private String age;

    public Student(int id, String name, String code, String age) {
        this.id = id;
        this.name = name;
        this.code = code;
        this.age = age;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }
}
