package com.ob.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.Pay_infoVO;

@Repository("Pay_infoDAO")
public class Pay_infoDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertPay_info(Pay_infoVO vo) {
		mybatis.insert("Pay_infoDAO.insertPay_info", vo);
	}
}
