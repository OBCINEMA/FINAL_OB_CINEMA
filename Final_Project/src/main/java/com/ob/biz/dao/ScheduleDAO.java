package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.ScheduleVO;

@Repository("scheduleDAO") // 이름을 지정해주지 않으면 BoardDAOMybatis2클래스 이름 첫글자 소문자로
public class ScheduleDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 시간 조회
	public List<ScheduleVO> getSchList(ScheduleVO scheduleVO) {
		return mybatis.selectList("ScheduleDAO.getSchList", scheduleVO);
	}
	//아이디 조회
	public ScheduleVO getSchId(ScheduleVO scheduleVO) {
		return mybatis.selectOne("ScheduleDAO.getSchId", scheduleVO);
	}
	//상세조회
	public ScheduleVO getSchOne(ScheduleVO scheduleVO) {
		return mybatis.selectOne("ScheduleDAO.getSchOne", scheduleVO);
	}
	public int insertSchedule(ScheduleVO vo) {
		return mybatis.insert("ScheduleDAO.insertSchedule", vo);
	}
	public List<ScheduleVO> getTIME(ScheduleVO vo) {
		return mybatis.selectList("ScheduleDAO.getTIME",vo);
	}
	public int updateSchedule(ScheduleVO vo) {
		return mybatis.update("ScheduleDAO.updateSchedule",vo);
	}
	public Object deleteSchedule(ScheduleVO vo) {
		return mybatis.delete("ScheduleDAO.deleteSchedule",vo);
	}
	public int getCountSchedule() {
		return mybatis.selectOne("ScheduleDAO.getCountSchedule");
	}
	public ScheduleVO getScheduleOne(ScheduleVO vo) {
		return mybatis.selectOne("ScheduleDAO.getScheduleOne",vo);
	}
}
