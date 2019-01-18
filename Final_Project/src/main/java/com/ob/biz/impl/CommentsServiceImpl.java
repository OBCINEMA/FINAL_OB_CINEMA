package com.ob.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.CommentsDAO;
import com.ob.biz.service.CommentsService;
import com.ob.biz.vo.CommentsVO;

@Service("commentsService")
public class CommentsServiceImpl implements CommentsService{
	@Autowired
	private CommentsDAO commentsDAO;
	
	public CommentsServiceImpl() {
		System.out.println(">> CommentsServiceImpl 객체 생성");
	}

	@Override
	public void insertComments(CommentsVO vo) {
		commentsDAO.insertComments(vo);
	}

	@Override
	public void updateComments(CommentsVO vo) {
		commentsDAO.updateComments(vo);
	}

	@Override
	public void deleteComments(CommentsVO vo) {
		commentsDAO.deleteComments(vo);
	}

	@Override
	public CommentsVO getComments(CommentsVO vo) {	//쓸 일이 있을까 싶긴한데...
		return commentsDAO.getComments(vo);
	}

	@Override
	public List<CommentsVO> getCommentsList() {
		return commentsDAO.getCommentsList();
	}
}
