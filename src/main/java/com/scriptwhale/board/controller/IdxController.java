package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class IdxController {

	@Autowired
	public BoardService boardService;

	@RequestMapping(value = {"/","/index"}, method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/ajax/post/list/{pageNo}", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> postList(@PathVariable int pageNo) {
		return boardService.getList(pageNo);
	}
	
} // IdxController end
