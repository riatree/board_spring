package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAOImpl implements UsersDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public User selectLogin(User user) {
		return sqlSession.selectOne("users.selectLogin", user);
	}
} // UsersDAO end
