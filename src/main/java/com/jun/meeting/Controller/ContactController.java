package com.jun.meeting.Controller;

import com.jun.meeting.Service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Jun on 2017-07-29.
 */
@Controller
@RequestMapping("/contact")
public class ContactController {

    @Autowired
    ContactService contactService;

    @RequestMapping("/")
    public String contactView(){
        return "/etc/contact";
    }

    @RequestMapping("/contactSendOK")
    public String contactInsert(HttpServletRequest request, HttpSession session){
        contactService.contactInsert(request,session);
        return "/etc/contact";
    }


}
