package org.spring.my.dto;

import java.util.Date;
import lombok.Data;

@Data
public class AskFile {
	private int fcode;
	private int acode;
	private String fname;
	private Date regdate;
}
