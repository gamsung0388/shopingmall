package org.spring.my.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardFile {//파일
	private String fcode;//파일코드
	private String ncode;//
	private String fname;//파일이름
	private	Date regdate;//등록일자
}
