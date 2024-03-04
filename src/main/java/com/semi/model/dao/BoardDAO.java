package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Board;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate session;

	public int insert(Board b) {
		return session.insert("board.insert", b);
	}

	public List<Board> selectAll() {
		return session.selectList("board.selectAll");
	}

	public Board select(int no) {
		return session.selectOne("board.select", no);
	}

	public int update(Board b) {
		return session.update("board.update", b);
	}

	public int delete(int no) {
		return session.delete("board.delete", no);
	}

}