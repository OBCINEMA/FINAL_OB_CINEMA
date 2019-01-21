package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.UsersVO;

public interface ReservationService {
	void insertReservation(ReservationVO vo);
	void updateReservation(ReservationVO vo);
	void deleteReservation(ReservationVO vo);
	ReservationVO getReservation(ReservationVO vo);
	List<ReservationVO> getReservationList();
	
	//예매조회(영화,스크린,극장)
	List<ReservationVO> getReservationList_id(ScheduleVO scheduleVO);
	
	List<ReservationVO> getReservationListUsers(UsersVO usersVO);
}
