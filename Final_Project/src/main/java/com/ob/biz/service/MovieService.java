package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.MovieVO;

public interface MovieService {
	// CRUD 기능 구현 메소드 정의
	// 영화 입력
	void insertMovie(MovieVO vo);

	// 영화 수정
	void updateMovie(MovieVO vo);
	
	// 영화 투표수 초기화
	void updateMovieVoteTo0();

	//상영예정(ONAIR=-1) -> 상영중(ONAIR=1)
	void updateMovieOnair1();
	
	//상영중(ONAIR=1) -> 상영종료(ONAIR=0)
	void updateMovieOnair0();
	
	//득표수 상위 5개 영화 -> 상영예정(ONAIR=-1)
	void updateMoviePreair();

	// 영화 삭제
	void deleteMovie(MovieVO vo);

	// 영화 상세 조회
	MovieVO getMovieOne(MovieVO vo);

	MovieVO getMovie(MovieVO vo);

	// 영화 목록 전체 조회
	List<MovieVO> getMovieList();

	//상영중 상태인 영화 목록 조회
	List<MovieVO> getMovieListOnair();
	
	//상영예정 상태인 영화 목록 조회
	List<MovieVO> getMovieListPreair();
	
	//상영예정 상태인 영화 목록 조회(장르별)
	List<MovieVO> getMovieListPreairGnr();
	
	// 보고싶은 명화 득표수 상위 5개 영화 조회
	List<MovieVO> getMovieListByVote();

	// 영화 장르 전체 조회
	List<MovieVO> getMovieGnr();
	
	// 영화 m_id 한개를 상영예정(-1) -> 상영중(1) 바꾸기
	int  updateMovieOnairOne(int m_id);
	
	//관리자 메인에서 쓸것 movie 갯수 구하기
	int getCountMovie();

}