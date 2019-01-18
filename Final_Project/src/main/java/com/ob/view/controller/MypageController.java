package com.ob.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

@Controller
public class MypageController {
	@Autowired
	private UsersService usersService;

	@RequestMapping(value="/mypage.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String mypage(Model model) {
		
		return "/views/mypage/myReservation.jsp";
	}
	
	@RequestMapping(value="/myReservation.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String myReservation(Model model) {
		
		return "/views/mypage/myReservation.jsp";
	}
	
	@RequestMapping(value="/updateUsersGo.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String updateUsersGo(HttpSession session) {
		return "/views/mypage/updateUsers.jsp";
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
