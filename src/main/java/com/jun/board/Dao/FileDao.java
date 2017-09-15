package com.jun.board.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

/**
 * Created by Jun on 2017-07-30.
 */
@Mapper
public interface FileDao {
    void insertFileToDB(HashMap<String,Object> fileInformation);
}
