package com.jun.meeting.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface ContactDao {
    int contactInsert(HashMap<String,Object> contractInformation);
}
