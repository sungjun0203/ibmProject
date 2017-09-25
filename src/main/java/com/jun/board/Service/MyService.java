package com.jun.board.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.BoardDao;
import com.jun.board.Dao.UserDao;

/**
 * Created by Jun on 2017-07-29.
 */
@Service
public class MyService {

	@Autowired
	UserDao userDao;

	@Autowired
	BoardDao boardDao;
	

	
	

	

	
}
