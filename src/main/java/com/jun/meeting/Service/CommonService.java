package com.jun.meeting.Service;

import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Created by Jun on 2017-07-29.
 */
@Service
public class CommonService {

    @Autowired
    UserDao userDao;

    public String userTypeCheck(HttpSession session) {

        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println("a~~~~~~~~~~" + userEmail);
        String userType = userDao.userTypeCheck(userEmail);

        System.out.println(userType);
        return userType;
    }
}
