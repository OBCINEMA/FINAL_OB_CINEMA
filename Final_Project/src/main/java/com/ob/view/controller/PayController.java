package com.ob.view.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.ob.biz.vo.UsersVO;

@Controller
public class PayController {
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private ScreenService screenService;
	
	@RequestMapping("pay.do")
	public String pay(ScheduleVO scheduleVO,ReservationVO reservationVO
			,@RequestParam("check_seat") String rowCol, HttpServletRequest request, Model model
			,HttpSession session,UsersVO usersVO) {
		
		String seats[] = request.getParameterValues("check_seat");
		
		String scheduleVODate = scheduleVO.getDate();
		
		scheduleVO = scheduleService.getSchOne(scheduleVO);
		
		scheduleVO.setDate(scheduleVODate);
		
		System.out.println("scheduleVO : " + scheduleVO);
		
		List<ReservationVO> reservationList = new ArrayList<>();
		for(String seat: seats) {
			reservationVO = new ReservationVO();
			usersVO = (UsersVO) session.getAttribute("Logininformation");
			reservationVO.setU_id(usersVO.getU_id());
			
			reservationVO.setSeat_row(Integer.parseInt(seat.substring(0,1)));
			reservationVO.setSeat_col(Integer.parseInt(seat.substring(1,2)));
			reservationVO.setSch_id(scheduleService.getSchId(scheduleVO).getSch_id());
			reservationVO.setPrice(scheduleVO.getPrice());
			
			//String to Date
			Date date = Date.valueOf(scheduleVO.getDate());
			reservationVO.setR_date(date);
			
//			System.out.println(reservationVO);
			reservationList.add(reservationVO);
		}
		int totPrice = 0;
		for (ReservationVO reservationOne : reservationList) {
			totPrice += Integer.parseInt(reservationOne.getPrice());
		}
		session.setAttribute("totPrice", totPrice);
//		scheduleVO.getM_id();
		
		MovieVO movieVO = new MovieVO();
		System.out.println("scheduleVO.getM_id() : " + scheduleVO.getM_id() );
		movieVO.setM_id(scheduleVO.getM_id());
		movieVO = movieService.getMovie(movieVO);
		
//		scheduleVO.getScr_id();
		ScreenVO screenVO = new ScreenVO();
		screenVO.setScr_id(scheduleVO.getScr_id());
		screenVO = screenService.getScrOne(screenVO);
		
//		theater
		TheaterVO theaterVO = new TheaterVO();
		theaterVO.setT_id(scheduleVO.getT_id());
		theaterVO = theaterService.getTheater(theaterVO);
		
		
		request.setAttribute("movieVO", movieVO);
		request.setAttribute("screenVO", screenVO);
		request.setAttribute("theaterVO", theaterVO);
		request.setAttribute("time", scheduleVO.getTime());
		session.setAttribute("reservationList", reservationList);
		
		return "/views/reservation/pay.jsp";
	}
	
	@RequestMapping("seat.do")
	@ResponseBody
	public String seat(HttpServletRequest request) {
		
		String seat = request.getParameter("rowCol");
		
		return seat;
	}
}



