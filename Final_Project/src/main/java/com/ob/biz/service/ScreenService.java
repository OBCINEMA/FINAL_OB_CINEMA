package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.ScreenVO;

public interface ScreenService {

	// 상영관 전체 조회
	List<ScreenVO> getScreenList();

	// 상영관 하나 조회
	ScreenVO getScrOne(ScreenVO screenVO);

	// 상영관 수정
	void upateScreen(ScreenVO vo);

	// 상영관 입력
	int insertScreen(ScreenVO vo);

	// 상영관 삭제
	void deleteScreen(ScreenVO vo);
	
	// m_id로 상영관 조회
	
	List<ScreenVO> getScrOne_m(ScreenVO screenVO);
	
	// 스크린 갯수 구하기
	int getCountScreen();

}
