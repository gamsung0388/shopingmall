package org.spring.my.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ProductFile {//상품 파일
	private String fcode;//파일코드
	private String pcode;//상품코드
	private String fname;//파일이름
	private Date regdate;//등록일자
}
