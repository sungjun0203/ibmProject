package com.jun.board.Dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ContactDao {
    int contactInsert(HashMap<String,Object> contractInformation);
}
