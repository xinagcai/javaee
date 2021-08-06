package com.example.second.service.impl;


import com.example.second.dao.UploadDao;
import com.example.second.entity.TeacherFile;
import com.example.second.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.UUID;

@Service
public class FileServiceBean implements FileService {

    @Autowired
    UploadDao uploadDao;

    public String uploadFile(MultipartFile file, HttpServletRequest request, int uid) {
        try {
            String name = file.getOriginalFilename();
            String realPath = "E:\\file_upload\\";
            String newname = UUID.randomUUID().toString() + name;
            File folder = new File(realPath, newname);

            if (!folder.exists()) {
                folder.mkdirs();
            }
            TeacherFile teacherFile = new TeacherFile();
            teacherFile.setName(name);
            teacherFile.setNewname(newname);
            teacherFile.setUid(uid);
            teacherFile.setUrl(realPath + newname);
            uploadDao.insertFile(teacherFile);
            file.transferTo(folder);
            return name;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void uploadActionUrl(MultipartFile file, HttpServletRequest request) {
        try {
            String name = file.getOriginalFilename();
            String realPath = "E:\\image_upload\\";
            File folder = new File(realPath, name);
            if (!folder.exists()) {
                folder.mkdirs();
            }
            file.transferTo(folder);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void download(HttpServletResponse response, HttpServletRequest request) {

        Integer id = Integer.parseInt(request.getParameter("id"));
        TeacherFile teacherFile = uploadDao.findById(id);

        try {
            // path是指想要下载的文件的路径
            File file = new File(teacherFile.getUrl());
            FileInputStream fileInputStream = new FileInputStream(file);
            InputStream fis = new BufferedInputStream(fileInputStream);
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();

            // 清空response
            response.reset();
            // 设置response的Header
            response.setCharacterEncoding("UTF-8");
            //Content-Disposition的作用：告知浏览器以何种方式显示响应返回的文件，用浏览器打开还是以附件的形式下载到本地保存
            //attachment表示以附件方式下载   inline表示在线打开   "Content-Disposition: inline; filename=文件名.mp3"
            // filename表示文件的默认名称，因为网络传输只支持URL编码的相关支付，因此需要将文件名URL编码后进行传输,前端收到后需要反编码才能获取到真正的名称
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(teacherFile.getName(), "UTF-8"));
            // 告知浏览器文件的大小
            response.addHeader("Content-Length", "" + file.length());
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            outputStream.write(buffer);
            outputStream.flush();
            System.out.println("下载完成");
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
