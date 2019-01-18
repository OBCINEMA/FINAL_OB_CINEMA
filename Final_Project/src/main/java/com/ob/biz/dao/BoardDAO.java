package com.ob.biz.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.BoardVO;
import com.ob.biz.vo.PageVO;

@Repository // 이름을 지정해주지 않으면 BoardDAO클래스 이름 첫글자 소문자로
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 상세조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("==========================> Mybatis2로 getBoard() 처리");
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}

	// 게시글 전체조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("==========================> Mybatis2로 getBoardList() 처리");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}

	// 게시글 입력
	public void insertBoard(BoardVO vo) {
		System.out.println("==========================> Mybatis2로 insertBoard() 처리");
		mybatis.insert("BoardDAO.insertBoard", vo);

	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("==========================> Mybatis2로 updateBoard() 처리");
		mybatis.insert("BoardDAO.updateBoard", vo);
	}

	public void deleteBoard(BoardVO vo) {
		System.out.println("==========================> Mybatis2로 deleteBoard() 처리");
		mybatis.insert("BoardDAO.deleteBoard", vo);
	}

	// ==== 공지사항(Notice) ====
	public void insertNotice(BoardVO vo) {
		mybatis.insert("BoardDAO.insertNotice", vo);
	}

	// 공지사항 게시물 업데이트
	public void updateNotice(BoardVO vo) {
		mybatis.update("BoardDAO.updateNotice", vo);
	}

	// 공지사항 게시물 삭제
	public void deleteNotice(BoardVO vo) {
		mybatis.delete("BoardDAO.deleteNotice", vo);
	}

	// 공지사항 전체 리스트 조회
	public List<BoardVO> getNoticeList(Map<String, Integer> map) {
		return mybatis.selectList("BoardDAO.getNoticeList", map);
	}

	// 공지사항 게시물 상세보기
	public BoardVO getNotice(BoardVO vo) {
		mybatis.update("BoardDAO.noticeViewCnt", vo);
		return mybatis.selectOne("BoardDAO.getNotice", vo);
	}

	// 공지사항 게시물 조회수
	public void noticeViewCnt(BoardVO vo) {
		mybatis.update("BoardDAO.noticeViewCnt", vo);
	}

	// 공지사항 총 페이지 수
	public int totalCnt() {
		int totalCnt = mybatis.selectOne("BoardDAO.totalCnt");
		return totalCnt;
	}
}
