package com.jun.meeting.Controller;

import org.apache.catalina.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.Authenticator;
import java.util.HashMap;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */
@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping(value= "/main", method = RequestMethod.POST)
    public ModelAndView main(HttpSession session, HttpServletRequest request){

        String userEmail = request.getParameter("email");
        session.setAttribute("userEmail",userEmail);

        ModelAndView mainModelAndView = new ModelAndView();
        mainModelAndView.addObject("userEmail");

        mainModelAndView.setViewName("/main/main");

        return mainModelAndView;
    }
}
