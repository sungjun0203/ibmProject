package com.jun.meeting.Controller;

import com.jun.meeting.Service.NoticeListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Jun on 2017-07-27.
 */
@Controller
@RequestMapping("/board")
public class BoardController {



    @RequestMapping(value = "/dating")
    public ModelAndView dating(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");

        ModelAndView a = new ModelAndView();
        a.setViewName("/board/dating");
        return a;
    }

    @RequestMapping(value = "/meeting")
    public ModelAndView meeting(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");

        ModelAndView a = new ModelAndView();
        a.setViewName("/board/meeting");
        return a;
    }
}
