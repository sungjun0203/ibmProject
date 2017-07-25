package com.jun.meeting.Controller;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private TestService testService;

    @RequestMapping("/signUp")
    public String signUp(){

        Integer daoCheck = testService.getCurrentDataTime();
        System.out.println(daoCheck);

        return "/user/signUp";
    }


}
