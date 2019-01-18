package com.ob.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ob.biz.vo.PlusVO;


	@Repository("plusDAO")
	public class PlusDAO {
		@Autowired
		private SqlSessionTemplate mybatis;
		
		public List<PlusVO> getPlusList() {
			return mybatis.selectList("PlusDAO.getPlusALL");
		}

		public List<PlusVO> getPlusTitlebyt_id(PlusVO vo) {
			return mybatis.selectList("PlusDAO.getPlusTitlebyt_id", vo);
		}

		public PlusVO getPlusTitlebysch_id(PlusVO vo) {
			return mybatis.selectOne("PlusDAO.getPlusTitlebysch_id", vo);
		}

		
}