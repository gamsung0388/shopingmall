package org.spring.my.dto;

import lombok.Data;

@Data
public class Page {
	private int curPage = 1; //현재 페이지
	private int perPage = 10; //한 페이지 당 게시물 수
	private int perBlock = 10; //한 화면의 페이지 수
	
	private int totPage; //전체 페이지 수
	private int startNum; //시작번호
	private int endNum; //끝번호
	private int startPage; //시작 페이지
	private int endPage; //끝 페이지
	
	private String findkey; //검색키
	private String findvalue; //검색값
}
