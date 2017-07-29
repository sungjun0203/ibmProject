package com.jun.meeting.Controller;

import com.jun.meeting.Dao.NoticeDao;
import com.jun.meeting.Service.NoticeListService;
import com.jun.meeting.Service.UserInformationService;
import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.Authenticator;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */
@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    NoticeDao noticeDao;

    @Autowired
    NoticeListService noticeListService;

    @Autowired
    UserInformationService userInformationService;

    @RequestMapping(value= "/main", method = RequestMethod.POST)
    public ModelAndView main(HttpSession session, HttpServletRequest request){

        String userEmail = request.getParameter("email");
        session.setAttribute("userEmail",userEmail);

        // 공지사항 정보
        ArrayList<HashMap<String,Object>> recentNoticeList = noticeListService.recentNoticceList();

        // 유저정보
        HashMap<String,Object> userInformation = userInformationService.userInformation(session);

        ModelAndView mainModelAndView = new ModelAndView();
        mainModelAndView.addObject("recentNoticeList",recentNoticeList);
        mainModelAndView.addObject("userInformation",userInformation);

        mainModelAndView.setViewName("/main/main");

        return mainModelAndView;
    }
}
