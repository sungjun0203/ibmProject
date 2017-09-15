package com.jun.board.Service;

import com.jun.board.Dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.swing.*;

import java.util.HashMap;

/**
 * Created by Jun on 2017-07-29.
 */

@Service
public class UserInformationService {

    @Autowired
    UserDao userDao;

    public HashMap<String,Object> userInformation(HttpSession session){

        String userEmail = (String)session.getAttribute("userEmail");

        HashMap<String,Object> userInformation = userDao.userInformation(userEmail);
        System.out.println(userInformation);
        return userInformation;
    }
}
