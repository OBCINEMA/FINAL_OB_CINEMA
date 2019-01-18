package com.ob.view.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

@Controller
public class PayControllerTest {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping("payTest.do")
	public String pay(Model model,HttpServletRequest request) {
		
		UsersVO usersVO = new UsersVO();
		usersVO.setU_id(1);
		
		request.setAttribute("price", 1000);
		
		usersService.getUserOne(usersVO);
		
		return "/views/payOk.jsp";
	}

}
