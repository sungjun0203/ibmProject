package com.jun.board.Dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface BoardDao {
    void onlyTextWrite(HashMap<String,Object> boardInformation);
    void onlyTextUpdate(HashMap<String,Object> boardInformation);
    void imgTextWrite(HashMap<String,Object> boardInformation);
    void imgTextUpdate(HashMap<String,Object> boardInformation);
    
    ArrayList<HashMap<String,Object>> boardListDateASC();
    ArrayList<HashMap<String,Object>> boardListDateDESC();
    ArrayList<HashMap<String,Object>> boardListLikeASC();
    ArrayList<HashMap<String,Object>> boardListLikeDESC();
    
    HashMap<String,Object> boardRead(int boardNumber);
    void boardDelete(int boardNumber);
    
    Integer boardBeingCheck(int boardNumber);
    
    String getBoardWriter(int boardNumber);
    
    
    
    int myLikeCount(HashMap<String,Object> likeCheck);
    int allLikeCount(HashMap<String,Object> likeCheck);
    void likeCountPlus(Integer boardNumber);
    void likeCountMinus(Integer boardNumber);
    void likeInsert(HashMap<String,Object> boardLikeInformation);
    void likeDelete(HashMap<String,Object> boardLikeInformation);
    
    
    int myWriteCount(String userEmail);
    int myReplyCount(String userEmail);
    void deleteBoardReply(Integer boardNumber);
    void deleteBoardLike(Integer boardNumber);
    
    void replyInsert(HashMap<String,Object> boardReplyInformation);
    ArrayList<HashMap<String,Object>> replyRead(Integer boardNumber);
    
    ArrayList<HashMap<String,Object>> myWriteBoardAll (String userEmail);
    ArrayList<HashMap<String,Object>> myReplyAll (String userEmail);
}
