package com.ob.biz.service;

import java.util.List;

import com.ob.biz.vo.PlusVO;

public interface PlusService {
	
	//3컬럼 전체 조회 (현재 사용X)
	List<PlusVO> getPlusList();
	
	List<PlusVO> getPlusTitlebyt_id(PlusVO vo);
	
	//겟
	PlusVO getPlusTitlebysch_id(PlusVO vo);
	
	
}
