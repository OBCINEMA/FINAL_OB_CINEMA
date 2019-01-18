package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.UsersVO;

public interface UsersService {
	// 회원 등록
	public void insertUsers(UsersVO vo);

	// 회원정보 수정
	public void updateUsers(UsersVO vo);
	
	// 투표후 vot만 회원정보 수정
	public void updateUsersVote(UsersVO vo);
	
	// votedmovie 초기화
	public void resetVotedMovie();

	// 회원 탈퇴
	public void deleteUsers(UsersVO vo);

	// 회원정보 상세 조회
	public UsersVO getUsers(UsersVO vo);

	// 회원목록 전체조회
	public List<UsersVO> getUsersList();

	// 회원정보 아이디로 조회
	public UsersVO getUserOne(UsersVO vo);

	// 아이디 중복 검사
	public int idcheck(UsersVO vo);

	// API 회원정보 상세 조회
	public UsersVO getApiUsers(UsersVO vo);

	// 이메일 추가 하기
	public int updateUsersEmail(UsersVO vo);
	
	//아이디 찾기 
	public String findIDchk(UsersVO vo);

	//아이디랑 이메일로 정보 있나 없나
	public int findPWchk(UsersVO vo);
	
	//아이디를 없뎃시키기
	public int update_pw(UsersVO vo);
}
