package com.scriptwhale.board.service;

import com.scriptwhale.board.repository.BoardDAO;
import com.scriptwhale.board.repository.CommentsDAO;
import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
    @Autowired
    private BoardDAO boardDAO;
    @Autowired
    private CommentsDAO commentsDAO;

    @Override
    public List<Board> selectList() {
        return boardDAO.selectList();
    } // selectList() end

    @Override
    public Board selectPost(int no) {
        return boardDAO.selectPost(no);
    }

    @Override
    public int insertPost(Board board) {
        return boardDAO.insert(board);
    }


    /* 댓글 부분 */
    @Override
    public List<Comment> commentList(int no) {
        return commentsDAO.commentList(no);
    } // commentList() end

    @Override
    public int commentCount(int no) {
        return commentsDAO.commentCount(no);
    }


} //BoardServiceImpl end
