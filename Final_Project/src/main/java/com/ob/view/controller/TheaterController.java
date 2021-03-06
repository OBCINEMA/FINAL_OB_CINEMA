package com.ob.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.ScheduleService;
import com.ob.biz.service.ScreenService;
import com.ob.biz.service.TheaterService;
import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;
import com.ob.biz.vo.TheaterVO;

@Controller
public class TheaterController {
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private ScreenService screenService;
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping("theater.do")
	@ResponseBody
//	public List<ScheduleVO> theater(TheaterVO theaterVO, ScreenVO screenVO, ScheduleVO scheduleVO, MovieVO movieVO
	public Map<String, Object> theater(TheaterVO theaterVO, ScreenVO screenVO, ScheduleVO scheduleVO, MovieVO movieVO
			, HttpServletRequest request, @RequestParam("t_id") String tt_id
			, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		scheduleVO.setT_id(theaterVO.getT_id());
		scheduleVO.setM_id(movieVO.getM_id());
		
		int t_id = Integer.parseInt(tt_id);
		
		TheaterVO theaterOne = new TheaterVO();
		theaterOne.setT_id(t_id);
		theaterOne = theaterService.getTheaterOne(theaterOne);
		
		List<ScheduleVO> scheduleList =scheduleService.getSchList(scheduleVO);
		
		map.put("scheduleList", scheduleList);
		map.put("theaterOne", theaterOne);
		
		return map;
	}
	@RequestMapping("theaterList.do")
	public String theaterList(TheaterVO theaterVO, Model model) {
		theaterVO = theaterService.getTheater(theaterVO);
		
		System.out.println("theaterList : " + theaterVO);
		
		model.addAttribute("theaterVO", theaterService.getTheater(theaterVO));
		
		return "/views/theater/theaterDetail.jsp";
	}
}











