package com.jun.board.Controller;

import com.jun.board.Service.CommonService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.Map;

@Controller
@RequestMapping("/common")
public class CommonController {

    @Autowired
    CommonService commonService;

    // 사용자 권환 확인
    @RequestMapping("/userTypeCheck")
    @ResponseBody
    public String userTypeCheck(HttpSession session){
       
    	String userType = commonService.userTypeCheck(session);
        return userType;
    }
    
    // 로그아웃
    @RequestMapping("/logout")
    @ResponseBody
    public void logout(HttpSession session){
    	commonService.logout(session);
    }

}
