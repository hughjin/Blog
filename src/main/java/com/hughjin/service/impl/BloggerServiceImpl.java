package com.hughjin.service.impl;

import com.hughjin.dao.BloggerDao;
import com.hughjin.entity.Blogger;
import com.hughjin.service.BloggerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 *  博主Service实现类
 * @author Administrator
 *
 */
@Service("bloggerService")
public class BloggerServiceImpl implements BloggerService{

	@Resource
	private BloggerDao bloggerDao;

	public Blogger find() {
		return bloggerDao.find();
	}

	public Blogger getByUserName(String userName) {
		return bloggerDao.getByUserName(userName);
	}

	public Integer update(Blogger blogger) {
		return bloggerDao.update(blogger);
	}
	
	
}
