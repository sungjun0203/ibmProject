package com.jun.board.Service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.BoardDao;
import com.jun.board.Dao.UserDao;

@Service
public class MyService {

	@Autowired
	UserDao userDao;

	@Autowired
	BoardDao boardDao;
	
	// 내가 쓴 글 정보 출력
	public ArrayList<HashMap<String,Object>> myWrite(HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		return boardDao.myWriteBoardAll(userEmail);
	}
	
	// 내가 쓴 댓글 정보 출력
	public ArrayList<HashMap<String,Object>> myReply(HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		return boardDao.myReplyAll(userEmail);
	}
	
	

	

	
}
