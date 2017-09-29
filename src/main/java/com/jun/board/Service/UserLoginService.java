package com.jun.board.Service;

import com.jun.board.Dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;

@Service
public class UserLoginService {

    @Autowired
    private UserDao userDao;

    // 유저 로그인 서비스
    public String userLoginService(HttpServletRequest request) {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        HashMap<String,Object> loginInformation = new HashMap<String,Object>();

        loginInformation.put("email",email);
        loginInformation.put("password",password);

        int loginCheck = userDao.userLogin(loginInformation);
        
        if(loginCheck==1){
            return "loginSuccess";
        }
        else{
            return "loginFail";
        }

    }
}
