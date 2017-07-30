package com.jun.meeting.Service;

import com.jun.meeting.Dao.FileDao;
import com.jun.meeting.Dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */

@Service
public class UserSignUpService {

    @Autowired
    private UserDao userDao;

    @Autowired
    FileService fileService;

    @Autowired
    FileDao fileDao;

    private static String CODE_USERTYPE_01 = "일반사용자";
    private static String CODE_USERTYPE_02 = "관리자";

    public void userSignUpSuccess(HttpServletRequest request) {

//-----------------------------------------------------------------------------------------------------------------------------

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
        String nickName = request.getParameter("inputNickName");

        HashMap<String, Object> userInformation = new HashMap<String, Object>();

        userInformation.put("email", email);
        userInformation.put("password", password);
        userInformation.put("name", name);
        userInformation.put("birth", birth);
        userInformation.put("gender", gender);
        userInformation.put("college", college);
        userInformation.put("major", major);
        userInformation.put("phone", phone);
        userInformation.put("signUpDate", stringDateTime);
        userInformation.put("userType", CODE_USERTYPE_01);
        userInformation.put("nickName", nickName);

        System.out.println(userInformation);
        userDao.userSignUp(userInformation);


        String path = "c://aaa";

        Map fileInfo = null;
        HashMap<String, Object> fileInformation = new HashMap<String, Object>();

        try {

            fileInfo = fileService.fileUpload(request, path); //해당 디렉토리 위치에 파일 업로드
            List files = (List) fileInfo.get("files");

            if (files.size() > 0) {

                fileInformation.put("file_gbn", "BD");

                for (int i = 0; i < files.size(); i++) {
                    Map file = (Map) files.get(i);

                    String origName = (String) file.get("origName");
                    File sFile = (File) file.get("sfile");

                    fileInformation.put("file_name", sFile.getName()); //복호화된 파일 이름
                    fileInformation.put("file_path", sFile.getAbsolutePath()); //물리적 저장 경로
                    fileInformation.put("file_size", sFile.length()); //파일 크기
                    fileInformation.put("file_orig", origName); //원래 파일 명
                    fileInformation.put("userEmail",email);
                    fileDao.insertFileToDB(fileInformation);
                }
            }

        } catch (IllegalStateException e) {
            e.printStackTrace();
        }
    }


}
