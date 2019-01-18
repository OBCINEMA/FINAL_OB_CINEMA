package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.PlusDAO;
import com.ob.biz.service.PlusService;
import com.ob.biz.vo.PlusVO;

@Service("plusService")
public class PlusServiceImpl implements PlusService {
	@Autowired
	private PlusDAO plusDAO;

	@Override
	public List<PlusVO> getPlusList() {
		return plusDAO.getPlusList();
	}

	@Override
	public List<PlusVO> getPlusTitlebyt_id(PlusVO vo) {
		return plusDAO.getPlusTitlebyt_id(vo);
	}

	@Override
	public PlusVO getPlusTitlebysch_id(PlusVO vo) {
		return plusDAO.getPlusTitlebysch_id(vo);
	}

}
