package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Board;

import java.util.List;

public interface BoardDAO {
    public List<Board> selectList();
    public Board selectPost(int no);
    public int insert(Board board);
} //BoardDAO end
