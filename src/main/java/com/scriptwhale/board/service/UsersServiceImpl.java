package com.scriptwhale.board.service;

import com.scriptwhale.board.repository.UsersDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("usersService")
public class UsersServiceImpl implements UsersService{

    @Autowired
    private UsersDAOImpl usersDAO;


    @Override
    public String selectUserId(String name) {
        return usersDAO.selectUserId(name);
    } // selectUserId() end

} // UsersServiceImpl end
