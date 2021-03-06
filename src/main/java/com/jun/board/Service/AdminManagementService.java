package com.jun.board.Service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.UserDao;

@Service
public class AdminManagementService {
	
	@Autowired
	UserDao userDao;
	
	// 관리자 확인
	public String adminCheck(HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		String userAuthority = userDao.userAdminCheck(userEmail);
		
		if(userAuthority.equals("일반사용자")){
			return "/admin/admin_fail";
		}
		
		//관리자일경우
		else{ 
			return "/admin/admin_login";
		}
	}
	
	// 관리자 재 로그인
	public String reLogin(HttpSession session, HttpServletRequest request){
		
		String email = (String)session.getAttribute("userEmail");
		String password = request.getParameter("adminPassword");
		
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
