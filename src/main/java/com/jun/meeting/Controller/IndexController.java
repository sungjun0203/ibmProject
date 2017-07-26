package com.jun.meeting.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping("/")
    public String test(){
        return "test";
    }
}
