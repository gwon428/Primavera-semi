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
	
	// 전체 수거 신청 리스트 보기
	public List<Collect> showAllCollect(){
		return dao.showAllCollect(); 
	}
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return dao.registerCollect(vo);
	}
}
