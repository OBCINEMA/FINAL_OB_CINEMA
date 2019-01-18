package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.MovieDAO;
import com.ob.biz.service.MovieService;
import com.ob.biz.vo.MovieVO;

//@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("movieService")
public class MovieServiceImpl implements MovieService {

	@Autowired
	private MovieDAO movieDAO;

	@Override
	public void insertMovie(MovieVO vo) {
		movieDAO.insertMovie(vo);
	}

	// 영화 투표수 초기화
	@Override
	public void updateMovieVoteTo0() {
		movieDAO.updateMovieVoteTo0();
	}
	
	@Override
	public void updateMovie(MovieVO vo) {
		movieDAO.updateMovie(vo);
	}

	@Override
	public void updateMovieOnair1() {
		movieDAO.updateMovieOnair1();
	}

	@Override
	public void updateMovieOnair0() {
		movieDAO.updateMovieOnair0();
	}

	@Override
	public void updateMoviePreair() {
		movieDAO.updateMoviePreair();
		
	}

	@Override
	public void deleteMovie(MovieVO vo) {
		movieDAO.deleteMovie(vo);
	}

	@Override
	public MovieVO getMovie(MovieVO vo) {

		return movieDAO.getMovie(vo);
	}

	@Override
	public List<MovieVO> getMovieList() {
		return movieDAO.getMovieList();
	}

	@Override
	public List<MovieVO> getMovieGnr() {
		return movieDAO.getMovieGnr();
	}
	
    @Override
    public MovieVO getMovieOne(MovieVO vo) {
       return movieDAO.getMovieOne(vo);
    }
    
	@Override
	public List<MovieVO> getMovieListByVote() {
		return movieDAO.getMovieListByVote();
	}

	@Override
	public List<MovieVO> getMovieListOnair() {
		return movieDAO.getMovieListOnair();
	}

	@Override
	public List<MovieVO> getMovieListPreair() {
		return movieDAO.getMovieListPreair();
	}
	
	@Override
	public List<MovieVO> getMovieListPreairGnr() {
		return movieDAO.getMovieListPreairGnr();
	}

	@Override
	public int updateMovieOnairOne(int m_id) {
		return movieDAO.updateMovieOnairOne(m_id);
	}

	@Override
	public int getCountMovie() {
		return movieDAO.getCountMovie();
	}
}