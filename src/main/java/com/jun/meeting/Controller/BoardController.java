package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Jun on 2017-07-27.
 */
@Controller
@RequestMapping("/board")
public class BoardController {

    @RequestMapping(value = "/notice")
    public ModelAndView notice(HttpServletRequest request, HttpSession session){
        String userEmail = (String) session.getAttribute("userEmail");
        System.out.println(userEmail);

        ModelAndView a = new ModelAndView();
        a.setViewName("/board/notice");
        return a;
    }

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
