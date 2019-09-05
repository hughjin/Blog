package com.hughjin.util.redis;

import com.hughjin.entity.*;

public enum KeyNameTypeEnum {

    STRING_BLOGGER_INFO(BaseRedisConstant.STRING_BLOGGER_INFO, Blogger.class.getName(), "关于博主"), // 关于博主
    SET_LINK_INFO(BaseRedisConstant.SET_LINK_INFO, Link.class.getName(), "友情链接"), // 友情链接
    STRING_BLOG_INFO(BaseRedisConstant.STRING_BLOG_INFO, Blog.class.getName(), "博客内容信息"), // 博客内容信息
    STRING_BLOG_READ_INFO(BaseRedisConstant.STRING_BLOG_READ_INFO, "read", "阅读数"), // 阅读数
    STRING_BLOG_REPLY_INFO(BaseRedisConstant.STRING_BLOG_REPLY_INFO, "replay", "评论数"), // 评论数
    SET_BLOG_TYPE_INFO(BaseRedisConstant.SET_BLOG_TYPE_INFO, BlogType.class.getName(), "博客类别信息"), // 博客类别信息
    SET_BLOG_COMMENT_INFO(BaseRedisConstant.SET_BLOG_COMMENT_INFO, Comment.class.getName(), "评论信息"), // 评论信息
    ;

    private String typeCode;
    private String indexKey;
    private String desc;


    KeyNameTypeEnum(String typeCode, String indexKey, String desc) {
        this.typeCode = typeCode;
        this.indexKey = indexKey;
        this.desc = desc;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public String getIndexKey() {
        return indexKey;
    }

    public String getDesc() {
        return desc;
    }
}