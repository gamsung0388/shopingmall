package org.spring.my.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

//git 테스트
@Data
public class Ask {
	private int acode;
	private String userid;
	private String passwd;
	private String subject;
	private String content;
	private String gubun;
	private int readcnt;
	private String ip;
	private Date regdate;
	private Date modifydate;
	
	private List<MultipartFile> files; //파일들
}