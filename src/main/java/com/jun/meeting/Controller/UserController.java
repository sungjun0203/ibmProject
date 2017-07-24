package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/signUp")
    public String signUp(){
        return "/user/signUp";
    }


}
