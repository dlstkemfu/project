package com.nsb.shop.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsb.shop.logic.Comments;

@Repository
public class CommentsDAO {

	@Autowired
	public SqlSession sqlSession;
	
	

	// 댓글 작성
	
	public int commentsWrite(Comments comt){
		return sqlSession.insert("commentsWrite", comt);
	}
	
	// 댓글 조회
		
		public List<Comments> commentsList(int id){
			return sqlSession.selectList("commentsList", id);
		}

	// 댓글 삭제
		
		public int commentsDelete (int cno) {
			return sqlSession.delete("commentsDelete" , cno );
		}
	// 댓글 수정
		
		public int commentsUpdate(int cno ) {
			return sqlSession.update("commentsUpdate",cno);
		}
	
}

