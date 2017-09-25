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

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/my")
public class MyController {

    @Autowired
    private UserDao userDao;
    
    @Autowired
    AdminManagementService adminManagementService;
    
    @Autowired
    UserLoginService userLoginService;
    
    @RequestMapping("/index")
    public String adminIndex(HttpSession session){
    	
    	
    	return "/myInformation/myInformationIndex";
    }
    
    

    
}
