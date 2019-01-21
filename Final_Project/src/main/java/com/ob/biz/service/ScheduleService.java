package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;

public interface ScheduleService {
	
	//시간조회
	List<ScheduleVO> getSchList(ScheduleVO scheduleVO);
	
	//상세조회
	ScheduleVO getSchOne(ScheduleVO scheduleVO);
	
	//아이디 조회
	ScheduleVO getSchId(ScheduleVO scheduleVO);
	
	//스케쥴 입력
	
	// 상영관 입력
	int insertSchedule(ScheduleVO vo);
	
	//스케쥴 시간 구하기
	List<ScheduleVO> getTIME(ScheduleVO vo);
	
	//updateSchedule 스케쥴 업데이트 
	int updateSchedule(ScheduleVO vo);
	
	// 스케쥴 삭제
		void deleteSchedule(ScheduleVO vo);
		
		//메인에서 쓸 스케쥴 총 수
		int getCountSchedule();
	
	//스케쥴 조회 아이디로
	ScheduleVO getScheduleOne(ScheduleVO vo);
	
	
}
