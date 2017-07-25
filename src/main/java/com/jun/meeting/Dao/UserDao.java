package com.jun.meeting.Dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserDao {

    Integer getCurrentDateTime();
    Integer userSignUp();


}
