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
	
	public ArrayList<HashMap<String,Object>> myWrite(HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		return boardDao.myWriteBoardAll(userEmail);
	}
	
	public ArrayList<HashMap<String,Object>> myReply(HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		return boardDao.myReplyAll(userEmail);
	}
	
	

	

	
}
