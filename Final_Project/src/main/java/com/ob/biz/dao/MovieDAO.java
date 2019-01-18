package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.MovieVO;

@Repository("movieDAO")
public class MovieDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertMovie(MovieVO vo) {
		mybatis.insert("MovieDAO.insertMovie", vo);
	}

	public void updateMovie(MovieVO vo) {
		mybatis.update("MovieDAO.updateMovie", vo);
	}
	
	//영화 투표수 초기화
	public void updateMovieVoteTo0() {
		mybatis.update("MovieDAO.updateMovieVoteTo0");
	}
	
	//상영예정(ONAIR=-1) -> 상영중(ONAIR=1)
	public void updateMovieOnair1() {
		mybatis.update("MovieDAO.updateMovieOnair1");
	}
	
	//상영중(ONAIR=1) -> 상영종료(ONAIR=0)
	public void updateMovieOnair0() {
		mybatis.update("MovieDAO.updateMovieOnair0");
	}
	
	//득표수 상위 5개 영화 -> 상영예정(ONAIR=-1)
	public void updateMoviePreair() {
		mybatis.update("MovieDAO.updateMoviePreair");
	}

	public void deleteMovie(MovieVO vo) {
		mybatis.delete("MovieDAO.deleteMovie", vo);
	}

	public MovieVO getMovie(MovieVO vo) {
		return mybatis.selectOne("MovieDAO.getMovie", vo);
	}

	public List<MovieVO> getMovieList() {
		return mybatis.selectList("MovieDAO.getMovieList");
	}

	//상영중 상태인 영화 목록 조회
	public List<MovieVO> getMovieListOnair() {
		return mybatis.selectList("MovieDAO.getMovieListOnair");
	}
	
	//상영예정 상태인 영화 목록 조회
	public List<MovieVO> getMovieListPreair() {
		return mybatis.selectList("MovieDAO.getMovieListPreair");
	}
	
	//상영예정 상태인 영화 목록 조회(장르별)
	public List<MovieVO> getMovieListPreairGnr() {
		return mybatis.selectList("MovieDAO.getMovieListPreairGnr");
	}
	
	//득표수 상위 5개 영화 목록 조회(득표수 내림차순, 영화제목순)
	public List<MovieVO> getMovieListByVote() {
		return mybatis.selectList("MovieDAO.getMovieListByVote");
	}

	public List<MovieVO> getMovieGnr() {
		return mybatis.selectList("MovieDAO.getMovieGnr");
	}
	
	public MovieVO getMovieOne(MovieVO vo) {
		return mybatis.selectOne("MovieDAO.getMovieOne", vo);
	}

	public int updateMovieOnairOne(int m_id) {
		return mybatis.update("MovieDAO.updateMovieOnairOne", m_id);
	}

	public int getCountMovie() {
		return mybatis.selectOne("MovieDAO.getCountMovie");
	}
}