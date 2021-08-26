package org.spring.my.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface ProductFileService {
	//파일을 폴더에 저장하고 파일명을 리턴 
	public String fileUpload(MultipartFile file) throws Exception;
	//파일들을 db에 저장
	public void insertBoardFiles(String pcode, List<MultipartFile> files) throws Exception;
		
}
