package com.nsb.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsb.shop.dao.BoardDAO;
import com.nsb.shop.logic.Board;


@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	public List<Board> getBoardList() {
		return boardDAO.getBoardList();
	}
	
	@Override
	public int boardwrite(Board board) {
	return boardDAO.boardwrite(board);}
	
	@Override
	public Board getBoardDetail(int id) {
	return boardDAO.getBoardDetail(id);}

	@Override
	public void viewsUpdate(int id) {
	boardDAO.viewUpdate(id);}
	
	@Override
	public int boardDelete(int id) {
	return boardDAO.boardDelete(id);}

	
	@Override
	public int boardUpdate(Board board ) {
	return boardDAO.boardUpdate(board);}
	
	@Override
	public int boardcount() {
		return boardDAO.boardcount();
	}
	
	@Override
	public List<Board> boardpage(int displayPost, int postNum){
		return boardDAO.boardpage(displayPost, postNum);
	}
	
	@Override
	public List<Board> boardpageSearch(int displayPost, int postNum, String searchType, String keyword ,String category){
		return boardDAO.boardpageSearch(displayPost, postNum, searchType, keyword, category);
	}
	
	@Override
	public List<Board> viewslist(int displayPost, int postNum, String searchType, String keyword){
		return boardDAO.viewslist(displayPost, postNum, searchType, keyword);
	}
	
	@Override
	public int searchcategoryCount(String category,String searchType, String keyword) {
		return boardDAO.searchcategoryCount(category, searchType, keyword);
		
	}
	
	@Override
	public int searchCount(String searchType, String keyword) {
		return boardDAO.searchCount(searchType, keyword);
		
	} 
	
	//카테고리 별 게시판
	
	public List<Board> categoryboard(String category){
		return boardDAO.categoryboard(category);
	}
	
	
	
	
}