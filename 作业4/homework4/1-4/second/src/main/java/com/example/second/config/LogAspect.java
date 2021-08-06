package com.example.second.config;


import com.alibaba.fastjson.JSON;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

@Aspect
@Component
public class LogAspect {


    //使用指定类初始化日志对象,在日志输出的时候，可以打印出日志信息所在的类：
    private final static Logger logger = LoggerFactory.getLogger(LogAspect.class);

    /**
     * 定义切点
     */
    @Pointcut("execution(* com.example.second.service.impl.*.*(..))")
    public void controllerLog() {
    }

    @Before(value = "controllerLog()")
//    非入侵式设计
    public void doBeforeController(JoinPoint joinPoint) {
//        String name = joinPoint.getSignature().getName();
//        System.out.println(name);
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();
        SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/");
        String format = sdf.format(new Date());
        String ip = request.getRemoteAddr();
        String url = request.getRequestURI();
        String methodType = request.getMethod();

        //打印日志
        logger.debug("-----------------------------------------------------------------------------------------------------");
        logger.debug("时间 = {}", format);
        logger.debug("访问url = {}", url);
        logger.debug("请求方法类型 = {}", methodType);
        logger.debug("来源ip地址 = {}", ip);
        logger.debug("调用方法 = {}", joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
        logger.debug("-----------------------------------------------------------------------------------------------------");
    }

    @Around(value = "controllerLog()")
    public Object doAfterController(ProceedingJoinPoint joinPoint) throws Throwable {
        long start = System.currentTimeMillis();
        Object object = joinPoint.proceed();
        long end = System.currentTimeMillis();
        long time = end - start;
        logger.debug("执行时间 = {}", time + "ms");
        logger.info("执行时间 = {}", time + "ms");
        return object;
    }
}
