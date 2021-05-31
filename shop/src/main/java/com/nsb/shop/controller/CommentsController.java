package com.nsb.shop.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nsb.shop.logic.Comments;
import com.nsb.shop.service.CommentsService;

@Controller
@RequestMapping("/Comments/*")
public class CommentsController {
	
	@Autowired
	private CommentsService service;

	@RequestMapping(value="/commentswrite",method = RequestMethod.POST)
	@ResponseBody
	public String commentswrite( Comments comt,HttpSession session) {
		
		
		String users = (String)session.getAttribute("userId");
		comt.setWriter(users);	
		
		service.commentsWrite(comt);
		
		return "redirect:/view/boardDetail?id="+ comt.getid();
		
	}
}
