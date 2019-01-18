package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.ScreenVO;

@Repository("screenDAO")
public class ScreenDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<ScreenVO> getScreenList() {
		return mybatis.selectList("ScreenDAO.getScreenList");
	}

	public ScreenVO getScrOne(ScreenVO screenVO) {
		return mybatis.selectOne("ScreenDAO.getScrOne", screenVO);
	}

	public void updateScreen(ScreenVO vo) {
		mybatis.insert("ScreenDAO.updateScreen", vo);

	}

	public int insertScreen(ScreenVO vo) {
		return mybatis.insert("ScreenDAO.insertScreen", vo);
	}

	public void deleteScreen(ScreenVO vo) {
		mybatis.delete("ScreenDAO.deleteScreen", vo);		
	}
	
	public List<ScreenVO> getScrOne_m(ScreenVO screenVO) {
		return mybatis.selectList("ScreenDAO.getScrOne_m", screenVO);
	}

	public int getCountScreen() {
		return mybatis.selectOne("ScreenDAO.getCountScreen");
	}

}