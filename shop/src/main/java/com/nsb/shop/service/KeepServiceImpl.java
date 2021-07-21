package com.nsb.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nsb.shop.dao.KeepDAO;
import com.nsb.shop.logic.Keep;

@Service
public class KeepServiceImpl implements KeepService {

	@Autowired
	KeepDAO keepDAO;
	
	@Override
	public int Keep(Keep keep) {
	return keepDAO.Keep(keep);
	}
	
	
	public List<Keep> getKeepList(String userId){
		return keepDAO.getKeepList(userId);
	}
	
	
	
	@Override
	public  int KeepDelete(int bno ) {
		return keepDAO.KeepDelete(bno);
	}
}
