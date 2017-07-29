package com.jun.meeting.Service;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by Jun on 2017-07-29.
 */
@Service
public class CommonService {

    @Autowired
    UserDao userDao;

    public String userTypeCheck(HttpSession session){

        String userEmail = (String)session.getAttribute("userEmail");
        String userType = userDao.userTypeCheck(userEmail);

        System.out.println(userType);
        return userType;
    }
}
