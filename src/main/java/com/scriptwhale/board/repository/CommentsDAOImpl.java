package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Comment;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentsDAOImpl implements CommentsDAO {

    @Autowired
    private SqlSession sqlSession;


    @Override
    public List<Comment> commentList(int no) {
        return sqlSession.selectList("comments.selectList", no);
    }

    @Override
    public int commentCount(int no) {
        return sqlSession.selectOne("comments.selectCount", no);
    }


} //CommentsDAOImpl end
