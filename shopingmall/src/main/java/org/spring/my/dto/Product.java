package org.spring.my.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {//상품
	private String pcode;//상품코드
	private String pname;//상품명
	private String pmaker;//제조사
	private int price;//가격
	private String pcolor;//색상
	private String psize;//사이즈
	private String bcode;//대분류코드
	private String lcode;//소분류코드
	private Date regdate;//등록일자
	private Date modifydate;//수정일자
	private List<MultipartFile> files;//파일
}
