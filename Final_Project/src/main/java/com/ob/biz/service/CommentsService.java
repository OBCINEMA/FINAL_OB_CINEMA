package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.CommentsVO;

public interface CommentsService {
	//댓글입력
	void insertComments(CommentsVO vo);
	//댓글수정
	void updateComments(CommentsVO vo);
	//댓글삭제
	void deleteComments(CommentsVO vo);
	//댓글조회	- 댓글은 1개 조회가 별 의미 없는 것 같긴한데 일단 만듦
	CommentsVO getComments(CommentsVO vo);
	//댓글전체조회(게시물별)
	List<CommentsVO> getCommentsList();
}
