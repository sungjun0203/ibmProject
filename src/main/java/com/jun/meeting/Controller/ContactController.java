package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Jun on 2017-07-29.
 */
@Controller
@RequestMapping("/contact")
public class ContactController {

    @RequestMapping("/")
    public String contactView(){

        return "/etc/contact";
    }
}
