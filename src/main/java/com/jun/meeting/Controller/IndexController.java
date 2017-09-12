package com.jun.meeting.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.meeting.Service.NoticeListService;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-24.
 */

@Controller
public class IndexController {
	
	@Autowired
    NoticeListService noticeListService;

    @RequestMapping("/")
    public String test(){
    	
    	System.out.println("aaaa");
    	System.out.println(noticeListService.test());
        return "index";
    }
}
