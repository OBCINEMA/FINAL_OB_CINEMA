package com.ob.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ob.biz.service.MovieService;
import com.ob.biz.service.Movie_HistoryService;
import com.ob.biz.service.PlusService;
import com.ob.biz.service.ScheduleService;
import com.ob.biz.service.ScreenService;
import com.ob.biz.service.TheaterService;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.PlusVO;
import com.ob.biz.vo.ScheduleVO;
import com.ob.biz.vo.ScreenVO;
import com.ob.biz.vo.TheaterVO;
import com.ob.biz.vo.UsersVO;

@Controller
//// 세션 어트리뷰트 사용해보고 싶었음 . 극장만 해봄
// @SessionAttributes("theaterOne")
public class AdminController {
	@Autowired
	private UsersService usersService;
	@Autowired
	private MovieService movieService;
	@Autowired
	private TheaterService theaterService;
	@Autowired
	private ScreenService screenService;
	@Autowired
	private ScheduleService scheduleService;
	@Autowired
	private Movie_HistoryService movie_HistoryService;
	@Autowired
	private PlusService plusService;

	// --------------------> 공통(메인페이지) ----------------- 시작
	@RequestMapping(value = "/admin_Main.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String GoAdminIndexPage(Model model) {

		int mCount = movieService.getCountMovie();
		int tCount = theaterService.getCountTheater();
		int scrCount = screenService.getCountScreen();
		int schCount = scheduleService.getCountSchedule();
		model.addAttribute("mCount", mCount);
		model.addAttribute("tCount", tCount);
		model.addAttribute("scrCount", scrCount);
		model.addAttribute("schCount", schCount);
		
		return "/views/admin/admin_Main.jsp";
	}
	// --------------------> 공통(메인페이지) ----------------- 끝

	// --------------------> 영화----------------- 시작
	@RequestMapping(value = "/admin_searchMovie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_searchMovie(MovieVO vo, Model model) {
		List<MovieVO> movieList = movieService.getMovieList();

		model.addAttribute("movieList", movieList);
		model.addAttribute("password", "1234"); // 음.
		return "/views/admin/admin_searchMovie.jsp";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_insertMovieWriter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_insertMovieWriter(MovieVO vo, Model model) {

		return "/views/admin/admin_insertMovieWriter.jsp";
	}

	@RequestMapping(value = "/admin_insertMovie.do", method = RequestMethod.POST)
	public String Admin_insertMovie(MovieVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 영화 등록 요청 처리(admin_insertMovie.do)");
		System.out.println("넘어온 vo : " + vo);
		// 파일 업로드 처리
		// MultipartFile 인터페이스 주요 메소드
		// String getOriginalFilename() : 업로드한 파일명
		// void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		// boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)

		MultipartFile posterFile = vo.getPoster_file();
		if (!posterFile.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = posterFile.getOriginalFilename();
			posterFile.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/"
					+ "(" + to + ")" + fileName));
			vo.setPoster(("(" + to + ")" + fileName));
		} else {
			if (vo.getPoster() == null)
				vo.setPoster("");
		}
		MultipartFile img1File = vo.getImg1_file();
		if (!img1File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img1File.getOriginalFilename();
			img1File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg1(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg1() == null)
				vo.setImg1("");
		}
		MultipartFile img2File = vo.getImg2_file();
		if (!img2File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img2File.getOriginalFilename();
			img2File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg2(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg2() == null)
				vo.setImg2("");
		}
		MultipartFile img3File = vo.getImg3_file();
		if (!img3File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img3File.getOriginalFilename();
			img3File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg3(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg3() == null)
				vo.setImg3("");
		}
		MultipartFile img4File = vo.getImg4_file();
		if (!img4File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img4File.getOriginalFilename();
			img4File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg4(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg4() == null)
				vo.setImg4("");
		}
		MultipartFile img5File = vo.getImg5_file();
		if (!img5File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img5File.getOriginalFilename();
			img5File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg5(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg5() == null)
				vo.setImg5("");
		}

