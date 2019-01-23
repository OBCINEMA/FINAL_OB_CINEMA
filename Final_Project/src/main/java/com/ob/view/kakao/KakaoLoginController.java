package com.ob.view.kakao;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;


@Controller
public class KakaoLoginController {
	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		System.out.println("zz");
		JsonNode token = KakaoLogin.getAccessToken(code);

		JsonNode profile = KakaoLogin.getKakaoUserInfo(token.path("access_token").toString());
		System.out.println(profile);
		UsersVO vo = KakaoLogin.changeData(profile);
		vo.setId("k_" + vo.getId());
		vo.setGrade(1);
		

		//
		if (usersService.idcheck(vo) < 1) {
			System.out.println("zzzz" + vo);
			// 한번 회원 가입
		
			usersService.insertUsers(vo);
			// API 유저들 정보 다가져와 vo에 담기
			UsersVO newvo = usersService.getApiUsers(vo);
			// session.setAttribute("result", apiResult);
			// --> 정보 메인페이지에서 사용할 수 있도록 로그인정보
			session.setAttribute("Logininformation", newvo);
			/* 네이버 로그인 성공 페이지 View 호출 */
			// return "/views/login/login_success.jsp";
			System.out.println("페이지 넘기기 마지막 확인 vo :" + newvo);
			if(newvo.getEmail()==null) return "/views/login/email_check.jsp";
			return "/mainGO.do";

		} else
			System.out.println("이미 존재하는 id");
		// API 유저들 정보 다가져와 vo에 담기
		UsersVO newvo = usersService.getApiUsers(vo);
		session.setAttribute("Logininformation", newvo);
		System.out.println("페이지 넘기기 마지막 확인 vo :" + newvo);
		if(newvo.getEmail()==null) return "/views/login/email_check.jsp";
		
		return "/mainGO.do";
		//

		// vo = service.kakaoLogin(vo);
	}

}
