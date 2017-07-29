package com.jun.meeting.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface NoticeDao {

    Integer noticeSubmit(HashMap<String,Object> noticeInformation);
    ArrayList<HashMap<String,Object>> noticeList();
    ArrayList<HashMap<String,Object>> recentNoticeList();

}
