package com.jun.board.Service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
@Service
public class FileService {

    public Map fileUpload(HttpServletRequest request, String path) {

        Map returnObject = new HashMap();
        try { // MultipartHttpServletRequest 생성
            MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) request;
            Iterator iter = mhsr.getFileNames();
            MultipartFile mfile = null;
            String fieldName = "";
            List resultList = new ArrayList();

            // 디레토리가 없다면 생성
            File dir = new File(path);
            if (!dir.isDirectory()) {
                dir.mkdirs();
            }
            // 값이 나올때까지
            while (iter.hasNext()) {
                fieldName = (String) iter.next();
                // 내용을 가져와서

                mfile = mhsr.getFile(fieldName);
                String origName;
                origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8");

                // 파일명이 없다면
                if ("".equals(origName)) {
                    continue;
                }

                // 파일 명 변경(uuid로 암호화)
                String ext = origName.substring(origName.lastIndexOf('.'));
                // 확장자
                String saveFileName = getUuid() + ext;
                // 설정한 path에 파일저장

                File serverFile = new File(path + File.separator + saveFileName);
                mfile.transferTo(serverFile);
                Map file = new HashMap();
                file.put("origName", origName);
                file.put("sfile", serverFile);
                resultList.add(file);

            }

            returnObject.put("files", resultList);
            returnObject.put("params", mhsr.getParameterMap());


        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalStateException e) { // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return returnObject;
    }

    public static String getUuid() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

}
