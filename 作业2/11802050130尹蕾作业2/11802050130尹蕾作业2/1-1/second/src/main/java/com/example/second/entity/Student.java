package com.example.second.entity;

public class Student {
    private Long uid;
    private String name;
    private String sex;
    private Integer age;


    public Student() {

    }

    public Student(Long uid, String name, String sex, Integer age) {
        this.uid = uid;
        this.name = name;
        this.sex = sex;
        this.age = age;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
