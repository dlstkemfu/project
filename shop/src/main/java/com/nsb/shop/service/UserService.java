package com.nsb.shop.service;

import com.nsb.shop.logic.Members;

public interface UserService {

	Members getUserOne(String common, String col);

	int userJoin(Members members);

}