package com.tedu.ctgu.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.tedu.ctgu.pojo.User;

public class MyInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("���������...");
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		System.out.println("���ڴ�������...");
	}
	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		//�ж��û��Ƿ��¼ ,�����¼,������ת,
		//�����ض��򵽵�¼ҳ�����ע��
		User u=(User) 
				arg0.getSession().getAttribute("u");
		if(u==null){
			arg1.sendRedirect(arg0.getContextPath()+
					"/user/toRegist.do");
			return false;
		}
		return true;
	}
}