		movieService.insertMovie(vo);
		return "redirect:/admin_searchMovie.do";
	}

	@RequestMapping(value = "/admin_deleteMovie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_deleteMovie(MovieVO vo, Model model) {
		System.out.println("요기까징");
		System.out.println("확인 vo : " + vo);
		movieService.deleteMovie(vo);

		model.addAttribute("result", "delete");

		return "/admin_searchMovie.do";
	}

	@RequestMapping(value = "/admin_getMovie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_getMovie(MovieVO vo, Model model) {
		System.out.println("요기까징");
		System.out.println("확인 vo : " + vo);
		MovieVO movieOne = movieService.getMovie(vo);

		System.out.println("쓸 movieOne 확인 :" + movieOne);

		model.addAttribute("movieOne", movieOne);

		return "/views/admin/admin_detailMovie.jsp";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_updateMovie.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_updateMovie(MovieVO vo, Model model) {
		MovieVO movieOne = movieService.getMovie(vo);
		model.addAttribute("movieOne", movieOne);

		return "/views/admin/admin_updateMovie.jsp";
	}

	@RequestMapping(value = "/admin_modifyMovie.do", method = RequestMethod.POST)
	public String Admin_modifyMovie(MovieVO vo, Model model) throws IllegalStateException, IOException {

		System.out.println(">>> --------------------------------------------- <<<<");
		System.out.println(">>> 영화 등록 요청 처리(/admin_modifyMovie.do)");
		System.out.println("넘어온 vo : " + vo);
		// 파일 업로드 처리
		// MultipartFile 인터페이스 주요 메소드
		// String getOriginalFilename() : 업로드한 파일명
		// void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		// boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)

		MultipartFile posterFile = vo.getPoster_file();
		if (!posterFile.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = posterFile.getOriginalFilename();
			posterFile.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/"
					+ "(" + to + ")" + fileName));
			vo.setPoster(("(" + to + ")" + fileName));
		} else {
			if (vo.getPoster() == null)
				vo.setPoster("");
		}
		MultipartFile img1File = vo.getImg1_file();
		if (!img1File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img1File.getOriginalFilename();
			img1File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg1(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg1() == null)
				vo.setImg1("");
		}
		MultipartFile img2File = vo.getImg2_file();
		if (!img2File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img2File.getOriginalFilename();
			img2File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg2(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg2() == null)
				vo.setImg2("");
		}
		MultipartFile img3File = vo.getImg3_file();
		if (!img3File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img3File.getOriginalFilename();
			img3File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg3(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg3() == null)
				vo.setImg3("");
		}
		MultipartFile img4File = vo.getImg4_file();
		if (!img4File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img4File.getOriginalFilename();
			img4File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg4(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg4() == null)
				vo.setImg4("");
		}
		MultipartFile img5File = vo.getImg5_file();
		if (!img5File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img5File.getOriginalFilename();
			img5File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/movieimg/" + "("
					+ to + ")" + fileName));
			vo.setImg5(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg5() == null)
				vo.setImg5("");
		}

		System.out.println("확인 : " + vo);

		movieService.updateMovie(vo);
		model.addAttribute("result", "update");

		return "/admin_searchMovie.do";
	}
	// --------------------> 영화 ----------------- 끝

	// --------------------> 극장 ----------------- 시작
	@RequestMapping(value = "/admin_searchTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_searchTheater(TheaterVO vo, Model model) {
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		model.addAttribute("theaterList", theaterList);

		return "/views/admin/admin_searchTheater.jsp";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_insertTheaterWriter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_insertTheaterWriter(MovieVO vo, Model model) {

		return "/views/admin/admin_insertTheaterWriter.jsp";
	}

	@RequestMapping(value = "/admin_insertTheater.do", method = RequestMethod.POST)
	public String Admin_insertTheater(TheaterVO vo) throws IllegalStateException, IOException {
		System.out.println(">>> 극장 등록 요청 처리(admin_insertTheater.do)");
		System.out.println("넘어온 vo : " + vo);
		// 파일 업로드 처리
		// MultipartFile 인터페이스 주요 메소드
		// String getOriginalFilename() : 업로드한 파일명
		// void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		// boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)

		MultipartFile img1File = vo.getImg1_file();
		if (!img1File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			System.out.println(random);
			String to = Integer.toString(random);
			String fileName = img1File.getOriginalFilename();
			img1File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg1(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg1() == null)
				vo.setImg1("");
		}
		MultipartFile img2File = vo.getImg2_file();
		if (!img2File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			System.out.println(random);
			String to = Integer.toString(random);
			String fileName = img2File.getOriginalFilename();
			img2File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg2(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg2() == null)
				vo.setImg2("");
		}
		MultipartFile img3File = vo.getImg3_file();
		if (!img3File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			System.out.println(random);
			String to = Integer.toString(random);
			String fileName = img3File.getOriginalFilename();
			img3File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg3(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg3() == null)
				vo.setImg3("");
		}
		MultipartFile img4File = vo.getImg4_file();
		if (!img4File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			System.out.println(random);
			String to = Integer.toString(random);
			String fileName = img4File.getOriginalFilename();
			img4File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg4(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg4() == null)
				vo.setImg4("");
		}
		MultipartFile img5File = vo.getImg5_file();
		if (!img5File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			System.out.println(random);
			String to = Integer.toString(random);
			String fileName = img5File.getOriginalFilename();
			img5File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg5(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg5() == null)
				vo.setImg5("");
		}

		int count = theaterService.insertTheater(vo);
		System.out.println(count + "건 정상 등록");

		return "redirect:/admin_searchTheater.do";
	}

	@RequestMapping(value = "/admin_getTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_getTheater(TheaterVO vo, Model model) {
		System.out.println("요기까징");
		System.out.println("확인 vo : " + vo);
		TheaterVO theaterOne = theaterService.getTheater(vo);

		System.out.println("쓸 theaterOne 확인 :" + theaterOne);

		model.addAttribute("theaterOne", theaterOne);

		return "/views/admin/admin_detailTheater.jsp";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_updateTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_updateTheater(TheaterVO vo, Model model) {
		TheaterVO theaterOne = theaterService.getTheater(vo);

		model.addAttribute("theaterOne", theaterOne);

		return "/views/admin/admin_updateTheater.jsp";
	}

	@RequestMapping(value = "/admin_modifyTheater.do", method = RequestMethod.POST)
	public String Admin_modifyTheater(TheaterVO vo, Model model) throws IllegalStateException, IOException {
		System.out.println(">>> --------------------------------------------- <<<<");
		System.out.println(">>> 영화 등록 요청 처리(/admin_modifyTheater.do)");
		System.out.println("넘어온 vo : " + vo);
		// 파일 업로드 처리
		// MultipartFile 인터페이스 주요 메소드
		// String getOriginalFilename() : 업로드한 파일명
		// void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		// boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)

		MultipartFile img1File = vo.getImg1_file();
		if (!img1File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img1File.getOriginalFilename();
			img1File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg1(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg1() == null)
				vo.setImg1("");
		}
		MultipartFile img2File = vo.getImg2_file();
		if (!img2File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img2File.getOriginalFilename();
			img2File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg2(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg2() == null)
				vo.setImg2("");
		}
		MultipartFile img3File = vo.getImg3_file();
		if (!img3File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img3File.getOriginalFilename();
			img3File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg3(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg3() == null)
				vo.setImg3("");
		}
		MultipartFile img4File = vo.getImg4_file();
		if (!img4File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img4File.getOriginalFilename();
			img4File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg4(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg4() == null)
				vo.setImg4("");
		}
		MultipartFile img5File = vo.getImg5_file();
		if (!img5File.isEmpty()) {
			int random = (int) (Math.random() * 10000) + 1;
			String to = Integer.toString(random);
			String fileName = img5File.getOriginalFilename();
			img5File.transferTo(new File("C:/gitobfinal/FINAL_OB_CINEMA/Final_Project/src/main/webapp/resources/theaterimg/"
					+ "(" + to + ")" + fileName));
			vo.setImg5(("(" + to + ")" + fileName));
		} else {
			if (vo.getImg5() == null)
				vo.setImg5("");
		}

		System.out.println("확인 : " + vo);

		theaterService.upateTheater(vo);
		model.addAttribute("result", "update");

		return "/admin_searchTheater.do";
	}

	@RequestMapping(value = "/admin_deleteTheater.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_deleteTheater(TheaterVO vo, Model model) {
		System.out.println("요기까징");
		System.out.println("확인 vo : " + vo);
		theaterService.deleteTheater(vo);
		model.addAttribute("result", "delete");

		return "/admin_searchTheater.do";
	}

	// --------------------> 극장 ----------------- 끝

	// --------------------> 스크린 ----------------- 시작

	@RequestMapping(value = "/admin_searchScreen.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_searchScreen(ScreenVO vo, Model model) {
		// List<PlusVO> plusList = plusService.getPlusList();
		List<TheaterVO> theaterList = theaterService.getTheaterList();

		System.out.println(theaterList);
		List<ScreenVO> screenList = screenService.getScreenList();
		System.out.println(screenList);

		model.addAttribute("theaterList", theaterList);
		model.addAttribute("screenList", screenList);
		model.addAttribute("password", "1234"); // 음.
		return "/views/admin/admin_searchScreen.jsp";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_updateScreen.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_updateScreen(ScreenVO vo, Model model) {
		System.out.println("받은 scr_id :" + vo.getScr_id());
		System.out.println("받은 t_id : " + vo.getT_id());

		List<TheaterVO> theaterList = theaterService.getTheaterList();

		System.out.println(theaterList);

		ScreenVO screenOne = screenService.getScrOne(vo);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("screenOne", screenOne);

		System.out.println("dkdkdkdk :" + screenOne);

		return "/views/admin/admin_updateScreen.jsp";
	}

	@RequestMapping(value = "/admin_modifyScreen.do", method = RequestMethod.POST)
	public String Admin_modifyScreen(ScreenVO vo, Model model) {
		System.out.println(">>> --------------------------------------------- <<<<");
		System.out.println(">>> 영화 등록 요청 처리(/admin_modifyScreen.do)");
		System.out.println("넘어온 vo : " + vo);
		int a = Integer.parseInt(vo.getScr_seat_row()) * Integer.parseInt(vo.getScr_seat_col());
		vo.setScr_seat_tot(Integer.toString(a));
		System.out.println("수정후 vo : " + vo);

		screenService.upateScreen(vo);
		model.addAttribute("result", "update");

		return "/admin_searchScreen.do";
	}

	// 단순 페이지 이동
	@RequestMapping(value = "/admin_insertScreenWriter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_insertScreenWriter(ScreenVO vo, Model model) {
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		model.addAttribute("theaterList", theaterList);

		return "/views/admin/admin_insertScreenWriter.jsp";
	}

	@RequestMapping(value = "/admin_insertScreen.do", method = RequestMethod.POST)
	public String Admin_insertScreen(ScreenVO vo) {
		System.out.println(">>> 극장 등록 요청 처리(admin_insertScreen.do)");
		System.out.println("넘어온 vo : " + vo);

		int a = Integer.parseInt(vo.getScr_seat_row()) * Integer.parseInt(vo.getScr_seat_col());
		vo.setScr_seat_tot(Integer.toString(a));
		System.out.println("수정후 vo cvcvcvcvcv : " + vo);
		int count = screenService.insertScreen(vo);
		System.out.println(count + "건 정상 등록");
		// int count = theaterService.insertTheater(vo);
		// System.out.println(count + "건 정상 등록");

		return "redirect:/admin_searchScreen.do";
	}

	@RequestMapping(value = "/admin_deleteScreen.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_deleteScreen(ScreenVO vo, Model model) {
		System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz확인 vo : " + vo);
		screenService.deleteScreen(vo);
		model.addAttribute("result", "delete");

		return "/admin_searchScreen.do";
	}
	// --------------------> 스크린 ----------------- 끝

	// --------------------> 상영정보 ----------------- 시작
	@RequestMapping(value = "/admin_searchSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_searchSchedule(ScreenVO vo, Model model) {
		// List<PlusVO> plusList = plusService.getPlusList();
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		System.out.println("111111111111111111" +theaterList);
		List<ScreenVO> screenList = screenService.getScreenList();
		System.out.println("222222222222222222222" +screenList);

		List<PlusVO> plusList = plusService.getPlusList();
		System.out.println("3333333333333333333" +plusList);
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("screenList", screenList);
		model.addAttribute("plusList", plusList);

		model.addAttribute("password", "1234"); // 음.
		return "/views/admin/admin_searchSchedule.jsp";
	}

	// 단순 페이지 이동 //상영중인 영화만
	@RequestMapping(value = "/admin_insertScheduleWriter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_insertScheduleWriter(ScreenVO vo, Model model) {
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		List<MovieVO> movieList = movieService.getMovieListOnair();

		model.addAttribute("theaterList", theaterList);
		model.addAttribute("movieList", movieList);

		return "/views/admin/admin_insertScheduleWriter.jsp";
	}
	
	
	///admin_insertScheduleWriterPreOnair.do
	// 단순 페이지 이동 //상영예정중인 영화만
		@RequestMapping(value = "/admin_insertScheduleWriterPreOnair.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String Admin_insertScheduleWriterPreOnair(Model model) {
			List<TheaterVO> theaterList = theaterService.getTheaterList();
			List<MovieVO> movieList = movieService.getMovieListPreair();

			model.addAttribute("theaterList", theaterList);
			model.addAttribute("movieList", movieList);

			return "/views/admin/admin_insertScheduleWriterPreOnair.jsp";
		}

	// ajax 처리 m_id로 screen 정보 구하기
	@RequestMapping(value = "/getScrOne_m.do", method = RequestMethod.POST)
	public @ResponseBody List<ScreenVO> getScrOne_m(ScreenVO vo, HttpSession session) {
		System.out.println("넘어온 데이터" + vo);
		List<ScreenVO> scrList = screenService.getScrOne_m(vo);
		System.out.println("aaa" + scrList);
		return scrList;

	}

	@RequestMapping(value = "/admin_insertSchedule.do", method = RequestMethod.POST)
	public String Admin_insertSchedule(ScheduleVO vo) {
		System.out.println(">>> 극장 등록 요청 처리(admin_insertSchedule.do)");
		System.out.println("넘어온 vo : " + vo);

		int count = scheduleService.insertSchedule(vo);
		System.out.println(count + "건 정상 처리");
		return "redirect:/admin_searchSchedule.do";
	}
	
	@RequestMapping(value = "/admin_insertSchedulePreonair.do", method = RequestMethod.POST)
	public String Admin_insertSchedulePreonair(ScheduleVO vo ) {
		System.out.println(">>> 극장 등록 요청 처리(admin_insertSchedulePreonair.do)");
		System.out.println("넘어온 vo : " + vo);
		int m_id = vo.getM_id();
		int count = scheduleService.insertSchedule(vo);
		System.out.println(count + "건 정상 처리");
		
		System.out.println("상태 변경~");
		movieService.updateMovieOnairOne(m_id);
		return "redirect:/admin_searchSchedule.do";
	}

	// ajax 처리 t_id로 plus 정보 구하기
	@RequestMapping(value = "/getPlusTitlebyt_id.do", method = RequestMethod.POST)
	public @ResponseBody List<PlusVO> getPlusTitlebyt_id(PlusVO vo, HttpSession session) {
		System.out.println("넘어온 데이터" + vo);
		List<PlusVO> title_poster = plusService.getPlusTitlebyt_id(vo);
		System.out.println("맞냐 :" + title_poster);

		return title_poster;

	}

	// ----------------------------------------------------수정 start
	// 단순 페이지 이동
	@RequestMapping(value = "/updateOnairkimWriter.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateOnairkimWriter(Model model) {
		List<MovieVO> movieList = movieService.getMovieListPreair();
		List<TheaterVO> theaterList = theaterService.getTheaterList();
		if (movieList.size() == 0) {
			System.out.println("상영 예정작인 영화가 없습니다.");
			// 상영중(1)이던 영화 상영종료(0) 처리
			movieService.updateMovieOnair0();

			// 상영예정(-1)이던 영화 상영중(1) 처리
			movieService.updateMovieOnair1();
			// 상영한 영화(1) 상영 내역에 반영
			movie_HistoryService.insertMovie_History_Onair();
			// 보고싶은 명화에서 득표순 상위 5개 영화 상영예정(-1) 처리
			movieService.updateMoviePreair();
			// vote 초기화
			movieService.updateMovieVoteTo0();
			return "redirect:/admin_searchSchedule.do";
		} else {
			System.out.println("상영 예정작인 영화가 있어서 페이지를 이동합니다.");

			model.addAttribute("theaterList", theaterList);
			model.addAttribute("movieList", movieList);

			return "/views/admin/admin_insertScheduleKimWriter.jsp";
		}

	}

	@RequestMapping(value = "/updateOnairkim.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String updateOnairkim(Model model) {
		System.out.println("updateOnair() 실행");
		// 상영중(1)이던 영화 상영종료(0) 처리
		movieService.updateMovieOnair0();
		// 상영예정(-1)인 영화 극장 - 상영관 - 스케쥴 등록

		// 상영예정(-1)이던 영화 상영중(1) 처리
		movieService.updateMovieOnair1();
		// 상영한 영화(1) 상영 내역에 반영
		movie_HistoryService.insertMovie_History_Onair();
		// 보고싶은 명화에서 득표순 상위 5개 영화 상영예정(-1) 처리
		movieService.updateMoviePreair();
		// vote 초기화
		movieService.updateMovieVoteTo0();
		System.out.println("음.");
		return null;
	}
	// ----------------------------------------------------수정 end

	// ajax 처리 t_id로 plus 정보 구하기
	@RequestMapping(value = "/getTIME.do", method = RequestMethod.POST)
	public @ResponseBody List<ScheduleVO> getTIME(ScheduleVO vo, HttpSession session) {
		System.out.println("넘어온 데이터" + vo);

		List<ScheduleVO> TIMELIST = scheduleService.getTIME(vo);
		System.out.println("체체체체크 : " + TIMELIST);
		return TIMELIST;

	}

	@RequestMapping(value = "/admin_modifyShedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_modifySchedule(PlusVO vo, Model model) {
		System.out.println(">>> --------------------------------------------- <<<<");
		System.out.println(">>> 영화 등록 요청 처리(/admin_modifySchedule.do)");
		System.out.println("넘어온 vo : " + vo);
		PlusVO SchVO = plusService.getPlusTitlebysch_id(vo);
		System.out.println("새로운 newVO : " + SchVO);
		List<MovieVO> moviename = movieService.getMovieListOnair();
		ScheduleVO addvo = new ScheduleVO();
		addvo.setScr_id(SchVO.getScr_id());
		addvo.setT_id(SchVO.getT_id());
		List<ScheduleVO> TIMELIST = scheduleService.getTIME(addvo);
		System.out.println("TIMELIST는 : " + TIMELIST);
		List<String> atimeList = new ArrayList<String>();
		atimeList.add("8");
		atimeList.add("11");
		atimeList.add("14");
		atimeList.add("17");
		atimeList.add("20");
		for (int i = 0; i<TIMELIST.size() ; i++) {
			atimeList.remove(TIMELIST.get(i).getTime());
		}
		atimeList.add(SchVO.getTime());
		model.addAttribute("moviename", moviename);
		System.out.println("zzzzzzzzzzzzzzzzzzzzzzzzzz:" + moviename);

		model.addAttribute("SchVO", SchVO);
		model.addAttribute("atimeList", atimeList);

		return "/views/admin/admin_updateSchedule.jsp";
	}
	
	@RequestMapping(value = "/admin_modifySchedule.do", method = RequestMethod.POST)
	public String Admin_modifySchedule(ScheduleVO vo, Model model) {
		System.out.println(">>> --------------------------------------------- <<<<");
		System.out.println(">>> 영화 등록 요청 처리(/admin_modifySchedule.do)");
		System.out.println("넘어온 vo : " + vo);
		int count = scheduleService.updateSchedule(vo);
		System.out.println(count +" 건이 정상 수정 되었습니다.");
		model.addAttribute("result", "update");

		return "/admin_searchSchedule.do";
	}
	
	@RequestMapping(value = "/admin_deleteSchedule.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_deleteSchedule(ScheduleVO vo, Model model) {
		System.out.println("QQQQQQQQQQQQQQQQQQQQ확인 vo : " + vo);
		scheduleService.deleteSchedule(vo);
		model.addAttribute("result", "delete");

		return "/admin_searchSchedule.do";
	}
	
	///admin_voteRefresh.do
	@RequestMapping(value = "/admin_voteRefresh.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String Admin_deleteSchedule(MovieVO vo, UsersVO uvo, Model model) {
		// 보고싶은 명화에서 득표순 상위 5개 영화 상영예정(-1) 처리
		movieService.updateMoviePreair();
		// vote 초기화
		movieService.updateMovieVoteTo0();
		// 회원 투표도 초기화
		usersService.resetVotedMovie();
		

		return "/admin_Main.do";
	}
	
}
