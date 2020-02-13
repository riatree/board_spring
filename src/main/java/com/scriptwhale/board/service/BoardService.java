package com.scriptwhale.board.service;

import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Comment;

import java.util.Map;

public interface BoardService {
    public Map<String, Object> getList(int pageNo);

    public Board selectPost(int no);
    public int insertPost(Board board);

    /* 댓글 부분 */
    public Map<String, Object> getCommentList(int boardNo, int pageNo);
    public boolean register(Comment comment);
} //BoardService end
