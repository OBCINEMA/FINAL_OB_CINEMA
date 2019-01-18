package com.ob.view.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.MovieService;
import com.ob.biz.service.ReservationService;
import com.ob.biz.service.ScheduleService;
import com.ob.biz.service.ScreenService;
import com.ob.biz.service.TheaterService;
import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;
import com.ob.biz.vo.TheaterVO;

@Controller
public class ScheduleController {
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private ScreenService screenService;
	
	@Autowired
	private ReservationService reservationService;
	
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private TheaterService theaterService;
	
	@RequestMapping("schedule.do")
	public String schedule(ScheduleVO scheduleVO, MovieVO movieVO, ScreenVO screenVO, TheaterVO theaterVO
			, HttpServletRequest request, Model model) throws ParseException {
		
		movieVO = movieService.getMovieOne(movieVO);

		model.addAttribute("movieVO",movieVO);
		
		theaterVO = theaterService.getTheaterOne(theaterVO);
		
		model.addAttribute("theaterVO",theaterVO);
		
		screenVO = screenService.getScrOne(screenVO);
		
		model.addAttribute("screenVO", screenVO);
		
		//스케쥴 검색
		List<ReservationVO> reservationList = reservationService.getReservationList_id(scheduleVO);
		
		model.addAttribute("reservationList", reservationList);
		
		return "/views/reservation/screen.jsp";
	}
	
	@RequestMapping("schedule_pre.do")
	@ResponseBody
	public List<ReservationVO> schedule_pre(ScheduleVO scheduleVO, MovieVO movieVO, ScreenVO screenVO, TheaterVO theaterVO
			, HttpServletRequest request, Model model) throws ParseException {
		
		//스케쥴 검색
		List<ReservationVO> reservationList = reservationService.getReservationList_id(scheduleVO);
		
		return reservationList;
	}
}
