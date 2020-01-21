package com.scriptwhale.board.controller;

import com.scriptwhale.board.repository.UsersDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.scriptwhale.board.repository.UsersDAOImpl;

@Controller
public class IdxController {
	
	@Autowired
	private UsersDAO usersDAO;

	@RequestMapping(value = "/")
	public String index(Model model) {
		model.addAttribute("userId", usersDAO.selectUserId("scriptwhale"));
		return "/index";
	}
	
} // IdxController end
