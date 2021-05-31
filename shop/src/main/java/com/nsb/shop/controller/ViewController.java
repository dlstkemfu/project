package com.nsb.shop.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.nsb.shop.logic.Board;
import com.nsb.shop.logic.Comments;
import com.nsb.shop.logic.Members;
import com.nsb.shop.service.BoardService;
import com.nsb.shop.service.CommentsService;

@Controller
@RequestMapping("view/*")
public class ViewController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	private CommentsService commentsservice;


	@RequestMapping("view/dashboard")
	public ModelAndView dashboard() {
		List result = boardService.getBoardList();
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);

		return mav;
	}

	@RequestMapping(value = "view/boardwrite", method = RequestMethod.GET)
	public ModelAndView boardwrite() {

		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	//게시물 조회
	
	@RequestMapping(value = "view/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(int id) {
		boardService.viewsUpdate(id);
		Board result = boardService.getBoardDetail(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		
		// 댓글 조회
				List<Comments> comments = null;
				comments = commentsservice.commentsList(id);
				
				mav.addObject("comments", comments);

		return mav;
	}

	@RequestMapping(value = "view/boardDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(@RequestParam("id") int id) {

		boardService.boardDelete(id);
		ModelAndView mav = new ModelAndView("redirect:/view/dashboard");
		return mav;

	}

	@RequestMapping(value = "view/boardUpdateView", method = RequestMethod.GET)
	public ModelAndView boardUpdateView(int id) {
		Board result = boardService.getBoardDetail(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		return mav;

	}
	
	
	
	


	
}