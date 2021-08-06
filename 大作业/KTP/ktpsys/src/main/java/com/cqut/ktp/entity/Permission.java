package com.cqut.ktp.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Permission {
    /**
     * 权限
     */
    private Integer pid;
    private String pname;
}
