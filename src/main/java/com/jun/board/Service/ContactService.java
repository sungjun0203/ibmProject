package com.jun.board.Service;

import com.jun.board.Dao.ContactDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.HashMap;

@Service
public class ContactService {

    @Autowired
    ContactDao contactDao;

    public int contactInsert(HttpServletRequest request, HttpSession session){
        String userEmail = (String)session.getAttribute("userEmail");
        String name = request.getParameter("name");
        String requestEmail = request.getParameter("email");
        String phone = request.getParameter("phone");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        HashMap<String,Object> contactInformation = new HashMap<String,Object>();
        contactInformation.put("userEmail",userEmail);
        contactInformation.put("name",name);
        contactInformation.put("requestEmail",requestEmail);
        contactInformation.put("phone",phone);
        contactInformation.put("subject",subject);
        contactInformation.put("message",message);

        contactDao.contactInsert(contactInformation);

        return 1;
    }
}
