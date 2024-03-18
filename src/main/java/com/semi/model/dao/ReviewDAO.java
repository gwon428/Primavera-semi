package com.semi.model.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.semi.model.vo.Review;
import com.semi.model.vo.Paging;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSessionTemplate session;

	public int insert(Review b) {
		return session.insert("reviewMapper.insert", b);
	}

	public List<Review> selectAll() {
		return session.selectList("reviewMapper.selectAll");
	}

	public Review select(int no) {
		return session.selectOne("reviewMapper.select", no);
	}

	public int updatereview(Review b) {
		return session.update("reviewMapper.updatereview", b);
	}

	public int deletereview(int no) {
		return session.delete("reviewMapper.deletereview", no);
	}

	public List<Review> selectPage(Paging paging) {
		return session.selectList("reviewMapper.selectPage", paging);
	}

	public int total() {
		return session.selectOne("reviewMapper.count");
	}
	
	
}
