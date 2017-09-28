package com.jun.board.Controller;

import com.jun.board.Dao.UserDao;
import com.jun.board.Service.UserLoginService;
import com.jun.board.Service.UserSignUpService;

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


@Controller
@RequestMapping("/user")
public class UserController {
	
	

    @Autowired
    private UserDao userDao;

    @Autowired
    private UserSignUpService userSignUpService;

    @Autowired
    private UserLoginService userLoginService;

    // 회원가입 이메일 전송
    @ResponseBody
    @RequestMapping("/signUpEmailSend")
    public HashMap<String, Object> signUpEmailSend(HttpServletRequest request){
        HashMap<String,Object> result = userSignUpService.emailCheck(request);
        return result;
    }

    // 회원가입 완료
    @RequestMapping("/signUpSuccess")
    public String signUpSuccess(HttpServletRequest request){
        userSignUpService.userSignUpSuccess(request);
        return "redirect:/";
    }

    // 로그인 체크
    @RequestMapping("/loginCheck")
    @ResponseBody
    public HashMap<String, Object> loginCheck(HttpServletRequest request){

        HashMap<String,Object> resultMap = new HashMap<String,Object>();
        String resultString = userLoginService.userLoginService(request);
        resultMap.put("resultData",resultString);
        return resultMap;
    }

    // 회원가입 페이지
    @RequestMapping("/signUp")
    public String signUp(){
        return "/user/signUp";
    }
}
