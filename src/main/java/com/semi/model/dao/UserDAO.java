package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.Board;
import com.semi.model.vo.Paging;
import com.semi.model.vo.Pagingseven;
import com.semi.model.vo.Qna;
import com.semi.model.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public User check(String id) {
		return session.selectOne("userMapper.idCheck", id);
	}
	
	public User checkUser(User user) {
		return session.selectOne("userMapper.userCheck", user);
	}
	
	public int registerUser(User user) {
		return session.insert("userMapper.registerUser", user);
	}
	
	public User getMemberById(String id) {
		return session.selectOne("userMapper.getMemberById", id);
	}
	
	public int updateCheck(String inputPwd) {
		return session.selectOne("userMapper.updateCheck", inputPwd);
	}
	
	public int updateUser(User user) {
		return session.update("userMapper.updateUser", user);
	}

	public int deleteUser(UserDetails userDetails) {
		return session.update("userMapper.deleteUser", userDetails);
	}

	public List<User> showAllUser(Paging paging) {
		return session.selectList("userMapper.showAllUser", paging);
	}
	
	public int total() {
		return session.selectOne("userMapper.count");
	}
	
	public User findId(User user) {
		return session.selectOne("userMapper.findId", user);
	}
	
	public User checkEmail(User user) {
		return session.selectOne("userMapper.checkEmail", user);
	}
	
	
	// 내가 쓴 리뷰 리스트 출력
	public List<Board> showReview(Pagingseven paging){
		return session.selectList("board.showReview", paging);
	}

	public int totalmyReview(String id) {
		return session.selectOne("board.countmyReview", id);
	}
	
	// 내가 쓴 Q&A 리스트 출력
	public List<Qna> showQna(Pagingseven paging){
		return session.selectList("qnaMapper.showQna", paging);
	}
	
	public int totalmyQna(String id) {
		return session.selectOne("qnaMapper.countmyQna", id);
	}

	// 비밀번호 재설정
	public int updatePwd(User user) {
		return session.update("userMapper.updatePwd", user);
	}
}
