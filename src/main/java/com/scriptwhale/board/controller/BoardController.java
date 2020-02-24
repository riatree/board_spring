package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.BoardService;
import com.scriptwhale.board.vo.Board;
import com.scriptwhale.board.vo.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/post/{no}", method = RequestMethod.GET)
    public String post(@PathVariable int no, Model model){
        model.addAttribute("post", boardService.selectPost(no));
        return "post";
    }

    @RequestMapping(value = "/post", method = RequestMethod.GET)
    public String writeForm() {
        return "postForm";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String postInsert(Board board) {
        boardService.insertPost(board);
        return "redirect:/";
    }

    @RequestMapping(value = "/ajax/post/comment", method = RequestMethod.POST)
    @ResponseBody
    public String registerComment(Comment comment) {
        boolean flag = boardService.register(comment);
        return "{\"result\" : " + flag + "}";
    }

    @RequestMapping(value = "/ajax/post/{boardNo}/page/{pageNo}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Map<String, Object> getCommentList(@PathVariable int boardNo, @PathVariable int pageNo) {
        return boardService.getCommentList(boardNo, pageNo);
    }

    @RequestMapping(value = "/ajax/post/comment/delete", method = RequestMethod.POST, produces = "application/json;charset=UTF-8" )
    @ResponseBody
    public String removeComment(int commentNo){
        boolean flag = boardService.removeComment(commentNo);
        return "{\"result\" : " + flag + "}";
    }

} // BoardController end
