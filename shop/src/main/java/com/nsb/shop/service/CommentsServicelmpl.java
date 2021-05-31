package com.nsb.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsb.shop.dao.CommentsDAO;
import com.nsb.shop.logic.Comments;

@Service
public class CommentsServicelmpl implements CommentsService {
	
	@Autowired
	CommentsDAO commentsDAO;
	
	//댓글 작성
	@Override
	public int commentsWrite(Comments comt) {
		return commentsDAO.commentsWrite(comt);
	}
	
	//댓글 조회
	@Override
	public List<Comments> commentsList(int id){
		return commentsDAO.commentsList(id);
	}
	

}
