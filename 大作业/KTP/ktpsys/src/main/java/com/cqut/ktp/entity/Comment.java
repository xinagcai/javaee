package com.cqut.ktp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    /**
     * 课程号
     */
    private Task task;

    /**
     * 用户唯一标识
     */
    private User user;
    /**
     * 评论内容
     */
    private String comment;

    /**
     * 发布时间
     */
    private Date cmDate;
}
