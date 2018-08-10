package com.tedu.ctgu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.pagehelper.PageHelper;
import com.tedu.ctgu.dao.UserDao;
import com.tedu.ctgu.pojo.User;

@Controller
@RequestMapping("/user") //给请求增加命名空间
public class UserController {
	
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "/upload";
	}
	
	
	//注入接口对象
	@Resource //默认使用set的方式注入
	private UserDao userDao;
	
	@RequestMapping("/upload.do")
	public ModelAndView load(
			@RequestParam("id")String id,
			HttpServletRequest request,
			RedirectAttributes ra){
		User user=userDao.findById(Integer.parseInt(id));
		//使用ModelAndView可以接受map
		//ModelMap
		
		
		//在查询一个结果集之前,如果相对结果集分页
		//PageHelper.startPage(pageNum, pageSize);
		//List<User> list=dao.findAll();
		
		Map<String,Object> map=new 
				HashMap<String,Object>();
		map.put("user1", user);
		//也可以ModelMap map1=new ModelMap();
		//更新以后返回一个重定向list,在这之前要绑定数据
		return new ModelAndView("/upload",map);
	}

	@RequestMapping("/toRegist.do")
	public String tiRegist(){
		return "/regist";
	}
	
	@RequestMapping("/toLogin.do")
	public String toLogin(){
		Object o=null;
		o.equals(userDao);
		return "/login";
	}
	
	//注解的方式自定义异常处理
	@ExceptionHandler
	public String f1(Exception e,HttpServletRequest 
			request){
		String message=null;
		if(e instanceof NumberFormatException){
			message="不能输入非数字";
		}else if(e instanceof NullPointerException){
			message="空指针";
		}else{
			
		}
		request.setAttribute("message", message);
		return "/error";
	}
	
	
	
	
	
	
	
}
