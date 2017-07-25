package com.jun.meeting.Service;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */

@Service
public class UserSignUpService {

    @Autowired
    private UserDao userDao;

    public void userSignUpSuccess(HttpServletRequest request) {

        String email = request.getParameter("inputEmail");
        String password = request.getParameter("inputPassword"); // null
        String name = request.getParameter("inputName");
        String birth = request.getParameter("inputBirthDay");
        String gender = request.getParameter("gender");
        String college = request.getParameter("inputCollege");
        String major = request.getParameter("inputMajor"); // 수정
        String phone = request.getParameter("inputNumber");

        System.out.println(email + password + name + birth + gender + college + gender + major + phone);

        long time = System.currentTimeMillis();
        SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
        String str = dayTime.format(new Date(time));
        System.out.println(str);



        //userDao.userSignUp();
    }
}
