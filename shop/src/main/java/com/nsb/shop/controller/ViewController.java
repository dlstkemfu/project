package com.nsb.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public ModelAndView dashboardpage(@RequestParam("num") int num) {
		
		//게시물 총 갯수
		int boardcount =boardService.boardcount();
		
		//한 페이지에 출력할 게시물 갯수
		int postNum = 10;
		
		// 하단 페이지 번호 ([게시물총갯수 / 한 페이지에 출력할 갯수] 의 올림)
		int pageNum = (int)Math.ceil((double)boardcount/postNum);
		
		// 출력할 게시물
		int displayPost = (num - 1) * postNum;
		
		// 한번에 표시할 페이징 번호의 갯수
		int pageNum_cnt = 10;
		
		// 표시되는 페이지 번호중 마지막 번호
		int endpageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		
		//표시되는 페이지 번호중 첫번째 번호
		int startPageNum = endpageNum - (pageNum_cnt - 1);
		
		// 마지막 번호 재계산
		int endpageNum_tmp = (int)(Math.ceil((double)boardcount / (double)pageNum_cnt));
		 
		if(endpageNum > endpageNum_tmp) {
			endpageNum = endpageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endpageNum * pageNum_cnt >= boardcount ? false : true;
		
		
		
		
		List result = boardService.boardpage(displayPost, postNum);
		ModelAndView mav = new ModelAndView();

		mav.addObject("result", result);
		mav.addObject("pageNum" , pageNum);
		
		// 시작 및 끝 번호
		mav.addObject("startPageNum", startPageNum);
		mav.addObject("endpageNum", endpageNum);

				// 이전 및 다음 
		mav.addObject("prev", prev);
		mav.addObject("next", next);

		return mav;

}
	
	
	
	
	
	
	
	
	
	
	
	
}