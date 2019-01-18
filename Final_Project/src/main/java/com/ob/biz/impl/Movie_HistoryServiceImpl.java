package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.Movie_HistoryDAO;
import com.ob.biz.service.Movie_HistoryService;
import com.ob.biz.vo.Movie_HistoryVO;

@Service("movie_HistoryService")
public class Movie_HistoryServiceImpl implements Movie_HistoryService{
	@Autowired
	private Movie_HistoryDAO movie_HistoryDAO;

	@Override
	public void insertMovie_History(Movie_HistoryVO vo) {
		movie_HistoryDAO.insertMovie_History(vo);
	}
	
	//현재상영중(onair=1)인 영화 movie_history에 추가
	@Override
	public void insertMovie_History_Onair() {
		movie_HistoryDAO.insertMovie_History_Onair();
	}

	@Override
	public void updateMovie_History(Movie_HistoryVO vo) {
		movie_HistoryDAO.updateMovie_History(vo);
	}
	
	@Override
	public void deleteMovie_History(Movie_HistoryVO vo) {
		movie_HistoryDAO.deleteMovie_History(vo);
	}

	@Override
	public Movie_HistoryVO getMovie_History(Movie_HistoryVO vo) {
		return movie_HistoryDAO.getMovie_History(vo);
	}

	@Override
	public List<Movie_HistoryVO> getMovie_HistoryList() {
		return movie_HistoryDAO.getMovie_HistoryList();
	}


	
	
}
