package com.jun.meeting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jun.meeting.Service.NoticeListService;

@SpringBootApplication
public class MeetingApplication {
	
	@Autowired
    NoticeListService noticeListService;
	

	public static void main(String[] args) {
		System.out.println("Hello");
		
		SpringApplication.run(MeetingApplication.class, args);
	}


}
