package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAOImpl implements UsersDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public User selectLogin(User user) {
		return sqlSession.selectOne("users.selectLogin", user);
	}

	@Override
	public int insert(User user) {
		return sqlSession.insert("users.insert", user);
	}

	@Override
	public int selectCheckId(String id) {
		return sqlSession.selectOne("users.selectCheckId", id);
	}

	@Override
	public int selectCheckName(String name) {
		return sqlSession.selectOne("users.selectCheckName", name);
	}


} // UsersDAO end
