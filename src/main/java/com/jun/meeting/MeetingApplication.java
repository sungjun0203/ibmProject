package com.jun.meeting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class MeetingApplication {

	public static void main(String[] args) {
		System.out.println("Hello");
		SpringApplication.run(MeetingApplication.class, args);
	}


}
