package com.jun.meeting.Controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun.meeting.Dao.UserDao;
import com.jun.meeting.Service.AdminManagementService;
import com.jun.meeting.Service.UserLoginService;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    AdminManagementService adminManagementService;
    
    @Autowired
    UserLoginService userLoginService;
    
    @RequestMapping("/index")
    public String adminIndex(HttpSession session){
    	return adminManagementService.adminCheck(session);
    }
    
    @ResponseBody	
    @RequestMapping("/reLogin")
    public HashMap<String,Object> reLogin(HttpServletRequest request, HttpSession session){
    	
    	 HashMap<String,Object> resultMap = new HashMap<String,Object>();
         String resultString = adminManagementService.reLogin(session,request);
         System.out.println(resultString);
         resultMap.put("resultData",resultString);
         return resultMap;
    }
    
    @RequestMapping("/management")
    public String management(HttpServletRequest request){
    	
    	return "admin/admin_management";
    }
    

    
}
