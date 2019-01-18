package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.UsersVO;

@Repository("usersDAO") // 이름을 지정해주지 않으면클래스 이름 첫글자 소문자로
public class UsersDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	//회원 등록
	public void insertUsers(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 insertUsers() 처리");
		mybatis.insert("UsersDAO.insertUsers", vo);
	};
	//회원정보 수정
	public void updateUsers(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 updateUsers() 처리");
		System.out.println("DAO- updateUsers실행. uvo : " + vo);
		mybatis.update("UsersDAO.updateUsers", vo);
	};
	//votedmovie 수정 .
	public void updateUsersVote(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 updateUsersVote() 처리");
		mybatis.update("UsersDAO.updateUsersVote", vo);
	};
	//votedmovie 초기화
	public void resetVotedMovie() {
		System.out.println("==========================> Mybatis2로 resetVotedMovie() 처리");
		mybatis.update("UsersDAO.resetVotedMovie");
	};
	//회원 탈퇴
	public void deleteUsers(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 deleteUsers() 처리");
		mybatis.delete("UsersDAO.deleteUsers", vo);
	};
	//회원정보 상세조회
	public UsersVO getUsers(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 getUsers() 처리");
		return mybatis.selectOne("UsersDAO.getUsers", vo);
	}
	//회원목록 전체조회
	public List<UsersVO> getUsersList(){
		System.out.println("==========================> Mybatis2로 getUsersList() 처리");
		return mybatis.selectList("UsersDAO.getUsersList");
	}
	
	public UsersVO getUserOne(UsersVO vo) {
		System.out.println("UsersDAO : " + vo);
		return mybatis.selectOne("UsersDAO.getUserOne");
	}
		
	//회원 ID 조회
	public int idcheck(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 idcheck() 처리");
		return mybatis.selectOne("UsersDAO.idcheck", vo);
	}
	//네이버 카카오 vo 조회
	public UsersVO getApiUsers(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 getApiUsers() 처리");
		return mybatis.selectOne("UsersDAO.getApiUsers",vo);
	}
	// Email 추가
	public int updateUsersEmail(UsersVO vo) {
		System.out.println("==========================> Mybatis2로 이메일 추가하기() 처리");
		 return mybatis.delete("UsersDAO.updateUsersEmail", vo);
		
	}
	//아이디 찾기
	public String findIDchk(UsersVO vo) {
		return mybatis.selectOne("UsersDAO.findIDchk",vo);
	}
	// 아이디랑 이메일로 존재여부 확인
	public int findPWchk(UsersVO vo) {
		return mybatis.selectOne("UsersDAO.findPWchk",vo);
	}
	public int update_pw(UsersVO vo) {
		return mybatis.update("UsersDAO.update_pw",vo);
	}
	
}
