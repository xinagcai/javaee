package com.example.second.controller;


import com.example.second.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Transactional
@RestController
public class FileController {

    @Autowired
    private FileService fileService;


    @PostMapping("/upload")
    public String uploadFile(MultipartFile file, HttpServletRequest request,int uid) throws IOException {
        return this.fileService.uploadFile(file, request,uid);
    }

    @PostMapping("/uploadActionUrl")
    public void uploadActionUrl(MultipartFile file, HttpServletRequest request) throws IOException {
        this.fileService.uploadActionUrl(file, request);
    }

    @RequestMapping("/download")
    public void download(HttpServletResponse response, HttpServletRequest request) {

        this.fileService.download(response, request);
    }


}
