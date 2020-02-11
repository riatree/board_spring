package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Comment;

import java.util.List;

public interface CommentsDAO {
    public List<Comment> commentList(int no);
    public int commentCount(int no);
} //CommentsDAO end
