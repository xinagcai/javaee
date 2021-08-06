package com.cqut.ktp.mapper;

import com.cqut.ktp.entity.Permission;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface PermissionMapper {
    /**
     * 查找权限
     *
     * @return
     */
    List<Permission> selectPermission();
}
