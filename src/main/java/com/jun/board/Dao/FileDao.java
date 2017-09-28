package com.jun.board.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface FileDao {
    void insertFileToDB(HashMap<String,Object> fileInformation);
}
