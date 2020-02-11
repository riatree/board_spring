package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Board;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDAOImpl implements BoardDAO {
    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Board> selectList() {
        return sqlSession.selectList("board.selectList");
    }

    @Override
    public Board selectPost(int no) {
        return sqlSession.selectOne("board.selectPost", no);
    }

    @Override
    public int insert(Board board) {
        return sqlSession.insert("board.insert", board);
    }


} //BoardDAOImpl end
