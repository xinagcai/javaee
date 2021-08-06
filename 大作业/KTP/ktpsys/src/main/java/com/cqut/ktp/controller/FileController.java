package com.cqut.ktp.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.net.SocketException;
import java.util.UUID;


@RestController
@RequestMapping("/file")
public class FileController {
    @PostMapping(value = "/upload")
    public String upload(@RequestParam MultipartFile file) throws SocketException, IOException {
        String fileId = UUID.randomUUID().toString().replace("-", "").replace("?","").substring(0, 10);
        File dest = new File("D:\\bq\\javaee\\KTP\\ktpui\\public\\static\\file\\" + fileId + file.getOriginalFilename());
        if (!dest.exists()) {
            dest.mkdirs();
        }
        try {
            file.transferTo(dest);
        } catch (Exception ex) {
            return "false";
        }
        return fileId + file.getOriginalFilename();
    }
}