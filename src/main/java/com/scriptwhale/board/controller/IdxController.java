package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IdxController {

	@Autowired
	public BoardService boardService;

	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String index(Model model) {
		model.addAttribute("boardList", boardService.selectList());
		return "index";
	}
	
} // IdxController end
