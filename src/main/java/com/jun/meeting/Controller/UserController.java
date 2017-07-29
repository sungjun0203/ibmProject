package com.jun.meeting.Controller;

import com.jun.meeting.Dao.UserDao;
import com.jun.meeting.Service.UserLoginService;
import com.jun.meeting.Service.UserSignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserSignUpService userSignUpService;

    @Autowired
    private UserLoginService userLoginService;

    @RequestMapping("/signUpSuccess")
    public String signUpSuccess(HttpServletRequest request){
        userSignUpService.userSignUpSuccess(request);
        return "///";
    }

    @RequestMapping("/loginCheck")
    @ResponseBody
    public HashMap loginCheck(HttpServletRequest request){

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        String resultString = userLoginService.userLoginService(request);
        resultMap.put("resultData",resultString);

        System.out.println("로그인 성공여부 : "+resultString);

        return resultMap;
    }

    @RequestMapping("/signUp")
    public String signUp(){
        return "/user/signUp";
    }
}
