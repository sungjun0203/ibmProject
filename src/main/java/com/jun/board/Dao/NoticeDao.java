package com.jun.board.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	ArrayList<HashMap<String,Object>> noticeList();
	/*ArrayList<HashMap<String,Object>> recentNoticeList();*/
}
