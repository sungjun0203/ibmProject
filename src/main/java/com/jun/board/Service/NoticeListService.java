package com.jun.board.Service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.NoticeDao;

@Service
public class NoticeListService {
    @Autowired
    NoticeDao noticeDao;
    
    @Autowired
    CommonService commonService;

    public ArrayList<HashMap<String,Object>> noticeList(){

        ArrayList<HashMap<String,Object>> noticeList = noticeDao.noticeList();
        return noticeList;        
    
    }
    
    
    public HashMap<String, Object> noticeRead (HttpServletRequest request, HttpSession session){
    	Integer noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
    	System.out.println(noticeNumber);
    	HashMap<String,Object> noticeRead = noticeDao.noticeRead(noticeNumber);
    	

    	return noticeRead;
    	
    }
    
    public void noticeUpdateSubmit(HttpServletRequest request, HttpSession session){
    	HashMap<String, Object> noticeInformation = new HashMap<String, Object>();
    	
    	String stringDateTime = commonService.nowTime();
    	
    	String userEmail = (String) session.getAttribute("userEmail");
    	String noticeTitle = request.getParameter("noticeTitle");
    	String noticeContent = request.getParameter("noticeContent");
    	Integer noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
    	Integer noticeViewAmt = Integer.parseInt(request.getParameter("noticeViewAmt"));
    	
    	
    	noticeInformation.put("userEmail", userEmail);
    	noticeInformation.put("notictTitle", noticeTitle);
    	noticeInformation.put("noticeContent", noticeContent);
    	noticeInformation.put("noticeDate", stringDateTime);
    	noticeInformation.put("noticeViewAmt", noticeViewAmt);
    	
    	noticeDao.onlyTextWrite(noticeInformation);
    	
    }
    public void writeSubmit(HttpServletRequest request, HttpSession session){
    	HashMap<String, Object> noticeInformation = new HashMap<String, Object>();
    	
    	
    	String noticeTitle = request.getParameter("noticeTitle");
    	String userEmail = (String) session.getAttribute("userEmail");
    	String noticeContent = request.getParameter("noticeContent");
    	String stringDateTime = commonService.nowTime();
    	
    	noticeInformation.put("notictTitle", noticeTitle);
    	noticeInformation.put("noticeContent", noticeContent);
    	noticeInformation.put("userEmail", userEmail);
    	noticeInformation.put("noticeDate", stringDateTime);
    	
    	
    	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+noticeInformation);
    	
    	noticeDao.onlyTextWrite(noticeInformation);
    	
    }
    
}