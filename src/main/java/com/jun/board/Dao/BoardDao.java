package com.jun.board.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface BoardDao {
    void onlyTextWrite(HashMap<String,Object> boardInformation);
    void imgTextWrite(HashMap<String,Object> boardInformation);
    ArrayList<HashMap<String,Object>> boardList();
    HashMap<String,Object> boardRead(int boardSeq);
    void boardDelete(int boardNumber);
    
    String getBoardWriter(int boardNumber);
}
