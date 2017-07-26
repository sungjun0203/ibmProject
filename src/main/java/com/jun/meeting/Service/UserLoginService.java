package com.jun.meeting.Service;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */

@Service
public class UserLoginService {

    @Autowired
    private UserDao userDao;

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
