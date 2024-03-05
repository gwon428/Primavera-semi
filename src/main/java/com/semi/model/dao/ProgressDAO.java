package com.semi.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Collect;

@Repository
public class ProgressDAO {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int registerProg(Collect collect) {
		System.out.println("collect : " + collect);
		return session.insert("progMapper.registerProg", collect);
	}
}
