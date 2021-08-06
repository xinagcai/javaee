package com.cqut.ktp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseMember {
    /**
     * 所属课程
     */
    private Course course;

    /**
     * 学生或助教
     */
    private User user;

    /**
     * 课程状态 2->退课
     */
    private String status;
}
