package com.semi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.model.dao.ProgressDAO;
import com.semi.model.vo.Collect;

@Service
public class ProgressService {

	@Autowired
	private ProgressDAO dao;

	public int registerProg(Collect collect) {
		return dao.registerProg(collect);
	}
}
