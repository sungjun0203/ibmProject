package com.jun.meeting.Dao;
import org.apache.ibatis.annotations.Mapper;
import java.util.HashMap;
import java.util.Map;

@Mapper
public interface UserDao {

    Integer getCurrentDateTime();
    Integer userSignUp(HashMap<String,Object> userInformation);
    Integer userLogin(HashMap<String,Object> loginInformation);


}
