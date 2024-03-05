package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Collect;
import com.semi.model.vo.PagingCollect;

@Repository
public class CollectDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 전체 수거 신청 리스트 보기
	public List<Collect> showAllCollect(PagingCollect paging){
		return session.selectList("collectMapper.showAllCollect", paging);
	}
	
	public int total() {
		return session.selectOne("collectMapper.count");
	}
	
	// 수거 신청 
	public int registerCollect(Collect vo) {
		return session.insert("collectMapper.registerCollect", vo);
	}
}
