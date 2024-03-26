package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Notice;
import com.semi.model.vo.Paging;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate session;

	public List<Notice> selectAll(Paging paging) {
		return session.selectList("noticeMapper.selectAll", paging);
	}

	public Notice select(int noticeNum) {
		return session.selectOne("noticeMapper.select", noticeNum);
	}

	public int insert(Notice n) {
		return session.insert("noticeMapper.insert", n);
	}

	public int total() {
		return session.selectOne("noticeMapper.total");
	}

	public int update(Notice n) {
		return session.update("noticeMapper.update", n);
	}

	public int delete(int notice_num) {
		return session.delete("noticeMapper.delete", notice_num);
	}

}
