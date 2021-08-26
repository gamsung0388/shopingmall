package org.spring.my.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface AskFileService {

	//파일을 폴더에 저장하고 파일명을 리턴
	public String AskFileUpload(MultipartFile files);
	//파일들을 db에 저장
	public void insertAskFiles(int acode, List<MultipartFile> files);
	//파일 다운로드
	public void filedownload(String filename, HttpServletResponse response) throws Exception;


}
