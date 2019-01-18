package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.UsersDAO;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

@Service("usersService")
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersDAO usersDAO;

	@Override
	public void insertUsers(UsersVO vo) {
		usersDAO.insertUsers(vo);
	}

	@Override
	public void updateUsers(UsersVO vo) {
		System.out.println("usersServiceImpl - updateUsers실행. uvo : " + vo);
		usersDAO.updateUsers(vo);
	}
	
	@Override
	public void updateUsersVote(UsersVO vo) {
		usersDAO.updateUsersVote(vo);
	}
	
	@Override
	public void resetVotedMovie() {
		usersDAO.resetVotedMovie();
	}

	@Override
	public void deleteUsers(UsersVO vo) {
		usersDAO.deleteUsers(vo);
	}

	@Override
	public UsersVO getUsers(UsersVO vo) {
		return usersDAO.getUsers(vo);
	}

	@Override
	public List<UsersVO> getUsersList() {
		return usersDAO.getUsersList();
	}

	@Override
	public UsersVO getUserOne(UsersVO vo) {
		return usersDAO.getUserOne(vo);
	}

	public int idcheck(UsersVO vo) {
		return usersDAO.idcheck(vo);
	}

	@Override
	public UsersVO getApiUsers(UsersVO vo) {
		// TODO Auto-generated method stub
		return usersDAO.getApiUsers(vo);
	}

	@Override
	public int updateUsersEmail(UsersVO vo) {
		return usersDAO.updateUsersEmail(vo);
	}

	@Override
	public String findIDchk(UsersVO vo) {
		return usersDAO.findIDchk(vo);
	}

	@Override
	public int findPWchk(UsersVO vo) {
		return usersDAO.findPWchk(vo);
	}

	@Override
	public int update_pw(UsersVO vo) {
		return usersDAO.update_pw(vo);
	}



}
