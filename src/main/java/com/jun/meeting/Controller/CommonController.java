package com.jun.meeting.Controller;

import com.jun.meeting.Service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by Jun on 2017-07-29.
 */
@Controller
@RequestMapping("/common")
public class CommonController {

    @Autowired
    CommonService commonService;

    @RequestMapping("/userTypeCheck")
    @ResponseBody
    public String userTypeCheck(HttpSession session){
        String userType = commonService.userTypeCheck(session);

        return userType;
    }

}
