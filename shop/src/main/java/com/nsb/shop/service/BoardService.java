package com.nsb.shop.service;

import java.util.List;

import com.nsb.shop.logic.Board;
import com.nsb.shop.logic.BoardComments;

public interface BoardService {
	List getBoardList();

	int boardwrite(Board board);
	
	Board getBoardDetail(int id);
	void viewsUpdate(int id);
	int boardDelete(int id);
	int boardUpdate(Board board );
	int comments(BoardComments comt);
}