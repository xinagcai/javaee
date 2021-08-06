package com.cqut.ktp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.sql.SQLException;


@Mapper
public interface UploadMapper {
    /**
     * 头像上传
     *
     * @param fileName
     */
    void upload(@Param("avatar") String fileName, @Param("uid") String uid) throws SQLException;
}
