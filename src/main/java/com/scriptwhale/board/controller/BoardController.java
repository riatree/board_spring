package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.BoardService;
import com.scriptwhale.board.vo.Board;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    @RequestMapping(value = "/post/{no}", method = RequestMethod.GET)
    public String post(@PathVariable int no, Model model){
        model.addAttribute("post", boardService.selectPost(no));
        model.addAttribute("commentsList", boardService.commentList(no));
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
} // BoardController end
