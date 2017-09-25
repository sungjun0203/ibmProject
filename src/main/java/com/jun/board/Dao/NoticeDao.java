package com.jun.board.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	//공지사항 리스트 보기
	ArrayList<HashMap<String,Object>> noticeList();
	/*ArrayList<HashMap<String,Object>> recentNoticeList();*/
	
	HashMap<String, Object> noticeRead(int noticeSeq);
	


}
