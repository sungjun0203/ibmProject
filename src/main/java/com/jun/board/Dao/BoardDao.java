package com.jun.board.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface BoardDao {
    void onlyTextWrite(HashMap<String,Object> boardInformation);
    void imgTextWrite(HashMap<String,Object> boardInformation);
    void onlyTextUpdate(HashMap<String,Object> boardInformation);
    void imgTextUpdate(HashMap<String,Object> boardInformation);
    
    ArrayList<HashMap<String,Object>> boardList();
    HashMap<String,Object> boardRead(int boardNumber);
    void boardDelete(int boardNumber);
    
    String getBoardWriter(int boardNumber);
    
    void replyInsert(HashMap<String,Object> boardReplyInformation);
    void likeInsert(HashMap<String,Object> boardLikeInformation);
    void likeDelete(HashMap<String,Object> boardLikeInformation);
    ArrayList<HashMap<String,Object>> replyRead(Integer boardNumber);
    int myLikeCount(HashMap<String,Object> likeCheck);
    int allLikeCount(HashMap<String,Object> likeCheck);
}
