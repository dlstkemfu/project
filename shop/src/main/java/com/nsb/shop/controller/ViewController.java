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
import com.nsb.shop.logic.Members;
import com.nsb.shop.logic.Page;
import com.nsb.shop.service.BoardService;
import com.nsb.shop.service.CommentsService;
import com.nsb.shop.service.KeepService;
import com.nsb.shop.service.UserService;

@Controller
@RequestMapping("view/*")
public class ViewController {

	@Autowired
	BoardService boardService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	KeepService keepService;
	
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
	// 게시물 수정
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
			page.setCount(boardService.searchCount( searchType, keyword));

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
		public ModelAndView categoryboard(@RequestParam("num") int num,@RequestParam("category") String category,@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
				   @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
			
			Page page = new Page();
			
			page.setNum(num);
			page.setCount(boardService.searchCount(category, searchType, keyword));

			page.setSearchType(searchType);
			page.setKeyword(keyword);
			List<Board> result =null;
			result =boardService.boardpageSearch(page.getDisplayPost(), page.getPostNum(), searchType , keyword, category);
			System.out.println(category);
			ModelAndView mav = new ModelAndView();
			mav.addObject("result" , result);
			mav.addObject("category" , category);
			mav.addObject("page", page);	
			mav.addObject("select", num);

			return mav;
			
	}
		
		//회원정보 수정
		@RequestMapping(value = "view/membersUpdateView", method = RequestMethod.GET)
		public ModelAndView membersUpdateView(String userId) {
			Members result = userService.getuserId(userId);
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", result);
			return mav;

		}
		
		// 찜 목록

		@RequestMapping(value = "view/KeepListView", method = RequestMethod.GET)
		public ModelAndView KeepList(String userId) {
			List result = keepService.getKeepList(userId);
			
		
			
			
			
			
		
			ModelAndView mav = new ModelAndView();
			mav.addObject("result", result);
			
			
		
			
			
			return mav;
		}
		
		// 찜 삭제

		@RequestMapping(value = "view/KeepDelete", method = RequestMethod.GET)
		public ModelAndView KeepDelete(@RequestParam("bno") int bno) {

			keepService.KeepDelete(bno);
			ModelAndView mav = new ModelAndView("redirect:/view/dashboard");
			return mav;

		}
		
		
	
	
	
	
	
	
	
	
	
	
	
	
}