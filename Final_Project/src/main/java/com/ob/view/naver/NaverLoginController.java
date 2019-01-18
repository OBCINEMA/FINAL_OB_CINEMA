package com.ob.view.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.UsersVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	@Autowired
	private UsersService usersService;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/*
	 * //로그인 첫 화면 요청 메소드
	 * 
	 * @RequestMapping(value = "/navergo.do", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public String login(Model model, HttpSession session) {
	 * String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	 * System.out.println("네이버:" + naverAuthUrl); //네이버 model.addAttribute("url",
	 * naverAuthUrl); // 생성한 인증 URL을 View로 전달 return "/views/login/login_naver.jsp";
	 * }
	 */
	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/navergo.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		System.out.println("네이버:" + naverAuthUrl);
		// 네이버
		model.addAttribute("url", naverAuthUrl);
		// 생성한 인증 URL을 View로 전달
		return "redirect:" + naverAuthUrl;
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("------------------------------");
		System.out.println("여기는 callback받은 후");
		System.out.println("callback 받고 code 값" + code);
		System.out.println("callback 받고 state 값" + state);
		System.out.println("callback 받고 session 값" + session);
		System.out.println("------------------------------");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		apiResult = naverLoginBO.getUserProfile(oauthToken);

		JsonStringParse jsonparse = new JsonStringParse();

		JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
		// String sex = jsonparse.JsonToString(jsonobj, "gender");
		String snsId = jsonparse.JsonToString(jsonobj, "id");
		String name = jsonparse.JsonToString(jsonobj, "name");
		String email = jsonparse.JsonToString(jsonobj, "email");
		// String nickname = jsonparse.JsonToString(jsonobj, "nickname");

		// vo 다시만들어서 DB에 저장
		UsersVO vo = new UsersVO();
		vo.setId("n_" + snsId);
		vo.setName(name);
		vo.setEmail(email);
		vo.setGrade(1);
		if (usersService.idcheck(vo) < 1) {
			System.out.println("zzzz" + vo);
			usersService.insertUsers(vo);
			//API 유저들 정보 다가져와 vo에 담기
			UsersVO newvo = usersService.getApiUsers(vo);
			// session.setAttribute("result", apiResult);
			session.setAttribute("Logininformation", newvo);
			/* 네이버 로그인 성공 페이지 View 호출 */
			// return "/views/login/login_success.jsp";
			System.out.println("페이지 넘기기 마지막 확인 vo :" + newvo);
			return "/mainGO.do";

		} else
			System.out.println("이미 존재하는 id");
		//API 유저들 정보 다가져와 vo에 담기
		UsersVO newvo = usersService.getApiUsers(vo);
		session.setAttribute("Logininformation", newvo);
		System.out.println("페이지 넘기기 마지막 확인 vo :" + newvo);
		return "/mainGO.do";

		// vo.setGender(sex); 
		// vo.setNickname(nickname);

	}
}
