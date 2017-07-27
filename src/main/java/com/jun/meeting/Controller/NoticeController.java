package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-27.
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

    @RequestMapping("/write")
    public ModelAndView noticeWrite(HttpSession session){
        System.out.println("Write!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

        ModelAndView resultModel = new ModelAndView();

        resultModel.setViewName("/board/noticeWrite");

        return resultModel;


    }
}
