package com.nsb.shop.service;

import java.util.List;

import com.nsb.shop.logic.Comments;

public interface CommentsService {
	
	
	
	
	//댓글 작성
	public int commentsWrite(Comments comt);
	
	//댓글 조회
	public List<Comments> commentsList(int id);
	
	//댓글 삭제
	public int commentsDelete(int cno);
	
	//댓글 수정
	public int commentsUpdate(int cno );
	
}
