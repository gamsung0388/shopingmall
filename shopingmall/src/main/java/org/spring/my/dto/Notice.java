package org.spring.my.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Notice {
	private int ncode;
	private String userid;
	private String subject;
	private String content;
	private int readcnt;
	private String ip;
	private Date regdate;
	private Date modifydate;
	
	private List<MultipartFile> files; //파일들
}