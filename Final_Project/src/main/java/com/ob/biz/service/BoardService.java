package com.ob.biz.service;

import java.util.List;
import java.util.Map;

import com.ob.biz.vo.BoardVO;
import com.ob.biz.vo.PageVO;

public interface BoardService {
	// CRUD 기능 구현 메소드 정의
	// 글 입력
	void insertBoard(BoardVO vo);

	// 글 수정
	void updateBoard(BoardVO vo);

	// 글 삭제
	void deleteBoard(BoardVO vo);

	// 글 상세 조회
	BoardVO getBoard(BoardVO vo);

	// 글 목록 전체 조회(게시판별)
	List<BoardVO> getBoardList(BoardVO vo);

	// 공지사항 게시물 입력
	void insertNotice(BoardVO vo);

	// 공지사항 게시물 수정
	void updateNotice(BoardVO vo);

	// 공지사항 게시물 삭제
	void deleteNotice(BoardVO vo);

	// 공지사항 게시물 전체리스트 조회
	List<BoardVO> getNoticeList(Map<String, Integer> map);

	// 공지사항 게시물 상세 조회
	BoardVO getNotice(BoardVO vo);

	// 공지사항 조회수
	void noticeViewCnt(BoardVO vo);

	// 공지사항 총 페이지 수
	int totalCnt();
}
