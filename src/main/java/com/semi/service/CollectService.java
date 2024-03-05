package com.semi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.CollectDAO;
import com.semi.model.vo.Collect;

@Service
public class CollectService {
	
	@Autowired
	private CollectDAO dao;
	
	// 관리자용 수거신청현황 페이지 (prog제외)
	public List<Collect> showAllCollect(){
		return dao.showAllCollect(); 
	}
	
	// 회원용 진행상황 페이지용 
		public List<Collect> showCollect(){
			return dao.showCollect();
	}
		
	// 관리자용 progress 페이지
	public int updateCollect() {
		return dao.updateCollect();
	}
		
		
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return dao.registerCollect(vo);
	}
}
