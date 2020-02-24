package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Comment;
import com.scriptwhale.board.vo.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentsDAOImpl implements CommentsDAO {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Comment> selectList(Page page) {
        return sqlSession.selectList("comments.selectList", page);
    }

    @Override
    public int selectTotal(int boardNo) {
        return sqlSession.selectOne("comments.selectTotal", boardNo);
    }

    @Override
    public int delect(int commentNo) {
        return sqlSession.update("comments.delect", commentNo);
    }

    @Override
    public int insert(Comment comment) {
        return sqlSession.insert("comments.insert", comment);
    }


} //CommentsDAOImpl end
