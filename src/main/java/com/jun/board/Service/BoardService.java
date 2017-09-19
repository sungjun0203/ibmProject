package com.jun.board.Service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jun.board.Dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	FileService fileService;
	
	@Autowired
	BoardDao boardDao;
	
	@Autowired
	CommonService commonService;
	
	public ArrayList<HashMap<String,Object>> boardList(){
		ArrayList<HashMap<String,Object>> boardList = boardDao.boardList();
		
		return boardList;
	}
	
	public HashMap<String,Object> boardRead(HttpServletRequest request, HttpSession session){
		
		Integer boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		HashMap<String,Object> boardRead = boardDao.boardRead(boardSeq);
		
		System.out.println(boardRead);
		return boardRead;
	}
	
	public String boardDelete(HttpServletRequest request, HttpSession session){
		
		String userEmail = (String)session.getAttribute("userEmail");
		String userType = commonService.userTypeCheck(session);
		Integer boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
		String deleteResult = null;
		
		if(userType.equals("관리자")){
			boardDao.boardDelete(boardNumber);
			deleteResult = "admin";
		}
		else{
			String boardWriter = boardDao.getBoardWriter(boardNumber);
			if(userEmail.equals(boardWriter)){
				boardDao.boardDelete(boardNumber);
				deleteResult = "userDeleteSuccess";
			}
			else{
				deleteResult = "userDeleteFail";
			}
		}
		
		return deleteResult;
	}

	public void boardWriteSubmit(HttpServletRequest request, HttpSession session) {
		
		HashMap<String,Object> boardInformation = new HashMap<String,Object>();
		
		String userEmail = (String) session.getAttribute("userEmail");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		long dateTime = System.currentTimeMillis(); 
		SimpleDateFormat nowDate = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String stringDateTime = nowDate.format(new Date(dateTime));
		
		boardInformation.put("userEmail", userEmail);
		boardInformation.put("boardTitle", boardTitle);
		boardInformation.put("boardContent",boardContent);
		boardInformation.put("boardDate",stringDateTime);

		String path = "c://webProject//ibmProject//src//main//resources//boardImage";

		Map fileInfo = null;
		fileInfo = fileService.fileUpload(request, path); // 해당 디렉토리 위치에 파일 업로드
		List files = (List) fileInfo.get("files");

		if (files.size() > 0) {

			HashMap<String, Object> fileInformation = new HashMap<String, Object>();

			fileInformation.put("file_gbn", "BD");

			for (int i = 0; i < files.size(); i++) {
				Map file = (Map) files.get(i);

				String origName = (String) file.get("origName");
				File sFile = (File) file.get("sfile");

				boardInformation.put("boardFileName", sFile.getName()); // 복호화된 파일 이름
				boardInformation.put("boardFilePath", sFile.getAbsolutePath()); // 물리적
				boardInformation.put("boardFileSize", sFile.length()); // 파일 크기
				boardInformation.put("boardFileOrig", request.getParameter("imgSrc")); // 원래 파일 명
				boardDao.imgTextWrite(boardInformation);
			}
		}
		
		else{
			boardDao.onlyTextWrite(boardInformation);
		}
	}

}
