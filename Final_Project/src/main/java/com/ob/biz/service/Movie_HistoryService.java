package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.Movie_HistoryVO;

public interface Movie_HistoryService {
	//영화상영내역 추가
	void insertMovie_History(Movie_HistoryVO vo);
	//현재상영중(onair=1)인 영화 movie_history에 추가
	void insertMovie_History_Onair();
	//영화상영내역 수정(상영날짜 수정)
	void updateMovie_History(Movie_HistoryVO vo);
	//영화 상영내역 삭제
	void deleteMovie_History(Movie_HistoryVO vo);
	//특정영화 상영내역 조회
	Movie_HistoryVO getMovie_History(Movie_HistoryVO vo);
	//영화 상영내역 전체조회
	List<Movie_HistoryVO> getMovie_HistoryList();
}
