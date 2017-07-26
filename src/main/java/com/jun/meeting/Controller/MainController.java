package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.net.Authenticator;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */
@Controller
@RequestMapping("/main")
public class MainController {

    @RequestMapping("/main")
    public String main(){
        return "/main/main";
    }
}
