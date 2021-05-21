package com.nsb.shop.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.nsb.shop.logic.Board;

public interface BoardService {
	List getBoardList();

	int boardwrite(Board board);
	
	Board getBoardDetail(int id);
	void viewsUpdate(int id);
	int boardDelete(int id);
}