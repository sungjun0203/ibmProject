package com.jun.board.Dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDao {
	
	
	void onlyTextWrite(HashMap<String,Object> noticeInformation);
	void onlyTextUpdate(HashMap<String, Object> noticeInformation);
	//공지사항 리스트 보기
	ArrayList<HashMap<String,Object>> noticeList();
	
	HashMap<String, Object> noticeRead(int noticeSeq);
	


}
