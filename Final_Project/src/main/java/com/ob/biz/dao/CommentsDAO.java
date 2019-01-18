package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.CommentsVO;

@Repository("commentsDAO")
public class CommentsDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//댓글입력
	public void insertComments(CommentsVO vo) {
		mybatis.insert("CommentsDAO.insertComments", vo);
	}
	
	//댓글수정
	public void updateComments(CommentsVO vo) {
		mybatis.update("CommentsDAO.updateComments",vo);
	}
	
	//댓글 삭제
	public void deleteComments(CommentsVO vo) {
		mybatis.delete("CommentsDAO.updateComments",vo);
	}
	
	//댓글 조회(댓글1개 조회가 별 의미는 없을 것 같은데 일단 만들어봄)
	public CommentsVO getComments(CommentsVO vo) {
		return mybatis.selectOne("CommentsDAO.getComments",vo);
	}
	
	//댓글 목록 조회(게시물별)
	public List<CommentsVO> getCommentsList(){
		return mybatis.selectList("CommentsDAO.getCommentsList");
	}
}
