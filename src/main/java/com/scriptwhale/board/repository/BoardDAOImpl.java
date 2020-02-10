package com.scriptwhale.board.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
    @Autowired
    private SqlSession sqlSession;


} //BoardDAOImpl end
