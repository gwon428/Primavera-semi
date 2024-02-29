package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.BoardVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;
			
	 public List<BoardVO> getAllBoard() {
		 return session.selectList("boardMapper.getAllBoard");
	    }
	 
	 public int writeBoard(BoardVO boardVO) {
		 return session.insert("boardMapper.getAllBoard", boardVO);
	    }
	
}
