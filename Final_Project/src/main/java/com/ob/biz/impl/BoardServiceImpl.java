package com.ob.biz.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ob.biz.dao.BoardDAO;
import com.ob.biz.service.BoardService;
import com.ob.biz.vo.BoardVO;

// @Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		return boardDAO.getBoardList(vo);
	}

	// 공지사항 부분
	@Override
	public void insertNotice(BoardVO vo) {
		boardDAO.insertNotice(vo);
	}

	@Override
	public void updateNotice(BoardVO vo) {
		boardDAO.updateNotice(vo);
	}

	@Override
	public void deleteNotice(BoardVO vo) {
		boardDAO.deleteNotice(vo);
	}

	@Override
	public List<BoardVO> getNoticeList(Map<String, Integer> map) {
		return boardDAO.getNoticeList(map);
	}

	@Override
	public BoardVO getNotice(BoardVO vo) {
		return boardDAO.getNotice(vo);
	}

	@Override
	public void noticeViewCnt(BoardVO vo) {
		boardDAO.noticeViewCnt(vo);
	}

	@Override
	public int totalCnt() {
		return boardDAO.totalCnt();
	}

}

//// BoardDAOMybatis1(쓰는 원본)
/*
 * package com.spring.biz.board.impl;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.spring.biz.board.BoardService; import
 * com.spring.biz.board.BoardVO;
 * 
 * //@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
 * 
 * @Service("boardService") public class BoardServiceImpl implements
 * BoardService {
 * 
 * @Autowired private BoardDAOMybatis1 boardDAO;
 * 
 * public BoardServiceImpl() { System.out.println(">> BoardServiceImpl 객체생성"); }
 * 
 * @Override public void insertBoard(BoardVO vo) { boardDAO.insertBoard(vo); }
 * 
 * @Override public void updateBoard(BoardVO vo) { boardDAO.updateBoard(vo); }
 * 
 * @Override public void deleteBoard(BoardVO vo) { boardDAO.deleteBoard(vo); }
 * 
 * @Override public BoardVO getBoard(BoardVO vo) { return boardDAO.getBoard(vo);
 * }
 * 
 * @Override public List<BoardVO> getBoardList(BoardVO vo) { return
 * boardDAO.getBoardList(vo); }
 * 
 * }
 */
// ---------------------------------------------------------------------------------------------

// -------------------------------------------------------------------------------------------
// BoardDAO(쓰는 원본)
/*
 * package com.spring.biz.board.impl;
 * 
 * import java.util.List;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.spring.biz.board.BoardService; import
 * com.spring.biz.board.BoardVO;
 * 
 * //@Service : @Component를 상속받아 만든 비즈니스 로직처리 서비스 영역에 사용
 * 
 * @Service("boardService") public class BoardServiceImpl implements
 * BoardService{
 * 
 * @Autowired private BoardDAO boardDAO;
 * 
 * public BoardServiceImpl() { System.out.println(">> BoardServiceImpl 객체생성"); }
 * 
 * @Override public void insertBoard(BoardVO vo) { boardDAO.insertBoard(vo); }
 * 
 * @Override public void updateBoard(BoardVO vo) { boardDAO.updateBoard(vo); }
 * 
 * @Override public void deleteBoard(BoardVO vo) { boardDAO.deleteBoard(vo); }
 * 
 * @Override public BoardVO getBoard(BoardVO vo) { return boardDAO.getBoard(vo);
 * }
 * 
 * @Override public List<BoardVO> getBoardList(BoardVO vo) { return
 * boardDAO.getBoardList(vo); }
 * 
 * }
 */