package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.No_UsersVO;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.UsersVO;

@Repository("reservationDAO")
public class ReservationDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertReservation(ReservationVO vo) {
		mybatis.insert("ReservationDAO.insertReservation", vo);
	}
	
	public void updateReservation(ReservationVO vo) {
		mybatis.update("ReservationDAO.updateReservation", vo);
	}
	
	public void deleteReservation(ReservationVO vo) {
		mybatis.delete("ReservationDAO.deleteReservation", vo);
	}
	
	//예매 조회(예약인덱스값)
	public ReservationVO getReservation(ReservationVO vo) {
		return mybatis.selectOne("ReservationDAO.getReservation", vo);
	}
	//예매 조회(회원) - 회원인덱스값
	public ReservationVO getReservation(UsersVO vo) {
		return mybatis.selectOne("ReservationDAO.getReservationUsers", vo);
	}
	//예매 조회(비회원) - 비회원인덱스값
	public ReservationVO getReservationNo_Users(No_UsersVO vo) {
		return mybatis.selectOne("ReservationDAO.getReservationNo_Users", vo);
	}
	//예매 조회(비회원) - 비회원 휴대폰번호값
	public ReservationVO getReservationNo_UsersPhone(No_UsersVO vo) {
		return mybatis.selectOne("ReservationDAO.getReservationNo_UsersPhone", vo);
	}
	
	//예매 전체조회
	public List<ReservationVO> getReservationList(){
		return mybatis.selectList("ReservationDAO.getReservationList");
	}
	//예매 전체조회(회원별)
	public List<ReservationVO> getReservationListUsers(UsersVO vo){
		return mybatis.selectList("ReservationDAO.getReservationListUsers");
	}
	//예매 전체조회(비회원별)
	public List<ReservationVO> getReservationListNo_Users(No_UsersVO vo){
		return mybatis.selectList("ReservationDAO.getReservationListNo_Users");
	}
	//예매 전체조회(비회원 휴대폰번호)
	public List<ReservationVO> getReservationListNo_UsersPhone(No_UsersVO vo){
		return mybatis.selectList("ReservationDAO.getReservationListNo_UsersPhone");
	}
	//예매 전체조회(영화,스크린,극장)
	public List<ReservationVO> getReservationList_id(ScheduleVO scheduleVO) {
		System.out.println("mybatis.selectList(\"ReservationDAO.getReservationList_id\", scheduleVO) : " + mybatis.selectList("ReservationDAO.getReservationList_id", scheduleVO));
		return mybatis.selectList("ReservationDAO.getReservationList_id", scheduleVO);
	}
}
