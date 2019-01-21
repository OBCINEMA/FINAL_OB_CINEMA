package com.ob.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ob.biz.service.MovieService;
import com.ob.biz.service.Movie_HistoryService;
import com.ob.biz.service.UsersService;
import com.ob.biz.vo.MovieVO;
import com.ob.biz.vo.UsersVO;

/*
 ********************************************
	//	페이지 열릴 때(getVoteList.do)
	//1. 로그인 체크(체크로 값 넘김)
	//1-1. 내가 선택한 영화 가져오기(votedmovie 체크)
	//		- VotedMovie 없으면 votedmovieChk 변수값 0 ->뿌려주지 않음
	//		- VotedMovie 있으면 votedmovieChk 변수값 1 ->뿌려줌(votedMovie.do)
	//2. 영화 리스트 가져오기
	//2-1.영화 득표수 상위 5개 득표순으로 뿌려주기(getMovieListByVote)
	//2-2.전체 명화 리스트 
	
	
 *************************************
	//	영화 선택시(vote.do)-Ajax @RestController
	//1.VotedMovieChk값 확인
	//1-1. VotedMovieChk ==0 이면
	//		선택된 영화 idx값
	//		Users - VotedMovie에 넣고 -> updateUsers
	//		해당 영화 Movie - vote +1 	-> updateMovie
	//1-2. VotedMovieChk ==1 이면
	//		Users - VotedMovie -> updateMovie : movie - vote-1
	//		Users - VotedMovie 선택한 영화로 변경 -> updateUsers : users - votedmovie
	//		선택된 영화 updateMovie : movie - vote+1
	//2.내가 선택한 영화 바꾸기(votedMovie)
	//3.득표수 기준 재정렬(getMovieListByVote)
	
	
 *************************************
	//	영화 업데이트 자동화(서버시간 기준? 날짜 요일 기준? 아니면 인터벌로 일주일마다 반복실행)
	//0. 전체 영화 list중 기존 onAir==1인 영화들(getMovieListOnair 1로? 아니면 전체 리스트 중 ) updateMovie onair=0
	//1. 기존 상영예정작 onAir==-1인 영화들(getMovieListOnair -1로) updateMovie onair=1
	//1. 영화 득표수 상위 5개(getMovieListByVote)
	//1-1. 각각 updateMovie - onair == -1
	//1-2. insertMovie_History - h_id = (SELECT NVL(MAX(H_ID),0)+1 FROM MOVIE_HISTORY),
	//							day_start = sysdate, day_end = sysdate+7
	
 */

@Controller
public class VoteController {
	@Autowired
	private MovieService movieService;
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private Movie_HistoryService movie_HistoryService;
	
	private UsersVO uvo;
	//집합객체 다중 리턴을 위한 map 선언
	private Map<String,Object> map;
	
	//********************************************
	//	페이지 열릴 때(getVoteList.do)
	//1. 로그인 체크(체크로 값 넘김)
	//1-1. 내가 선택한 영화 가져오기(votedmovie 체크)
	//		- VotedMovie 없으면 votedmovieChk 변수값 0 ->뿌려주지 않음
	//		- VotedMovie 있으면 votedmovieChk 변수값 1 ->뿌려줌(votedMovie.do)
	//2. 영화 리스트 가져오기-Ajax
	//2-1.영화 득표수 상위 5개 득표순으로 뿌려주기(getMovieListByVote)-Ajax
	//2-2.전체 명화 리스트 
	
	//페이지 처음 열릴 시에 투표 페이지로 이동처리
	@RequestMapping(value="/getVoteList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getVoteList(Model model, HttpSession session){
		System.out.println("getVoteList실행");
		session.setAttribute("pageType", "vote");
		List<MovieVO> mList = movieService.getMovieList();
		model.addAttribute("movieListAll", mList);
//		map = voteRefresh(session);
//		model.addAttribute("voteMap", map);
//		System.out.println("voteMap(getVoteList) : " + map);
//		session.setAttribute("pageType","vote");
		return "/views/vote/getVoteList.jsp";
	}
	
	//투표(영화 클릭)시 voteRefresh처리
	@RequestMapping(value="/vote.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> vote(int m_id, HttpSession session){
		System.out.println("vote실행");
		//기존 DB의 vote정보 가져옴
		map = voteRefresh(session);

		//로그인체크
		int loginChk = (int)map.get("loginChk");
		
		//로그인 안 된 경우
		if(loginChk==0) return map;
		
		//로그인 된 경우 - voteCompute(투표 메커니즘 내부적처리) 
		map = voteCompute(m_id, map);
		
		return map;
	}
	
