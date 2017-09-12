package com.jun.meeting.Controller;

import com.jun.meeting.Dao.UserDao;
import com.jun.meeting.Service.UserLoginService;
import com.jun.meeting.Service.UserSignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @ResponseBody
    @RequestMapping("/signUpEmailSend")
    public HashMap<String, Object> signUpEmailSend(HttpServletRequest request){
        HashMap<String,Object> result = userSignUpService.emailCheck(request);
        return result;
    }

    @RequestMapping("/signUpSuccess")
    public String signUpSuccess(HttpServletRequest request){
        userSignUpService.userSignUpSuccess(request);
        return "redirect:/";
    }

    @RequestMapping("/loginCheck")
    @ResponseBody
    public HashMap loginCheck(HttpServletRequest request){

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        String resultString = userLoginService.userLoginService(request);
        resultMap.put("resultData",resultString);
        return resultMap;
    }

    @RequestMapping("/signUp")
    public String signUp(){
        return "/user/signUp";
    }
}
