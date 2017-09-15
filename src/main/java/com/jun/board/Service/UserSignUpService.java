package com.jun.board.Service;

import com.jun.board.Dao.FileDao;
import com.jun.board.Dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by IONCOMMUNICATIONS on 2017-07-25.
 */

@Service
public class UserSignUpService {

	@Autowired
	private UserDao userDao;

	@Autowired
	FileService fileService;

	@Autowired
	FileDao fileDao;

	@Autowired
	public JavaMailSender emailSender;

	private static String CODE_USERTYPE_01 = "일반사용자";
	private static String CODE_USERTYPE_02 = "관리자";
	private static Integer DUPLICATE = 1;
	private static Integer NOTDUPLICATE = 0;

	public HashMap<String, Object> emailCheck(HttpServletRequest request) {

		HashMap<String, Object> resultData = new HashMap<String, Object>();
		String resultString = null;
		String email = null;
		int randomNum = 0;
		email = request.getParameter("email");
		
		System.out.println(email);
		System.out.println(userDao.userEmailDuplicateCheck(email));


		if (userDao.userEmailDuplicateCheck(email) > 0) {
			resultString = "duplicate";
		} else {

			Random rand = new Random();
			int min = 10000;
			int max = 100000;
			randomNum = rand.nextInt(max - min + 1) + min;

			String subject = "IBM Board 이메일 인증";
			String text = "IBM Board 이메일 인증번호 : '" + randomNum + "' 를입력해주세요";

			SimpleMailMessage message = new SimpleMailMessage();

			message.setTo(email);
			message.setSubject(subject);
			message.setText(text);
			emailSender.send(message);

			resultString = "sendOK";
		}
		resultData.put("resultString", resultString);
		resultData.put("randomNum", randomNum);
		return resultData;
	}

	public void userSignUpSuccess(HttpServletRequest request) {

		// -----------------------------------------------------------------------------------------------------------------------------

		long dateTime = System.currentTimeMillis(); // 또는 System.nanoTime();
		SimpleDateFormat date = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");

		String email = request.getParameter("inputEmail");
		String password = request.getParameter("inputPassword"); // null
		String name = request.getParameter("inputName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("inputNumber");

		HashMap<String, Object> userInformation = new HashMap<String, Object>();

		userInformation.put("USER_EMAIL", email);
		userInformation.put("USER_PASSWORD", password);
		userInformation.put("USER_NAME", name);
		userInformation.put("USER_GENDER", gender);
		userInformation.put("USER_PHONE", phone);
		userInformation.put("USER_AUTHORITY", CODE_USERTYPE_01);

		System.out.println(userInformation);
		userDao.userSignUp(userInformation);

	}
}
