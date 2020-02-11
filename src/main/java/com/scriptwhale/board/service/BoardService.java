package com.scriptwhale.board.service;

import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Comment;

import java.util.List;

public interface BoardService {
    public List<Board> selectList();
    public Board selectPost(int no);
    public int insertPost(Board board);

    /* 댓글 부분 */
    public List<Comment> commentList(int no);
    public int commentCount(int no);
} //BoardService end
