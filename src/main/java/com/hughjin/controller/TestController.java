package com.hughjin.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.hughjin.entity.Blogger;
import com.hughjin.service.BloggerService;
import com.hughjin.util.json.JsonUtils;
import com.hughjin.util.redis.RedisServiceUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/redis")
    @ResponseBody
    public String redis() {
        Map<String, Object> resultMap = new HashMap<>();
        this.testRedis();
        resultMap.put("success", "");
        return JSONUtils.toJSONString(resultMap);
    }

    public void testRedis() {
        RedisServiceUtil redisServiceUtil = new RedisServiceUtil();
        for (int i = 0; i < 10; i++) {
            redisServiceUtil.set("test-redisKey" + i, String.valueOf(i));
        }
        System.out.println("---------Redis插入结束-----------");
        for (int i = 0; i < 10; i++) {
            String value = redisServiceUtil.get("test-redisKey" + i);
            System.out.println("key[test-redisKey" + i + "]对应值为" + value);
        }
    }

    @Autowired
    private BloggerService bloggerService;

    @RequestMapping("/blogger")
    @ResponseBody
    public String blogger() {
        Map<String, Object> resultMap = new HashMap<>();
        Blogger blogger = bloggerService.find();
        resultMap.put("success", JsonUtils.formatBeanToJsonStr(blogger));
        return JSONUtils.toJSONString(resultMap);
    }

}
