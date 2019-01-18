package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.ReservationDAO;
import com.ob.biz.service.ReservationService;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public void insertReservation(ReservationVO vo) {
		reservationDAO.insertReservation(vo);
	}

	@Override
	public void updateReservation(ReservationVO vo) {
		reservationDAO.updateReservation(vo);
	}
	
	@Override
	public void deleteReservation(ReservationVO vo) {
		reservationDAO.deleteReservation(vo);
	}

	@Override
	public ReservationVO getReservation(ReservationVO vo) {
		return reservationDAO.getReservation(vo);
	}

	@Override
	public List<ReservationVO> getReservationList() {
		return reservationDAO.getReservationList();
	}
	
	@Override
	public List<ReservationVO> getReservationList_id(ScheduleVO scheduleVO) {
		return reservationDAO.getReservationList_id(scheduleVO);
	}

}
