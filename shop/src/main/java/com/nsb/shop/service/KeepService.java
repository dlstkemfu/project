package com.nsb.shop.service;

import java.util.List;

import com.nsb.shop.logic.Keep;

public interface KeepService {
	
	int Keep(Keep keep);
	List getKeepList(String userId);
	
	int KeepDelete(int bno );
}