	//실제 vote 기능
	@RequestMapping(value="/voteRefresh.do", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> voteRefresh(HttpSession session){
		System.out.println("voteRefresh실행");
		map = new HashMap<>();
		uvo = (UsersVO)session.getAttribute("Logininformation");
		
		//로그인체크
		int loginChk = _loginChk();
		map.put("loginChk", loginChk);
		
		//선택한 영화
		if(loginChk==1) {
			MovieVO mvo = _votedmovie();
			map.put("votedmovie", mvo);
		}
		
		//득표수 높은 영화 5개
		List<MovieVO> mListByVote = _getMovieListByVote();
		map.put("mListByVote", mListByVote);
		
		//영화 전체 리스트 가져오기
		List<MovieVO> mList = _getMovieList();
		map.put("mList", mList);
		
//		System.out.println("voteRefreshMap : " + map);
		return map;
	}
	

	//*************************************
	
//	@RequestMapping("/vote.do")
//	@ResponseBody
//	public Map<String, Object> vote(){
//		System.out.println("vote check;;;;;;");
//		Map<String,Object> map = new HashMap<>();
//		MovieVO mvo = _votedmovie();
//		List<MovieVO> mListByVote = _getMovieListByVote();
//		List<MovieVO> mList = _getMovieList();
//		map.put("votedmovie", mvo);
//		map.put("mListByVote", mListByVote);
//		map.put("mList", mList);
//		
//		return map;
//	}

	//*************************************
	//	득표수 기준 정렬(n개) (getMovieListByVote.do)-Ajax @RestController

	//********************************************************************************
		//로그인체크(loginChk == 0 : 로그인안됨 / loginChk == 1 : 로그인 됨)
		private int _loginChk() {
			int loginChk = 0;
			if(uvo==null) {		//로그인 안된 경우
				System.out.println("로그인안됨");
				loginChk = 0;
			} else {			//로그인 된 경우
				System.out.println("로그인됨");
				loginChk = 1;
			}
			return loginChk;
		}
		
		//내가 선택한 영화(투표여부체크)
		private MovieVO _votedmovie() {
			int votedmovie = uvo.getVotedmovie();
			MovieVO mvo = new MovieVO();
			if(votedmovie!=0) {	//로그인 됨-투표한 영화 있을 때
				mvo.setM_id(votedmovie);
				mvo = movieService.getMovie(mvo);
			}
			return mvo;
		}
		
		//영화 리스트 전체 가져오기
		private List<MovieVO> _getMovieList(){
			return movieService.getMovieList();
		}
		
		//영화 득표수 상위 5개 가져오기(SQL로)
		private List<MovieVO> _getMovieListByVote(){
			return movieService.getMovieListByVote();
		}
		
		//vote 내부적 처리
		private Map<String,Object> voteCompute(int m_id, Map<String,Object> map){
			System.out.println("voteCompute 실행");
			//로그인 된 경우 : 기존선택영화 vote-1
			MovieVO mvo = (MovieVO)map.get("votedmovie");
//			System.out.println("votedmovie : " + mvo);
			int vote  = mvo.getVote();
			if(vote!=0) {
				mvo.setVote(vote-1);
				movieService.updateMovie(mvo);
			}
			
			//새로 선택한 영화(파라미터 m_id)로 users - votedmovie update처리
			System.out.println("uvo : " + uvo);
			System.out.println("m_id : " + m_id);
			uvo.setVotedmovie(m_id);
			usersService.updateUsersVote(uvo);
			
			//새로 선택한 영화 vote+1
			mvo.setM_id(m_id);
			mvo = movieService.getMovie(mvo);
			mvo.setVote(mvo.getVote()+1);
			movieService.updateMovie(mvo);
			
			return map;
		}
		
		//onair update 처리(일주일 단위 자동반복 - interval 사용?)
		//상영중(onair==1) -> 상영종료(onair==0)
		//상영예정작(onair==-1) -> 상영중(onair==1)
		//	movie_history에 반영
		//	schedule에 분배
		//보고싶은 명화 페이지 득표수 상위 5개영화 상영예정(onair==-1)처리
		private void updateOnair() {
			
		}
	//********************************************************************************
}
