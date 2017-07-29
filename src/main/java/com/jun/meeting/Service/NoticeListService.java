package com.jun.meeting.Service;

import com.jun.meeting.Dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Jun on 2017-07-28.
 */
@Service
public class NoticeListService {
    @Autowired
    NoticeDao noticeDao;

    public ArrayList<HashMap<String,Object>> noticeList(){

        ArrayList<HashMap<String,Object>> noticeList = noticeDao.noticeList();
        return noticeList;
    }

    public ArrayList<HashMap<String,Object>> recentNoticceList(){

        ArrayList<HashMap<String,Object>> recentNoticeList = noticeDao.recentNoticeList();
        return recentNoticeList;
    }
}
