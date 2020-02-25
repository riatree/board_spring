package com.scriptwhale.board.repository;

import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Page;

import java.util.List;

public interface BoardDAO {
    //public List<Board> selectList();

    public List<Board> selectList(Page page);
    public int selectTotal();

    public Board selectPost(int no);
    public int insert(Board board);
    public int delectPost(int no);
} //BoardDAO end
