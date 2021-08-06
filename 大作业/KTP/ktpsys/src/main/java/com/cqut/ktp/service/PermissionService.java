package com.cqut.ktp.service;

import com.cqut.ktp.entity.Permission;

import java.util.List;


public interface PermissionService {
    /**
     * 查找权限
     *
     * @return
     */
    List<Permission> selectPermission();
}
