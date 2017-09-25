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
    

    public ArrayList<HashMap<String,Object>> noticeList(){

        ArrayList<HashMap<String,Object>> noticeList = noticeDao.noticeList();
        return noticeList;        
    
    }

   /* public ArrayList<HashMap<String,Object>> recentNoticceList(){

        ArrayList<HashMap<String,Object>> recentNoticeList = noticeDao.recentNoticeList();
        return recentNoticeList;
    }*/
    
    public HashMap<String, Object> noticeRead (HttpServletRequest request, HttpSession session){
    	Integer noticeNumber = Integer.parseInt(request.getParameter("noticeNumber"));
    	HashMap<String,Object> noticeRead = noticeDao.noticeRead(noticeNumber);
    	noticeRead.put("sessionId", session.getAttribute("userEmail"));
    	
    	
    	return noticeRead;
    	
    }
    
}