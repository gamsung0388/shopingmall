package org.spring.my.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeFile {
	private int fcode;
	private int ncode;
	private String fname;
	private Date regdate;
}
