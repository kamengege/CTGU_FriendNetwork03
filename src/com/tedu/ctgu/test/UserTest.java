package com.tedu.ctgu.test;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.defaults.DefaultSqlSessionFactory;
import org.junit.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tedu.ctgu.dao.UserDao;
import com.tedu.ctgu.pojo.User;

public class UserTest {

	@Test
	public void test() throws Exception {
		//1.获得容器对象
		ApplicationContext ac=new
		ClassPathXmlApplicationContext
		("com/tedu/ctgu/source/applicationContext.xml");
		//2.通过容器实例化sessionfactory
		DefaultSqlSessionFactory bean=
				ac.getBean("sessionFactory",
						DefaultSqlSessionFactory.class);
		SqlSession session=
				bean.openSession();
		//
		UserDao dao=
		session.getMapper(UserDao.class);
		User u=dao.findById2(14);
		System.out.println(u);
	}

}
