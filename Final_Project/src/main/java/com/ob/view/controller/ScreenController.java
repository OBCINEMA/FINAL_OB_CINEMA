package com.ob.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.ReservationService;
import com.ob.biz.service.ScreenService;
import com.ob.biz.vo.ReservationVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;
import com.ob.biz.vo.TheaterVO;

@Controller
public class ScreenController {
	@Autowired
	private ScreenService screenService;
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping("screen.do")
	public String screen(ScreenVO vo) {
		return "/views/index.jsp";
	}
	
	//상영관 좌석 조회
	@RequestMapping("screenSeat.do")
	@ResponseBody
	public ScreenVO theater(TheaterVO vo, ScreenVO screenVO, ScheduleVO scheduleVO
			, HttpServletRequest request
			, Model model) {
		
		int scr_id = scheduleVO.getScr_id();
		
		screenVO.setScr_id(scr_id);
		
		ScreenVO scrVO = screenService.getScrOne(screenVO);
		
		//남은 좌석 구하기
		List<ReservationVO> reservationList = reservationService.getReservationList_id(scheduleVO);
		
		int rest = Integer.parseInt(scrVO.getScr_seat_tot())-reservationList.size();
		
		scrVO.setRestSeat(rest);
		
		//스케쥴 검색
//		Litpalst<ReservationVO> reservationList = reservationService.getReservationList_id(scheduleVO);
		
//		model.addAttribute("reservationList", reservationList);
		
//		return "/views/screen.jsp";
		
		return scrVO;
	}
}











