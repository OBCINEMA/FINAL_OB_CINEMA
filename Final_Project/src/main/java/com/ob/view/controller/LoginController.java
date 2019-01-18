package com.ob.view.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.Find_PasswordService;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

@Controller
public class LoginController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private Find_PasswordService find_PasswordService;

	@RequestMapping(value = "/logIN.do", method = RequestMethod.POST)
	public String loginIN(UsersVO vo, HttpSession session) {
		// System.out.println("입력받은 : 아이디" + vo);
		UsersVO login = usersService.getUsers(vo);
		if (login != null) {
			session.setAttribute("Logininformation", login);
			// System.out.println("[로그]:로그인 성공후 메인페이지로 전환");
			// System.out.println("[로그]:로그인 성공후 vo 확인: " + login);

			return "/mainGO.do";
		} else {
			System.out.println("로그인 실패");
			return "/mainGO.do";
		}
	}

	@RequestMapping(value = "/logIN.do", method = RequestMethod.GET)
	public String loginINget(UsersVO vo, HttpSession session) {
		// System.out.println("입력받은 : 아이디" + vo);
		UsersVO login = usersService.getUsers(vo);
		if (login != null) {
			session.setAttribute("Logininformation", login);
			// System.out.println("[로그]:로그인 성공후 메인페이지로 전환");
			// System.out.println("[로그]:로그인 성공후 vo 확인: " + login);

			return "/mainGO.do";
		} else {
			System.out.println("로그인 실패");
			return "/mainGO.do";
		}
	}

	@RequestMapping(value = "/logOUT.do", method = RequestMethod.GET)
	public String loginOUT(UsersVO vo, HttpSession session) {
		System.out.println(">>> 로그아웃 요청 처리(logout)");
		System.out.println("session" + session);
		session.invalidate();
		return "redirect: /mainGO.do";
	}

	@RequestMapping(value = "/loginchk.do", method = RequestMethod.POST)
	public @ResponseBody String loginCHK(UsersVO vo, HttpSession session) {
		System.out.println("넘어온 데이터" + vo);
		UsersVO login = usersService.getUsers(vo);
		if (login != null) {
			session.setAttribute("Logininformation", login);
			// System.out.println("[로그]:로그인 성공후 메인페이지로 전환");
			// System.out.println("[로그]:로그인 성공후 vo 확인: " + login);
			return "success";
		} else {
			return "fail";
		}
	}

	/// 단순 ID, PW 찾기 페이지로 이동
		@RequestMapping(value = "/findIDPW.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String findIDPW() {

			return "/views/login/find_id_pw.jsp";
		}

		@RequestMapping(value = "/findIDchk.do", method = RequestMethod.POST)
		public @ResponseBody String findIDchk(UsersVO vo, HttpSession session) {
			System.out.println("넘어온 데이터" + vo);
			String getfindID = usersService.findIDchk(vo);
			System.out.println("짠 : " +getfindID);
			
			if(getfindID != null) {
				return getfindID;
				}
			else {
				return "notfound";
			}
			
		
		}		
			// 비밀번호 찾기
			@RequestMapping(value = "/findPWchk.do", method = RequestMethod.POST)
			public @ResponseBody String findPWchk(UsersVO vo, HttpServletResponse response) throws Exception{
				System.out.println("넘어온 데이터" + vo);
				
				int count = usersService.findPWchk(vo);
				if(count >=1) {
					System.out.println("ㅇ응: 아이디가 있네");
					// 임시 비밀번호 생성
					String pw = "";
					for (int i = 0; i < 12; i++) {
						pw += (char) ((Math.random() * 26) + 97);
					}
					vo.setPassword(pw);
					// 비밀번호 변경
					usersService.update_pw(vo);
					// 비밀번호 변경 메일 발송
					System.out.println("바뀐 vo" +vo);
					String mailsendOk = find_PasswordService.send_mail(vo, "find_pw");
					System.out.println(mailsendOk);
					return "redirect:/mainGO.do";
					
					
					
				}else {
					System.out.println("없네");
				}
				
				return null;
				
			}
			
	
	
}
