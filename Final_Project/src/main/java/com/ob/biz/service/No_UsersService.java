package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.No_UsersVO;

public interface No_UsersService {
	void insertNo_Users(No_UsersVO vo);
	void deleteNo_Users(No_UsersVO vo);
	No_UsersVO getNo_Users(No_UsersVO vo);
	List<No_UsersVO> getNo_UsersList();
}
