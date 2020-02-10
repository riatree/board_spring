package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.UsersService;
import com.scriptwhale.board.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;


@Controller
public class UserController {
    @Autowired
    public UsersService usersService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage() {
        System.out.println("GET /login : 로그인 페이지 ");
        return "login";
    } //loginPage() end

    @RequestMapping(value="/session", method=RequestMethod.POST)
    public String login(User user, HttpSession session, @RequestHeader String referer) {
        session.setAttribute("loginUser", usersService.login(user));
        return "redirect:/";
        // return "redirect:"+referer;
    } //login() end

    @RequestMapping(value = "/session", method = RequestMethod.DELETE)
    public String logout(HttpSession session, @RequestHeader String referer) {
        session.invalidate();
        return "redirect:"+referer;
    } // logout() end

} //UserController end
