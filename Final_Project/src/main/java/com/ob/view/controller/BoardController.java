package com.ob.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ob.biz.service.BoardService;
import com.ob.biz.vo.BoardVO;

@Controller
//"board"라는 이름의 Model이 있으면 session에 저장
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	//@ModelAttribute 설정을 통해 View에 전달할 데이타를 만들어서 전달
	//@ModelAttribute 로 정의된 메소드는 @RequestMapping 보다 먼저 실행됨
	//"conditionMap" 이라는 이름의 속성명에 Map객체가 저장되어 있음
	@ModelAttribute("conditionMap")
	public Map<String, String> searchCondition() {
		//key: 제목, value: TITLE
		//key: 내용, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT");
		System.out.println("conditionMap: " + conditionMap);
		
		return conditionMap;
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println(">>> 글 상세 조회 요청 처리(getBoard)");
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		//model.addAttribute(attributeName, attributeValue)
		model.addAttribute("board", boardService.getBoard(vo));
		
		return "/views/getBoard.jsp";
	}	
	
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model) {
		System.out.println(">> 글목록 조회 처리(getBoardList)");
		System.out.println("codition: " + vo.getSearchCondition()
				+ ", keyword: " + vo.getSearchKeyword());
		
		//searchCondition 값 null 체크 - null값에 대한 초기화
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		//Model 형식으로 저장해서 DispatcherServlet에 전달
		model.addAttribute("boardList", boardList);
		
		return "/views/getBoardList.jsp";
	}	
	
	//@RequestMapping(value="/insertBoard.do")
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo) {
		System.out.println(">>> 글 등록 요청 처리(insertBoard)");
		
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		boardService.insertBoard(vo);
		
		return "getBoardList.do";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(
			@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 글 수정 요청 처리(updateBoard)");
		//전달받은 파라미터값을 사용해서 입력처리
		//스프링에서 파라미터값을 BoardVO 타입의 객체에 입력하고 vo변수에 주입
		System.out.println("update vo: " + vo);
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}	
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(">>> 글 삭제 요청 처리(deleteBoard)");
		boardService.deleteBoard(vo);
		return "getBoardList.do";
	}	
	
}
