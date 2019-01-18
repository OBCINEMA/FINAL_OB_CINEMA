package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.No_UsersDAO;
import com.ob.biz.service.No_UsersService;
import com.ob.biz.vo.No_UsersVO;

@Service("no_UsersService")
public class No_UsersServiceImpl implements No_UsersService{
	@Autowired
	private No_UsersDAO no_UsersDAO;

	@Override
	public void insertNo_Users(No_UsersVO vo) {
		no_UsersDAO.insertNo_users(vo);
	}

	@Override
	public void deleteNo_Users(No_UsersVO vo) {
		no_UsersDAO.deleteNo_Users(vo);
	}

	@Override
	public No_UsersVO getNo_Users(No_UsersVO vo) {
		return no_UsersDAO.getNo_Users(vo);
	}

	@Override
	public List<No_UsersVO> getNo_UsersList() {
		return no_UsersDAO.getNo_UsersList();
	}
	
}
