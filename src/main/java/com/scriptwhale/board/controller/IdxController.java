package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IdxController {
	
	@Autowired
	private UsersService usersService;

	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("userId", usersService.selectUserId("scriptwhale"));
		return "/index";
	}
	
} // IdxController end
