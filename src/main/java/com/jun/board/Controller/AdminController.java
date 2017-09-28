package com.jun.board.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun.board.Dao.UserDao;
import com.jun.board.Service.AdminManagementService;
import com.jun.board.Service.UserLoginService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    AdminManagementService adminManagementService;
    
    @Autowired
    UserLoginService userLoginService;
    
    // 첫 화면
    @RequestMapping("/index")
    public String adminIndex(HttpSession session){
    	return adminManagementService.adminCheck(session);
    }
    
    // 재 로그인 ajax
    @ResponseBody	
    @RequestMapping("/reLogin")
    public HashMap<String,Object> reLogin(HttpServletRequest request, HttpSession session){
    	
    	 HashMap<String,Object> resultMap = new HashMap<String,Object>();
         String resultString = adminManagementService.reLogin(session,request);
         resultMap.put("resultData",resultString);
         return resultMap;
    }
    
    // 매니지먼트 화면
    @RequestMapping("/management")
    public String management(HttpServletRequest request){
    	return "admin/admin_management";
    }
    

    
}
