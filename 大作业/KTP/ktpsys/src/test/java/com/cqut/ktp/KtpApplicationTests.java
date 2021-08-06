package com.cqut.ktp;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;
import java.util.HashMap;
import java.util.UUID;

@SpringBootTest
class KtpApplicationTests {

    @Test
    void contextLoads() {
        Calendar instance = Calendar.getInstance();
        HashMap<String,Object> map = new HashMap<>();
        instance.add(Calendar.SECOND,1000);
        String token = JWT.create().withHeader(map)
                .withClaim("Uid",21)
                .withClaim("name","lalala")
                .withExpiresAt(instance.getTime())
                .sign(Algorithm.HMAC256("llll"));
        System.out.println(token);

    }

    @Test
    public void test(){
        JWTVerifier jwtVerifier=JWT.require(Algorithm.HMAC256("llll")).build();
        DecodedJWT verify = jwtVerifier.verify("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJVaWQiOjIxLCJuYW1lIjoibGFsYWxhIiwiZXhwIjoxNjA3NjAwODY2fQ.Zo8IiKp8-4U4GDL4bECBS-BcJlpLWZOGGVtRmuSIwNw");
        System.out.println(verify.getClaim("Uid").asInt());
        System.out.println(verify.getClaim("name").asString());


    }
}
