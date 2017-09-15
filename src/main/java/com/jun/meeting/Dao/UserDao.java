package com.jun.meeting.Dao;
import org.apache.ibatis.annotations.Mapper;
import java.util.HashMap;
import java.util.Map;

@Mapper
public interface UserDao {

    Integer userSignUp(HashMap<String,Object> userInformation);
    Integer userLogin(HashMap<String,Object> loginInformation);
    String userTypeCheck(String userEmail);
    HashMap<String,Object> userInformation(String userEmail);
    Integer userEmailDuplicateCheck(String userEmail);
    Integer userNicknameDuplicateCheck(String userNickname);
    String userAdminCheck(String userEmail);

}
