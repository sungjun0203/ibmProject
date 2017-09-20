package com.jun.board.Service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.NoticeDao;

@Service
public class NoticeListService {
    @Autowired
    NoticeDao noticeDao;

    public ArrayList<HashMap<String,Object>> noticeList(){

    	System.out.println("serviceCheck");
        ArrayList<HashMap<String,Object>> noticeList = noticeDao.noticeList();
        return noticeList;        
    
    }

   /* public ArrayList<HashMap<String,Object>> recentNoticceList(){

        ArrayList<HashMap<String,Object>> recentNoticeList = noticeDao.recentNoticeList();
        return recentNoticeList;
    }*/
    
}