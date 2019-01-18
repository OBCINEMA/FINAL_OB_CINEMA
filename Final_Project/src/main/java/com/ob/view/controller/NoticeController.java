package com.ob.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ob.biz.service.BoardService;
import com.ob.biz.vo.BoardVO;
import com.ob.biz.vo.PageVO;

@Controller
@SessionAttributes("Logininformation")
public class NoticeController {
	@Autowired
	private BoardService boardService;

	@RequestMapping("insertNotice.do")
	public String insertNotice(BoardVO vo) {
		boardService.insertNotice(vo);
		return "getNoticeList.do";
	}

	// @RequestMapping(value="insertNotice.do", method = RequestMethod.POST)
	// public String insertNotice(BoardVO vo) throws IllegalStateException,
	// IOException {
	// System.out.println(">>> 글 등록 요청 처리(insertNotice)");
	// System.out.println("insertNotice" + vo);
	//
	// MultipartFile img1File = vo.getImg1_file();
	// if (!img1File.isEmpty()) {
	// int random = (int) (Math.random() * 10000) + 1;
	// String to = Integer.toString(random);
	// String fileName = img1File.getOriginalFilename();
	// img1File.transferTo(new File("c:/MyStudy/temp/" + "("
	// + to + ")" + fileName));
	// vo.setImg1(("(" + to + ")" + fileName));
	// } else {
	// if (vo.getImg1() == null)
	// vo.setImg1("");
	// }
	// MultipartFile img2File = vo.getImg2_file();
	// if (!img2File.isEmpty()) {
	// int random = (int) (Math.random() * 10000) + 1;
	// String to = Integer.toString(random);
	// String fileName = img2File.getOriginalFilename();
	// img2File.transferTo(new File("c:/MyStudy/temp/" + "("
	// + to + ")" + fileName));
	// vo.setImg2(("(" + to + ")" + fileName));
	// } else {
	// if (vo.getImg2() == null)
	// vo.setImg2("");
	// }
	// MultipartFile img3File = vo.getImg3_file();
	// if (!img3File.isEmpty()) {
	// int random = (int) (Math.random() * 10000) + 1;
	// String to = Integer.toString(random);
	// String fileName = img3File.getOriginalFilename();
	// img3File.transferTo(new File("c:/MyStudy/temp/" + "("
	// + to + ")" + fileName));
	// vo.setImg3(("(" + to + ")" + fileName));
	// } else {
	// if (vo.getImg3() == null)
	// vo.setImg3("");
	// }
	// MultipartFile img4File = vo.getImg4_file();
	// if (!img4File.isEmpty()) {
	// int random = (int) (Math.random() * 10000) + 1;
	// String to = Integer.toString(random);
	// String fileName = img4File.getOriginalFilename();
	// img4File.transferTo(new File("c:/MyStudy/temp/" + "("
	// + to + ")" + fileName));
	// vo.setImg4(("(" + to + ")" + fileName));
	// } else {
	// if (vo.getImg4() == null)
	// vo.setImg4("");
	// }
	// MultipartFile img5File = vo.getImg5_file();
	// if (!img5File.isEmpty()) {
	// int random = (int) (Math.random() * 10000) + 1;
	// String to = Integer.toString(random);
	// String fileName = img5File.getOriginalFilename();
	// img5File.transferTo(new File("c:/MyStudy/temp/" + "("
	// + to + ")" + fileName));
	// vo.setImg5(("(" + to + ")" + fileName));
	// } else {
	// if (vo.getImg5() == null)
	// vo.setImg5("");
	// }
	//
	// boardService.insertNotice(vo);
	// return "getNoticeList.do";
	// }

	@RequestMapping("updateNoticeGo.do")
	public String updateNoticeGo(BoardVO vo, Model model) {
		model.addAttribute("notice", boardService.getNotice(vo));
		return "/views/notice/updateNotice.jsp";
	}

	@RequestMapping("updateNotice.do")
	public String updateNotice(BoardVO vo) {
		boardService.updateNotice(vo);
		return "getNotice.do";
	}

	@RequestMapping("deleteNotice.do")
	public String deleteNotice(BoardVO vo) {
		boardService.deleteNotice(vo);
		return "getNoticeList.do";
	}

	@RequestMapping("getNoticeList.do")
	public String getNoticeList(BoardVO vo, PageVO pvo, Model model, HttpServletRequest request, HttpSession session) {
		PageVO p = new PageVO();

		p.setTotalRecord(boardService.totalCnt());
		p.setTotalPage();

		System.out.println("전체 건수: " + p.getTotalRecord());
		System.out.println("전체 페이지 갯수: " + p.getTotalPage());

		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}

		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);

		System.out.println("현재 페이지(nowPage): " + p.getNowPage());
		System.out.println("시작 번호(begin): " + p.getBegin());
		System.out.println("끝 번호(end): " + p.getEnd());

		int nowPage = p.getNowPage();
		p.setBeginPage((nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);

		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}

		System.out.println("변경 후 끝 페이지(endPage) : " + p.getEndPage());

		Map<String, Integer> map = new HashMap<>();

		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());

		List<BoardVO> noticeList = boardService.getNoticeList(map);

		System.out.println("noticeList: " + noticeList);

		model.addAttribute("list", noticeList);
		session.setAttribute("pvo", p);
		model.addAttribute("cPage", cPage);

		return "/views/notice/getNoticeList.jsp";
	}

	@RequestMapping("getNotice.do")
	public String getNotice(BoardVO vo, Model model, HttpSession session) {
		session.getAttribute("pvo");
		model.addAttribute("notice", boardService.getNotice(vo));

		return "/views/notice/getNotice.jsp";
	}
}
