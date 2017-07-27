package com.jun.meeting.Controller;

import com.jun.meeting.Service.NoticeWriteSubmitService;
import com.jun.meeting.Service.UserSignUpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-27.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeWriteSubmitService noticeWriteSubmitService;

    @RequestMapping("/write")
    public ModelAndView noticeWrite(HttpSession session){
        System.out.println("Write!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

        ModelAndView resultModel = new ModelAndView();

        resultModel.setViewName("/board/noticeWrite");

        return resultModel;
    }

    @RequestMapping("/writeSubmit")
    public ModelAndView noticeWriteSubmit(HttpSession session, HttpServletRequest request){

        String noticeContent = request.getParameter("noticeContent");
        System.out.println("공지사항 작성완료");
        noticeWriteSubmitService.noticeWriteSubmit(request,session);

        ModelAndView resultModel = new ModelAndView();
        resultModel.setViewName("/board/notice");
        return resultModel;
    }
}
