package com.scriptwhale.board.controller;

import com.scriptwhale.board.service.UsersService;
import com.scriptwhale.board.vo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
        if(usersService.login(user) != null) {
            return "redirect:/";
        } else {
            return "login";
        }
        // return "redirect:"+referer;
    } //login() end

    @RequestMapping(value = "/session", method = RequestMethod.DELETE)
    public String logout(HttpSession session, @RequestHeader String referer) {
        session.invalidate();
        return "redirect:"+referer;
    } // logout() end

    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String userJoin() {
        return "join";
    } // joinForm() end

    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String registerUser(User user) {
        usersService.insert(user);
        return "/login";
    }

    @RequestMapping(value = "/ajax/user/check/id", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkId(String id) {
        return "{\"count\":" + usersService.checkId(id) + "}";
    }

    @RequestMapping(value = "/ajax/user/check/name", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String checkName(String name) {
        return "{\"count\":" + usersService.checkName(name) + "}";
    }

} //UserController end
