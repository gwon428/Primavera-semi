package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Collect;

@Repository
public class CollectDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 관리자용 수거신청현황 페이지 (prog제외)
	public List<Collect> showAllCollect(){
		return session.selectList("collectMapper.showAllCollect");
	}
	
	// 회원용 진행상황 페이지용 
	public List<Collect> showCollect(){
		return session.selectList("collectMapper.showCollect");
	}
	
	// 관리자용 progress 페이지
	public int updateCollect() {
		return session.update("collectMapper.updateCollect");
	}
	
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return session.insert("collectMapper.registerCollect", vo);
	}
}
