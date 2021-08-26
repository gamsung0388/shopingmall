package org.spring.my.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;


//git 테스트
@Data
public class Answer {
	private int asnum;
	private int acode;
	private String userid;
	private String subject;
	private String content;
	private int restep;
	private int relevel;
	private String ip;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date regdate;
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date modifydate;
	
}