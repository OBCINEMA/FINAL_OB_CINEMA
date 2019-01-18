package com.ob.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.UsersVO;
@Repository("find_PasswordDAO")
public class Find_PasswordDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int update_pw(UsersVO vo) throws Exception{
		return mybatis.update("UsersDAO.update_pw", vo);
	}

}
