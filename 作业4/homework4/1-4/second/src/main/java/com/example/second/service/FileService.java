package com.example.second.service;


import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FileService {

    public String uploadFile(MultipartFile file, HttpServletRequest request,int uid);

    public void uploadActionUrl(MultipartFile file, HttpServletRequest request);

    public void download(HttpServletResponse response, HttpServletRequest request);

}
