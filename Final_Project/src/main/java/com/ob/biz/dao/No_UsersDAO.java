package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.No_UsersVO;

@Repository("no_UsersDAO")
public class No_UsersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertNo_users(No_UsersVO vo) {
		mybatis.insert("No_UsersDAO.insertNo_Users", vo);
	}
	
	public void deleteNo_Users(No_UsersVO vo) {
		mybatis.delete("No_UsersDAO.deleteNo_Users", vo);
	}
	
	public No_UsersVO getNo_Users(No_UsersVO vo) {
		return mybatis.selectOne("No_UsersDAO.getNo_Users",vo);
	}
	
	public List<No_UsersVO> getNo_UsersList(){
		return mybatis.selectList("No_UsersDAO.getNo_UsersList");
	}
}
