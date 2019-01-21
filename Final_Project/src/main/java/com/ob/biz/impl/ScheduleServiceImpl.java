package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.ScheduleDAO;
import com.ob.biz.service.ScheduleService;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	
	@Autowired
	private ScheduleDAO scheduleDAO;

	@Override
	public List<ScheduleVO> getSchList(ScheduleVO scheduleVO) {
		return scheduleDAO.getSchList(scheduleVO);
	}

	@Override
	public ScheduleVO getSchId(ScheduleVO scheduleVO) {
		return scheduleDAO.getSchId(scheduleVO);
	}

	@Override
	public ScheduleVO getSchOne(ScheduleVO scheduleVO) {
		return scheduleDAO.getSchOne(scheduleVO);
	}

	@Override
	public int insertSchedule(ScheduleVO vo) {
		return scheduleDAO.insertSchedule(vo);
	}

	@Override
	public List<ScheduleVO> getTIME(ScheduleVO vo) {
		return scheduleDAO.getTIME(vo);
	}

	@Override
	public int updateSchedule(ScheduleVO vo) {
		return scheduleDAO.updateSchedule(vo);
	}

	@Override
	public void deleteSchedule(ScheduleVO vo) {
		 scheduleDAO.deleteSchedule(vo);
		
	}

	@Override
	public int getCountSchedule() {
		return scheduleDAO.getCountSchedule();
	}

	@Override
	public ScheduleVO getScheduleOne(ScheduleVO vo) {
		return scheduleDAO.getScheduleOne(vo);
	}

}
