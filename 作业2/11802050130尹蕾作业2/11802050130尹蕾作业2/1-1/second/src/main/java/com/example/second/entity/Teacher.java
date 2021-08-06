package com.example.second.entity;

import java.util.Date;
import java.util.List;

public class Teacher {
    private Long uid;
    private String name;
    private String sex;
    private Integer age;
    private String  birth;
    private Integer salary;
    private String major;
    private String course;
    private String clazz;
    private String partyMember;
    private String diploma;
    private String certificate;
    private String maritalStatus;
    private String phoneNumber;
    private String email;
    private String address;
    private String position;
    private String ethnic;
    private String[] nativePlace;
    private String yearOfGraduation;
    private String yearOfWork;
    private String schoolOfGraduation;
//    private String[] hobby;


    public Teacher() {

    }

    public Teacher(Long uid, String name, String sex, Integer age, String birth, Integer salary, String major, String course, String clazz,  String partyMember, String diploma, String certificate, String maritalStatus, String phoneNumber, String email, String address, String position, String ethnic, String[] nativePlace, String yearOfGraduation, String yearOfWork, String schoolOfGraduation) {
        this.uid = uid;
        this.name = name;
        this.sex = sex;
        this.age = age;
        this.birth = birth;
        this.salary = salary;
        this.major = major;
        this.course = course;
        this.clazz = clazz;
        this.partyMember = partyMember;
        this.diploma = diploma;
        this.certificate = certificate;
        this.maritalStatus = maritalStatus;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.position = position;
        this.ethnic = ethnic;
        this.nativePlace = nativePlace;
        this.yearOfGraduation = yearOfGraduation;
        this.yearOfWork = yearOfWork;
        this.schoolOfGraduation = schoolOfGraduation;
//        this.hobby = hobby;
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

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    public String getPartyMember() {
        return partyMember;
    }

    public void setPartyMember(String partyMember) {
        this.partyMember = partyMember;
    }

    public String getDiploma() {
        return diploma;
    }

    public void setDiploma(String diploma) {
        this.diploma = diploma;
    }

    public String getCertificate() {
        return certificate;
    }

    public void setCertificate(String certificate) {
        this.certificate = certificate;
    }

    public String getMaritalStatus() {
        return maritalStatus;
    }

    public void setMaritalStatus(String maritalStatus) {
        this.maritalStatus = maritalStatus;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getEthnic() {
        return ethnic;
    }

    public void setEthnic(String ethnic) {
        this.ethnic = ethnic;
    }

    public String[] getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String[] nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getYearOfGraduation() {
        return yearOfGraduation;
    }

    public void setYearOfGraduation(String yearOfGraduation) {
        this.yearOfGraduation = yearOfGraduation;
    }

    public String getYearOfWork() {
        return yearOfWork;
    }

    public void setYearOfWork(String yearOfWork) {
        this.yearOfWork = yearOfWork;
    }

    public String getSchoolOfGraduation() {
        return schoolOfGraduation;
    }

    public void setSchoolOfGraduation(String schoolOfGraduation) {
        this.schoolOfGraduation = schoolOfGraduation;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

//    public String[] getHobby() {
//        return hobby;
//    }
//
//    public void setHobby(String[] hobby) {
//        this.hobby = hobby;
//    }
}
