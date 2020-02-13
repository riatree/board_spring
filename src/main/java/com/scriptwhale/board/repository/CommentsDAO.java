package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Comment;
import com.scriptwhale.board.vo.Page;

import java.util.List;

public interface CommentsDAO {

    public List<Comment> selectList(Page page);
    public int selectTotal(int boardNo);


    public int insert(Comment comment);


} //CommentsDAO end
