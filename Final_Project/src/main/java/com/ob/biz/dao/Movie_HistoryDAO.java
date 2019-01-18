package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.Movie_HistoryVO;

@Repository("movie_HistoryDAO")
public class Movie_HistoryDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertMovie_History(Movie_HistoryVO vo) {
		mybatis.insert("Movie_HistoryDAO.insertMovie_History",vo);
	}
	
	//현재상영중(onair=1)인 영화 movie_history에 추가
	public void insertMovie_History_Onair() {
		mybatis.insert("Movie_HistoryDAO.insertMovie_History_Onair");
	}
	
	public void updateMovie_History(Movie_HistoryVO vo) {
		mybatis.update("Movie_HistoryDAO.updateMovie_History",vo);		
	}
	
	public void deleteMovie_History(Movie_HistoryVO vo) {
		mybatis.delete("Movie_HistoryDAO.deleteMovie_History",vo);
	}
	
	public Movie_HistoryVO getMovie_History(Movie_HistoryVO vo) {
		return mybatis.selectOne("Movie_HistoryDAO.getMovie_History",vo);
	}
	
	public List<Movie_HistoryVO> getMovie_HistoryList(){
		return mybatis.selectList("Movie_HistoryDAO.getMovie_HistoryList");
	}
}
