package org.spring.my.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dao.AskFileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AskFileServiceImpl implements AskFileService{
	private static final Logger logger = LoggerFactory.getLogger(AskFileServiceImpl.class);

	@Autowired
	private String uploadDir2;
	
	@Autowired
	private AskFileDAO askFileDAO;
	
	//파일을 폴더에 저장하고 리턴
	@Override
	public String AskFileUpload(MultipartFile files) {
		//실제파일명
		String originfilename = files.getOriginalFilename();
		logger.info(originfilename);
		
		//파일이 없다면 공백을 return
		if (originfilename == "") return "";
		
		//파일 이름이 겹치지 않도록 파일이름 생성
		String filename = System.currentTimeMillis() + originfilename;
		File f = new File(uploadDir2, filename);
		
		try {
			//파일 폴더에 저장(파일을 올려주는 메소드)
			files.transferTo(f);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return filename;
	}
	
	//파일을 폴더에 저장하고 파일명을 리턴
	@Override
	public void insertAskFiles(int acode, List<MultipartFile> files) {
		//매퍼에게 전달할 맵
		Map<String, Object> filesMap = new HashMap<>();
		
		//Map에 acode 셋팅
		filesMap.put("acode", acode);
		
		//db에 저장하기 위해서 파일명 리스트 만들기
		List<String> filenamelist = new ArrayList<>();
		
		//만약에 파일 자체가 없다면
		if(files == null) return ;
		//for each방식
		for(MultipartFile mf : files) {
			//파일을 폴더에 업로드
			String filename = AskFileUpload(mf);
			//만약에 파일명이 공백이랑 같지 않다면 파일명 리스트에 추가
			if(!filename.equals("")) filenamelist.add(filename);
		}
		//만약에 파일에 사진을 첨부하지 않았다면
		if(filenamelist.size() == 0) return;
		filesMap.put("filenamelist", filenamelist);
		
		logger.info(filesMap.toString());
		
		askFileDAO.insertAskFiles(filesMap);
	
		
	}

	//파일 다운로드
	@Override
	public void filedownload(String filename, HttpServletResponse response) throws Exception{
		// 다운로드 폴더
		String fileurl = uploadDir2 + "/" + filename;
		//파일 읽기, 스트림 생성
		FileInputStream fis = new FileInputStream(fileurl);
		//파일 이름 인코딩
		filename = URLEncoder.encode(filename, "UTF-8");
		//응답객체에 헤더설정 변경
		response.setHeader("Content-Disposition", "attachment;filename=" + filename);
		//파일 보내기 스트림 생성
		OutputStream os = response.getOutputStream();
		//유틸리티 사용 : fis 읽어서 os로 내보냄 
		FileCopyUtils.copy(fis, os);
	}
}
