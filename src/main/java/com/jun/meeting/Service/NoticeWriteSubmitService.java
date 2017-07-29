package com.jun.meeting.Service;

import com.jun.meeting.Dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-27.
 */
@Service
public class NoticeWriteSubmitService {
    @Autowired
    NoticeDao noticeDao;

    public int noticeWriteSubmit(HttpServletRequest request, HttpSession session){

        String userEmail = (String)session.getAttribute("userEmail");


        Calendar calendar = Calendar.getInstance();
        java.util.Date date =  calendar.getTime();
        String stringDateTime = (new SimpleDateFormat("yyyyMMddHHmmss").format(date));
        String noticeTitle = request.getParameter("noticeTitle");
        String noticeContent = request.getParameter("noticeContent");
        String noticeWriter = userEmail;

        HashMap<String,Object> noticeInformation = new HashMap<String,Object>();
        noticeInformation.put("noticeDateTime",stringDateTime);
        noticeInformation.put("noticeTitle",noticeTitle);
        noticeInformation.put("noticeContent",noticeContent);
        noticeInformation.put("noticeWriter",noticeWriter);

        System.out.println("날짜 " + stringDateTime);

        noticeDao.noticeSubmit(noticeInformation);
        return 1;

    }
}
