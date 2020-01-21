package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebController {

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/test/{name}", method = RequestMethod.GET)
    public String test(Model model, @PathVariable String name) {
        model.addAttribute("usersId" , usersService.selectUserId(name));
        return "test";
    } // test() end

} // WebController end
