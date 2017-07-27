package com.jun.meeting.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface NoticeDao {

    Integer noticeSubmit(HashMap<String,Object> noticeInformation);


}
