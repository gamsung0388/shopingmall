package org.spring.my.service;

public interface MailSendService {
	
	//이메일 전송
	public String sendAuthMail(String email, String userid) throws Exception ;

}
