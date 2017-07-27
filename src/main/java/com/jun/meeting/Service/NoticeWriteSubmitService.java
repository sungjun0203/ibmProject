package com.jun.meeting.Service;

import com.jun.meeting.Dao.NoticeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-27.
 */
@Service
public class NoticeWriteSubmitService {
    @Autowired
    NoticeDao noticeDao;

    public int noticeWriteSubmit(HttpServletRequest request, HttpSession session){

        String userEmail = (String)session.getAttribute("userEmail");


        long dateTime = System.currentTimeMillis();  // 또는 System.nanoTime();
        SimpleDateFormat date = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
        String stringDateTime = date.format(new Date(dateTime));

        String noticeTitle = request.getParameter("noticeTitle");
        String noticeContent = request.getParameter("noticeContent");
        String noticeWriter = userEmail;

        return 1;

    }
}
