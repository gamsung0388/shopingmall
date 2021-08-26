package org.spring.my.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;


import org.spring.my.dao.ProductFileDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ProductFileServiceImpl implements ProductFileService{

	@Autowired
	private ProductFileDAO productFileDAO;
	
	
	//root-context.xml에 bean생성하고 자동주입
	@Autowired
	private String uploadDir;
	
	
	@Override
	public String fileUpload(MultipartFile file) throws Exception{
		//실제파일이름
				String originfilename = file.getOriginalFilename();
				if (originfilename =="") return ""; //파일없다면 return
				
				//파일이름을 겹치지 않도록 파일이름생성
				String filename = System.currentTimeMillis()+originfilename;
				File f = new File(uploadDir, filename);
				try {
					file.transferTo(f); ; //파일 폴더에 저장
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return filename;
	}

	@Override
	public void insertBoardFiles(String pcode, List<MultipartFile> files) throws Exception{
		//매퍼에게 전달할 맵
				Map<String,Object> filesMap = new HashMap<>();
				filesMap.put("pcode", pcode);
				
				//파일명 리스트만들기
				List<String> filenamelist = new ArrayList<>();

				if (files == null) return ; 
				for(MultipartFile mf:files) {
					//파일업로드
					String filename = fileUpload(mf);
					if (!filename.equals("")) filenamelist.add(filename);
				}
				if (filenamelist.size() == 0) return ;
				filesMap.put("filenamelist", filenamelist);
				
				productFileDAO.insertBoardFiles(filesMap);

		
	}


}
