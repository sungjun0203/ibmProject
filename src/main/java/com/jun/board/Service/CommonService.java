package com.jun.board.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.BoardDao;
import com.jun.board.Dao.UserDao;

@Service
public class CommonService {

	@Autowired
	UserDao userDao;

	@Autowired
	BoardDao boardDao;

	public String userTypeCheck(HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = userDao.userTypeCheck(userEmail);
		return userType;
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	public String nowTime(){
		long dateTime = System.currentTimeMillis(); 
		SimpleDateFormat nowDate = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String stringDateTime = nowDate.format(new Date(dateTime));
		
		return stringDateTime;
	}

	public String authorityCheck(HttpServletRequest request, HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = userTypeCheck(session);
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String deleteResult = null;

		if (userType.equals("관리자")) {
			deleteResult = "admin";
		} else {
			String boardWriter = boardDao.getBoardWriter(boardNumber);
			if (userEmail.equals(boardWriter)) {
				deleteResult = "authorityOK";
			} else {
				deleteResult = "authorityFAIL";
			}
		}

		return deleteResult;
	}
}
