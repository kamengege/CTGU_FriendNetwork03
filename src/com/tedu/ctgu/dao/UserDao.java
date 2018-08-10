package com.tedu.ctgu.dao;

import org.apache.ibatis.annotations.Param;

import com.tedu.ctgu.annotation.MybatisAnnotation;
import com.tedu.ctgu.pojo.Pic;
import com.tedu.ctgu.pojo.User;

@MybatisAnnotation
public interface UserDao {
	public User findById(Integer id);
	public User login(@Param("username")String username,
				@Param("password")String password);
	//根据id查询图片对象
	public Pic findPic(Integer id);
	public User findById2(Integer id);
}
