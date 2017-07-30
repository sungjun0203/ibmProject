package com.jun.meeting.Controller;

import com.jun.meeting.Dao.UserDao;
import com.jun.meeting.Service.NoticeListService;
import com.jun.meeting.Service.NoticeWriteSubmitService;
import com.jun.meeting.Service.UserSignUpService;
import com.jun.meeting.VO.BoardPager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-27.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    NoticeWriteSubmitService noticeWriteSubmitService;

    @Autowired
    NoticeListService noticeListService;

    @Autowired
    UserDao userDao;

    @RequestMapping(value = "/noticeList")
    public ModelAndView notice(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println(userEmail);

        ArrayList<HashMap<String,Object>> noticeInformation = noticeListService.noticeList();

        ModelAndView noticeListResult = new ModelAndView();
        noticeListResult.setViewName("/notice/noticeList");
        noticeListResult.addObject("noticeInformation",noticeInformation);
        return noticeListResult;
    }

    @RequestMapping("/write")
    public ModelAndView noticeWrite(HttpSession session){

        ModelAndView resultModel = new ModelAndView();
        resultModel.setViewName("/notice/noticeWrite");

        return resultModel;
    }


    @RequestMapping("/writeSubmit")
    public String noticeWriteSubmit(HttpSession session, HttpServletRequest request){

        String noticeContent = request.getParameter("noticeContent");
        noticeWriteSubmitService.noticeWriteSubmit(request,session);

        return "redirect:/notice/noticeList";
    }
}
