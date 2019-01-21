package com.ob.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.Pay_infoDAO;
import com.ob.biz.service.Pay_infoService;
import com.ob.biz.vo.Pay_infoVO;

@Service("Pay_infoService")
public class Pay_infoServiceImpl implements Pay_infoService{
	
	@Autowired
	private Pay_infoDAO pay_infoDAO;

	@Override
	public void insertPay_info(Pay_infoVO vo) {
		pay_infoDAO.insertPay_info(vo);
	}
}
