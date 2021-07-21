package com.nsb.shop.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.nsb.shop.logic.Keep;


@Repository
public class KeepDAO {
	
	@Autowired
	public SqlSession sqlSession;
	//찜하기
	public int Keep(Keep keep) {

		return sqlSession.insert("Keep",keep);

	}
	//찜목록
	public List<Keep> getKeepList(String userId) {
		
		return sqlSession.selectList("getKeepList", userId);
	}
	//찜삭제
	public int KeepDelete(int bno) {
		
		return sqlSession.delete("KeepDelete", bno );
	}
	
}
