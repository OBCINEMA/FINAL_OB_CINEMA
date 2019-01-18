package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.TheaterVO;

@Repository("theaterDAO")
public class TheaterDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<TheaterVO> getTheaterList(){
		return mybatis.selectList("TheaterDAO.getTheaterList");
		
	}
	
	public int insertTheater(TheaterVO vo) {
		return mybatis.insert("TheaterDAO.insertTheater", vo);
	}
	
	public TheaterVO getTheater(TheaterVO vo) {
		return mybatis.selectOne("TheaterDAO.getTheater",vo);
	}
	
	public void updateTheater(TheaterVO vo) {
		mybatis.insert("TheaterDAO.updateTheater", vo);
	}

	public void deleteTheater(TheaterVO vo) {
		mybatis.delete("TheaterDAO.deleteTheater", vo);
	}
	
	//극장 상세조회(정택)
	public TheaterVO getTheaterOne(TheaterVO vo) {
		return mybatis.selectOne("TheaterDAO.getTheaterOne", vo);
	}
	
	//해당영화 극장 조회
	public List<MovieVO> getTheater_movieList(int m_id) {
		return mybatis.selectList("TheaterDAO.getTheater_movieList",m_id);
		
	}

	public int getCountTheater() {
		return mybatis.selectOne("TheaterDAO.getCountTheater");
	}
}
