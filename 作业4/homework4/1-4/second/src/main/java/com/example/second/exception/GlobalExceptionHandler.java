//package com.example.second.exception;
//
//
//import com.sun.deploy.net.HttpResponse;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.multipart.MaxUploadSizeExceededException;
//
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//
//@ControllerAdvice
//public class GlobalExceptionHandler {
//    @ExceptionHandler(MaxUploadSizeExceededException.class)
//    public void uploadSizeException(MaxUploadSizeExceededException e, HttpServletResponse response) throws IOException {
//        System.out.println("上传超过限制");
//    }
//
//}
