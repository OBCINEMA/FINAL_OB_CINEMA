package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.TheaterVO;

public interface TheaterService {

	// 극장 목록 전체 조회
	List<TheaterVO> getTheaterList();

	// 극장 입력
	int insertTheater(TheaterVO vo);

	// 극장 상세 조회
	TheaterVO getTheater(TheaterVO vo);

	// 극장 수정
	void upateTheater(TheaterVO vo);

	// 극장 삭제
	void deleteTheater(TheaterVO vo);

	// 극장 상세조회
	TheaterVO getTheaterOne(TheaterVO vo);

	// 선택 영화 극장 조회
	List<MovieVO> getTheater_movieList(int m_id);

	//관리자 메인에서 쓸것 theater 갯수 구하기
	int getCountTheater();

}
