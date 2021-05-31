package com.nsb.shop.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nsb.shop.logic.Board;

import com.nsb.shop.logic.Members;
import com.nsb.shop.service.BoardService;
import com.nsb.shop.service.UserService;
import com.nsb.shop.utils.UploadFileUtils;

@Controller
@RequestMapping("jquery/*")
public class JqueryController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	@RequestMapping("jquery/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		session.removeAttribute("userId");
		return "/user/login";
	}
	
	@RequestMapping(value="jquery/login",method = RequestMethod.POST)
	@ResponseBody
	public int login(Members members,HttpSession session) {
		int result = 0; 
		String col = null;
		col = "userId";
		
		Members userIdCheck = userService.getUserOne(members.getUserId(),col);
		if(userIdCheck == null) {
			result = 2;
		}else {
		
		if(members.getUserId().equals(userIdCheck.getUserId())) {
			//ID OK
			if(members.getPassword().equals(userIdCheck.getPassword())) {
				//PW OK 
				session.setAttribute("userId", members.getUserId());
				session.setAttribute("loginUser", userIdCheck);
				
				result = 3;
			}else {
				result = 2;
			}
			
		}else {
			//ID not OK
			result = 2;
		}
		}
		
		return result;
	}
	@RequestMapping(value="jquery/boardwrite",method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView boardwrite(@ModelAttribute Board board, HttpSession session,MultipartFile file) throws IOException, Exception {
		
		 
		int result = 0; 
		String users = (String)session.getAttribute("userId");
		board.setUsers(users);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
			
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		board.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		board.setThumImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
			
		result = boardService.boardwrite(board);
		ModelAndView mav = new ModelAndView("redirect:/view/dashboard");
		return mav;
	}
	
	@RequestMapping(value="jquery/signUp",method = RequestMethod.POST)
	@ResponseBody
	public int signUp(Members members) {
		int result = 0; 
		String col = null;
		
		col = "userId";
		Members userIdCheck = userService.getUserOne(members.getUserId(),col);
		if(userIdCheck != null) {
		result = 2; 
		}
		
		col = "nickname";
		Members userNicknameCheck = userService.getUserOne(members.getNickname(),col);
		if(userNicknameCheck != null) { result = 3; }	
		
		if(result < 2) {
		result = userService.userJoin(members);	
		result = 1;
		}
		
		
		return result;
	}
	
	@RequestMapping(value="jquery/boardUpdate",method = RequestMethod.POST)
	@ResponseBody
	public int boardUpdate(Board board) {
		int result = 0; 
		
		
		
		result = boardService.boardUpdate(board ); 
		
		return result;
	}
	
	
	
	
}