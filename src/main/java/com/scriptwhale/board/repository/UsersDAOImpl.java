package com.scriptwhale.board.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAOImpl implements UsersDAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String selectUserId(String name) {
		return sqlSession.selectOne("users.selectUserId", name);
	} // selectUserId() end

} // UsersDAO end
