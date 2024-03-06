package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.PagingCollect;
import com.semi.model.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
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

	public List<User> showAllUser(PagingCollect paging) {
		return session.selectList("userMapper.showAllUser", paging);
	}
	
	public int total() {
		return session.selectOne("userMapper.count");
	}
}
