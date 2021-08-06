package com.cqut.ktp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class School {
    /**
     * 学校id
     */
    private Integer sclID;

    /**
     * 学校名称
     */
    private String sclName;
}
