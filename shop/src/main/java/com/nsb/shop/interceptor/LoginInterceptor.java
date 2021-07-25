package com.nsb.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;




	
	public class LoginInterceptor extends HandlerInterceptorAdapter{
		 
	    @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        
	        HttpSession session = request.getSession();
	       Object members = session.getAttribute("loginUser");
	 

	        if(members == null){
	            response.sendRedirect("/user/login");
	            return false;
	        }

	        
	        return true;
	    }
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        // TODO Auto-generated method stub
	        super.postHandle(request, response, handler, modelAndView);
	    }     
	}