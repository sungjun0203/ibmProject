package com.jun.board.Service;

import java.io.File;
import java.text.SimpleDateFormat;
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

	public String boardWrite(HttpServletRequest request, HttpSession session) {
		
		HashMap<String,Object> boardInformation = new HashMap<String,Object>();
		
		String userEmail = (String) session.getAttribute("userEmail");
		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("boardContent");
		
		long dateTime = System.currentTimeMillis(); 
		SimpleDateFormat nowDate = new SimpleDateFormat("yyyy:MM:dd-hh:mm:ss");
		
		boardInformation.put("userEmail", userEmail);
		boardInformation.put("boardTitle", boardTitle);
		boardInformation.put("boardContent",boardContent);
		boardInformation.put("boardDate",nowDate);

		String path = "c://ibmProject//imgFile";

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

				boardInformation.put("file_name", sFile.getName()); // 복호화된 파일 이름
				boardInformation.put("file_path", sFile.getAbsolutePath()); // 물리적
				boardInformation.put("file_size", sFile.length()); // 파일 크기
				boardInformation.put("file_orig", origName); // 원래 파일 명
				boardDao.imgTextWrite(boardInformation);
			}
		}
		
		else{
			boardDao.onlyTextWrite(boardInformation);
			
		}

		return "/board/boardWrite";
	}

}
