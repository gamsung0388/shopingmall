package org.spring.my.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Sell {//판매
	private int scode;//주문코드
	private String userid;//아이디
	private String orderer;//주문자
	private String receiver;//받는사람
	private String phone; //전화번호
	private String email;//이메일
	private String zip;//우편번호
	private	String addr1;//도로명주소
	private String addr2;//상세주소
	private Date regdate;//판매날짜
}
