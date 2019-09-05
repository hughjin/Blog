package com.hughjin.service.impl;

import com.hughjin.dao.BloggerDao;
import com.hughjin.entity.Blogger;
import com.hughjin.service.BloggerService;
import com.hughjin.util.json.JsonUtils;
import com.hughjin.util.redis.KeyNameTypeEnum;
import com.hughjin.util.redis.RedisServiceUtil;
import org.slf4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import static org.slf4j.LoggerFactory.getLogger;

/**
 * 博主Service实现类
 *
 * @author Administrator
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService {

    /**
     * 日志
     */
    private static final Logger LOGGER = getLogger(BloggerServiceImpl.class);

    @Resource
    private BloggerDao bloggerDao;

    public Blogger find() {
        RedisServiceUtil redis = new RedisServiceUtil();
        Blogger blogger = redis.redisGetString(Blogger.class, KeyNameTypeEnum.STRING_BLOGGER_INFO);
        if (blogger != null) {
            return blogger;
        } else {
            blogger = bloggerDao.find();
            if (blogger != null) {
                redis.redisSetString(JsonUtils.formatBeanToJsonStr(blogger), KeyNameTypeEnum.STRING_BLOGGER_INFO);
            }
        }
        return blogger;
    }

    public Blogger getByUserName(String userName) {
        return bloggerDao.getByUserName(userName);
    }

    public Integer update(Blogger blogger) {
        return bloggerDao.update(blogger);
    }


}
