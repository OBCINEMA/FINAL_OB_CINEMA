package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.ScreenDAO;
import com.ob.biz.service.ScreenService;
import com.ob.biz.vo.ScreenVO;

@Service("screenService")
public class ScreenServiceImpl implements ScreenService {

	@Autowired
	private ScreenDAO screenDAO;

	@Override
	public List<ScreenVO> getScreenList() {
		return screenDAO.getScreenList();
	}

	@Override
	public ScreenVO getScrOne(ScreenVO screenVO) {
		return screenDAO.getScrOne(screenVO);
	}

	@Override
	public void upateScreen(ScreenVO vo) {
		screenDAO.updateScreen(vo);

	}

	@Override
	public int insertScreen(ScreenVO vo) {
		return screenDAO.insertScreen(vo);
	}

	@Override
	public void deleteScreen(ScreenVO vo) {
		screenDAO.deleteScreen(vo);
		
	}

	@Override
	public List<ScreenVO> getScrOne_m(ScreenVO screenVO) {
		return screenDAO.getScrOne_m(screenVO);
	
	}

	@Override
	public int getCountScreen() {
		return screenDAO.getCountScreen();
	}

}
