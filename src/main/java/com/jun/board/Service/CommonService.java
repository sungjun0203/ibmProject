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

	// 유저의 타입 체크 (관리자,일반사용자)
	public String userTypeCheck(HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = userDao.userTypeCheck(userEmail);
		return userType;
	}

	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	// 현재시간 구하는 함수
	public String nowTime(){
		long dateTime = System.currentTimeMillis(); 
		SimpleDateFormat nowDate = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String stringDateTime = nowDate.format(new Date(dateTime));
		
		return stringDateTime;
	}

	// 게시글에 의한 사용자 권한 체크 (일반사용자의 게시글 수정 또는 관리자 수정 등등의 경우)
	public String authorityCheck(HttpServletRequest request, HttpSession session) {

		String userEmail = (String) session.getAttribute("userEmail");
		String userType = userTypeCheck(session);
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String deleteResult = null;
		
		if(boardDao.boardBeingCheck(boardNumber)==0){
			deleteResult ="notBeing";
		}
		else if (userType.equals("관리자")) {
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
