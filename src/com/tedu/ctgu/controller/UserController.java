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
@RequestMapping("/user") //���������������ռ�
public class UserController {
	
	@RequestMapping("/toUpload")
	public String toUpload(){
		return "/upload";
	}
	
	
	//ע��ӿڶ���
	@Resource //Ĭ��ʹ��set�ķ�ʽע��
	private UserDao userDao;
	
	@RequestMapping("/upload.do")
	public ModelAndView load(
			@RequestParam("id")String id,
			HttpServletRequest request,
			RedirectAttributes ra){
		User user=userDao.findById(Integer.parseInt(id));
		//ʹ��ModelAndView���Խ���map
		//ModelMap
		
		
		//�ڲ�ѯһ�������֮ǰ,�����Խ������ҳ
		//PageHelper.startPage(pageNum, pageSize);
		//List<User> list=dao.findAll();
		
		Map<String,Object> map=new 
				HashMap<String,Object>();
		map.put("user1", user);
		//Ҳ����ModelMap map1=new ModelMap();
		//�����Ժ󷵻�һ���ض���list,����֮ǰҪ������
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
	
	//ע��ķ�ʽ�Զ����쳣����
	@ExceptionHandler
	public String f1(Exception e,HttpServletRequest 
			request){
		String message=null;
		if(e instanceof NumberFormatException){
			message="�������������";
		}else if(e instanceof NullPointerException){
			message="��ָ��";
		}else{
			
		}
		request.setAttribute("message", message);
		return "/error";
	}
	
	
	
	
	
	
	
}
