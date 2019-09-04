package com.hughjin.util;

import org.apache.shiro.crypto.hash.Md5Hash;

/**
 * 加密工具
 * @author Administrator
 */
public class CryptographyUtil {

    private static final String SALT = "hughjin";

    /**
     * Md5加密
     *
     * @param str
     * @param salt
     */
    public static String md5(String str, String salt) {
        return new Md5Hash(str, salt).toString();
    }

    public static String md5(String str) {
        return new Md5Hash(str, SALT).toString();
    }

    public static void main(String[] args) {
        String password = "123456";
        System.out.println("Md5加密：" + CryptographyUtil.md5(password));
    }
}
