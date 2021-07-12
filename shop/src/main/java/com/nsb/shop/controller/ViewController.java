package com.nsb.shop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nsb.shop.logic.Board;
import com.nsb.shop.logic.Comments;
import com.nsb.shop.logic.Page;
import com.nsb.shop.service.BoardService;
import com.nsb.shop.service.CommentsService;

@Controller
@RequestMapping("view/*")
public class ViewController {

	@Autowired
	BoardService boardService;

	@Autowired
	private CommentsService commentsservice;

	// 게시판 목록

	@RequestMapping("view/dashboard")
	public ModelAndView dashboard() {
		List result = boardService.getBoardList();
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);

		return mav;
	}

	// 게시판 작성
	@RequestMapping(value = "view/boardwrite", method = RequestMethod.GET)
	public ModelAndView boardwrite() {

		ModelAndView mav = new ModelAndView();
		return mav;
	}

	// 게시물 조회

	@RequestMapping(value = "view/boardDetail", method = RequestMethod.GET)
	public ModelAndView boardDetail(int id) {
		boardService.viewsUpdate(id);
		Board result = boardService.getBoardDetail(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);

		// (댓글 조회)

		List<Comments> comments = null;
		comments = commentsservice.commentsList(id);

		mav.addObject("comments", comments);

		return mav;
	}

	// 게시물 삭제

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

	// 댓글 삭제

	@RequestMapping(value = "view/commentsDelete", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView commentsDelete(@RequestParam("cno") int cno) {

		commentsservice.commentsDelete(cno);
		ModelAndView mav = new ModelAndView("redirect:/view/dashboard");
		return mav;

	}

	// 댓글 수정

	@RequestMapping(value = "view/commentsUpdateView", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView commentsUpdate(int id, int cno) {

		boardService.viewsUpdate(id);
		Board result = boardService.getBoardDetail(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);

		// (댓글 조회)

		Comments comments = commentsservice.getCommentsDetail(cno);

		mav.addObject("comments", comments);

		return mav;
	}
	
	//게시판 페이지
	
		@RequestMapping(value = "view/boardpage" , method = RequestMethod.GET)
		public ModelAndView dashboardpage(@RequestParam("num") int num,
				@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
				   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
			
			Page page = new Page();
			
			page.setNum(num);
			page.setCount(boardService.searchCount(searchType, keyword));

			page.setSearchType(searchType);
			page.setKeyword(keyword);
			
			List<Board> list = null;
			list = boardService.boardpageSearch(page.getDisplayPost(), page.getPostNum(), searchType , keyword);
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("list" , list);
			
			mav.addObject("page", page);
			mav.addObject("select", num);
			
			return mav;
		}
			
		
		@RequestMapping(value = "view/categoryboard",method = RequestMethod.GET)
		public ModelAndView categoryboard(String category) {
			List result =boardService.categoryboard(category);
			ModelAndView mav = new ModelAndView();
			System.out.print(category);
			mav.addObject("result", result);

			return mav;
			
	}
	
	
	
	
	
	
	
	
	
	
	
	
}