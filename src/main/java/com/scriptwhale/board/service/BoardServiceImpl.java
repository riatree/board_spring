package com.scriptwhale.board.service;

import com.scriptwhale.board.repository.BoardDAO;
import com.scriptwhale.board.repository.CommentsDAO;
import com.scriptwhale.board.util.PaginateUtil;
import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Comment;
import com.scriptwhale.board.vo.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
    @Autowired
    private BoardDAO boardDAO;
    @Autowired
    private CommentsDAO commentsDAO;

    /*@Override
    public List<Board> selectList() {
        return boardDAO.selectList();
    } // selectList() end*/

    @Override
    public Map<String, Object> getList(int pageNo) {
        Map<String, Object> map = new ConcurrentHashMap<>();

        int numPage = 5;
        int numBlock = 5;
        Page page = new Page(pageNo, numPage);
        List<Board> list = boardDAO.selectList(page);
        int total = boardDAO.selectTotal();
        String url = "/post/page/";
        String paginate = PaginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
        map.put("list", list);
        map.put("paginate", paginate);
        return map;
    }


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
    public Map<String, Object> getCommentList(int boardNo, int pageNo) {
        Map<String, Object> map = new ConcurrentHashMap<>();
        int numPage = 5;
        Page page = new Page(pageNo, numPage, boardNo);
        List<Comment> list = commentsDAO.selectList(page);
        int total = commentsDAO.selectTotal(boardNo);

        map.put("commentList", list);
        map.put("total", total);

        return map;
    }

    @Override
    public boolean register(Comment comment) {
        return 1 == commentsDAO.insert(comment);
    }


} //BoardServiceImpl end
