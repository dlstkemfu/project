package com.nsb.shop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsb.shop.dao.UserDAO;
import com.nsb.shop.logic.Members;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public Members getUserOne(String common, String col) {
		return userDAO.getUserOne(common, col);
	}

	@Override
	public int userJoin(Members members) {
		return userDAO.userJoin(members);
	}

	// 회원정보 수정
	@Override
	public int memberUpdate(Members members) {

		return userDAO.memberUpdate(members);
	}
	
	//회원정보 가져오기
	@Override
	public Members getuserId(String userId) {
		return userDAO.getUserId(userId);
	}
}