package com.nsb.shop.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nsb.shop.logic.Board;
import com.nsb.shop.logic.Members;


import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository
public class UserDAO {

	@Autowired
	public SqlSession sqlSession;
	

	public Members getUserOne(String common, String col) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (col.equals("userId")) {
			map.put("userId", common);
		} else if (col.equals("nickname")) {
			map.put("nickname", common);
		}
		return sqlSession.selectOne("getUserOne", map);
	}
	
		
	

	public int userJoin(Members members) {
		return sqlSession.insert("userJoin", members);
	}
	
	//회원정보 수정
	public int memberUpdate(Members members) {

		return sqlSession.update("memberUpdate", members);

	}
	
	//회원정보 가져오기
	public Members getUserId(String userId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		return sqlSession.selectOne("getUserId", map);
	}

}