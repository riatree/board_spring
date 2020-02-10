package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IdxController {
	
	@Autowired
	private UsersService usersService;

	@RequestMapping(value = {"/","/index"})
	public String index() {
		return "index";
	}
	
} // IdxController end
