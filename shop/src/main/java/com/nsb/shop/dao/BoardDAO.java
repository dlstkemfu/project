package com.nsb.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public int boardUpdate(Board board) {

		return sqlSession.update("boardUpdate", board);

	}
	
	public int boardcount() {
		return sqlSession.selectOne("boardcount");
	}
	
	public List<Board> boardpage(int displayPost, int postNum){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("displayPost", displayPost);
		map.put("postNum", postNum);
		
		return sqlSession.selectList("boardpage",map);
	}
	
	public List<Board> boardpageSearch(int displayPost, int postNum, String searchType, String keyword){
		HashMap<String, Object> map = new HashMap<String, Object>();
		  
		  map.put("displayPost", displayPost);
		  map.put("postNum", postNum);
		  
		  map.put("searchType", searchType);
		  map.put("keyword", keyword);
		  
		  return sqlSession.selectList("boardpageSearch",map);
	}
	
	// 게시물 총 갯수 + 검색 적용
		
		public int searchCount(String searchType, String keyword){
		 
		 HashMap data = new HashMap();
		 
		 data.put("searchType", searchType);
		 data.put("keyword", keyword);
		 
		 return sqlSession.selectOne("searchCount", data); 
		}
	

}
