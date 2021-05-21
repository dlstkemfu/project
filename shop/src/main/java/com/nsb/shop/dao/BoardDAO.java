package com.nsb.shop.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.nsb.shop.logic.Board;

@Repository
public class BoardDAO {

	@Autowired
	public SqlSession sqlSession;

	public List<Board> getBoardList() {
		return sqlSession.selectList("getBoardList");
	}

	public int boardwrite(Board board) {
		 
		
		
		return sqlSession.insert("boardwrite", board);
	
	}

	public Board getBoardDetail(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		return sqlSession.selectOne("getBoardDetail", map);
	}

	public void viewUpdate(int id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		sqlSession.update("viewUpdate", map);
	}
	
	public int boardDelete(int id) {
		
		return sqlSession.delete("boardDelete", id);
	}
}