package com.nsb.shop.service;

import java.util.List;

import com.nsb.shop.logic.Board;


public interface BoardService {
	List getBoardList();

	int boardwrite(Board board);
	
	Board getBoardDetail(int id);
	void viewsUpdate(int id);
	int boardDelete(int id);
	int boardUpdate(Board board );
	int boardcount();
	List boardpage(int displayPost, int postNum);
	List boardpageSearch(int displayPost, int postNum, String searchType, String keyword, String category);
	int searchCount(String category, String searchType, String keyword);

	// 카테고리 별 리스트
	List categoryboard(String category);
}