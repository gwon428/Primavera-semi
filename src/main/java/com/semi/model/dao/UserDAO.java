package com.semi.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.semi.model.vo.User;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	public int registerUser(User user) {
		return session.insert("userMapper.registerUser", user);
	}

	public User signIn(User user) {
		return session.selectOne("userMapper.signIn", user);
	}

	public int userCheck(User user) {
		return session.selectOne("userMapper.userCheck", user);
	}

	public List<User> showAllUser() {
		return session.selectList("userMapper.showAllUser");
	}

}
