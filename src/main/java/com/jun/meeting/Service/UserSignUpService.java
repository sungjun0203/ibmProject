package com.jun.meeting.Service;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */

@Service
public class UserSignUpService {

    @Autowired
    private UserDao userDao;

    private static String CODE_USERTYPE_01 = "일반사용자";
    private static String CODE_USERTYPE_02 = "관리자";

    public void userSignUpSuccess(HttpServletRequest request) {


        long dateTime = System.currentTimeMillis();  // 또는 System.nanoTime();
        SimpleDateFormat date = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
        String stringDateTime = date.format(new Date(dateTime));

        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword"); // null
        String name = request.getParameter("inputName");
        String birth = request.getParameter("inputBirthDay");
        String gender = request.getParameter("gender");
        String college = request.getParameter("inputCollege");
        String major = request.getParameter("inputMajor"); // 수정
        String phone = request.getParameter("inputNumber");

        HashMap<String,Object> userInformation = new HashMap<String,Object>();

        userInformation.put("email",email);
        userInformation.put("password",password);
        userInformation.put("name",name);
        userInformation.put("birth",birth);
        userInformation.put("gender",gender);
        userInformation.put("college",college);
        userInformation.put("major",major);
        userInformation.put("phone",phone);
        userInformation.put("signUpDate",stringDateTime);
        userInformation.put("userType",CODE_USERTYPE_01);

        userDao.userSignUp(userInformation);

    }
}
