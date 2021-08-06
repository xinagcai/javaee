package com.cqut.ktp.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTCreator;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class JWTUtils {

    private static final String SING = "&^%yf^gg%33^$$$%%$uhh";

    /**
     * 生成token header.payload.sing
     */
    public static String getToken(Map<String, String> map) {
        Calendar instance = Calendar.getInstance();
        instance.add(Calendar.DATE, 30);
        //创建JWT builder
        JWTCreator.Builder builder = JWT.create();
        //payload
        map.forEach((k, v) -> {
            builder.withClaim(k, v);
        });
        String token = builder.withExpiresAt(instance.getTime()).sign(Algorithm.HMAC256(SING));
        return token;
    }

    /**
     * 验证token
     */
    public static DecodedJWT  verity(String token) {
        return JWT.require(Algorithm.HMAC256(SING)).build().verify(token);
    }

//    /**
//     * 获取token信息
//     */
//    public static DecodedJWT getTokenInfo(String token) {
//        DecodedJWT verify=JWT.require(Algorithm.HMAC256(SING)).build().verify(token);
//        return verify;
//    }
}
