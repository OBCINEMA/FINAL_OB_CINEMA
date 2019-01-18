package com.ob.biz.service;

import com.ob.biz.vo.UsersVO;

public interface Find_PasswordService {
//	void find_pw(HttpServletResponse response, UsersVO vo) throws Exception;
	void send_mail(UsersVO vo, String div) throws Exception;
	
}
