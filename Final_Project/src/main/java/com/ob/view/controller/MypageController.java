package com.ob.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ob.biz.service.MovieService;
import com.ob.biz.service.ReservationService;
import com.ob.biz.service.ScheduleService;
import com.ob.biz.service.ScreenService;
import com.ob.biz.service.TheaterService;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;
import com.ob.biz.vo.TheaterVO;
import com.ob.biz.vo.UsersVO;

@Controller
@SessionAttributes("theaterList")
public class MypageController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ScreenService screenService;
	@Autowired
	private TheaterService theaterService;
	
	@RequestMapping(value="/mypage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String mypage(Model model) {
		
		return "/views/mypage/myReservation.jsp";
	}
	
	@RequestMapping(value="/myReservation.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String myReservation(Model model,HttpSession session,HttpServletRequest request) {
		UsersVO usersVO = new UsersVO();
		usersVO = (UsersVO) session.getAttribute("Logininformation");
//		System.out.println("usersVO : " + usersVO);
		List<ReservationVO> reservationList = reservationService.getReservationListUsers(usersVO);
//		System.out.println("reservationService.getReservationListUsers(usersVO) : " + reservationService.getReservationListUsers(usersVO));
		
		ScheduleVO scheduleVO = new ScheduleVO();
		MovieVO movieVO = new MovieVO();
		ScreenVO screenVO = new ScreenVO();
		TheaterVO theaterVO = new TheaterVO();
		
		List<ScheduleVO> scheduleList = new ArrayList<ScheduleVO>();
		List<MovieVO> movieList = new ArrayList<MovieVO>();
		List<ScreenVO> screenList = new ArrayList<ScreenVO>();
		List<TheaterVO> theaterList = new ArrayList<TheaterVO>();
		
		for(ReservationVO reservationVO : reservationList) {
			scheduleVO.setSch_id(reservationVO.getSch_id());
			scheduleVO = scheduleService.getScheduleOne(scheduleVO);
			System.out.println("scheduleVO : " + scheduleVO);
			scheduleList.add(scheduleVO);
			System.out.println(scheduleList);
			
			movieVO.setM_id(scheduleVO.getM_id());
			movieVO = movieService.getMovie(movieVO);
			System.out.println("movieVO : " + movieVO);
			movieList.add(movieVO);
			System.out.println(movieList);
			
			screenVO.setScr_id(scheduleVO.getScr_id());
			screenVO = screenService.getScrOne(screenVO);
			System.out.println("screenVO : " + screenVO);
			screenList.add(screenVO);
			System.out.println(screenList);
			
			theaterVO.setT_id(scheduleVO.getT_id());
			theaterVO = theaterService.getTheater(theaterVO);
			System.out.println("theaterVO : " + theaterVO);
			theaterList.add(theaterVO);
			System.out.println(theaterList);
		}
		request.setAttribute("reservationList", reservationList);
		request.setAttribute("scheduleList", scheduleList);
		request.setAttribute("movieList", movieList);
		request.setAttribute("screenList", screenList);
		request.setAttribute("theaterList", theaterList);
		
		return "/views/mypage/myReservation.jsp";
	}
	
	@RequestMapping(value="/updateUsersGo.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String updateUsersGo(HttpSession session) {
		return "/views/mypage/updateUsers.jsp";
	}
	
	@RequestMapping(value="/deleteRes.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String deleteReservation(ReservationVO vo) {
		reservationService.deleteReservation(vo);
		return "/myReservation.do";
	}
	
	@RequestMapping(value="/updateUsers.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String updateUsers(UsersVO uvo, HttpSession session) {
		System.out.println("MypageController - updateUsers실행");
		System.out.println("uvo : " + uvo);
		
		String result = "fail";

		usersService.updateUsers(uvo);
		session.setAttribute("Logininformation", uvo);
		
		result = "success";
		
		return result;
	}
}
