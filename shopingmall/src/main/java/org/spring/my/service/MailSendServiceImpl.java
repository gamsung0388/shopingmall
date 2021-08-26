package org.spring.my.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.spring.my.dao.GuestDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSendServiceImpl implements MailSendService{
	
	@Autowired
	private GuestDAO guestDAO;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	//인증키 생성
		private String getAuthCode() {
			StringBuffer authCode = new StringBuffer(); 
			Random random =  new Random();
			for(int i=0; i<6; i++) {
				authCode.append(random.nextInt(10));
			}
			return authCode.toString();
		}
	

	/* 이메일 전송 */
	@Override
	public String sendAuthMail(String email, String userid) throws Exception {
		//6자리 난수 인증번호 생성
		String authCode = getAuthCode();
		//보낼 메일 내용
		StringBuffer mailContent = new StringBuffer();
		mailContent.append("<h2>로고나 회원가입 이메일 인증</h2>");
		mailContent.append("인증번호 키 값 입니다.<br>");
		mailContent.append("인증번호 : " + authCode);
		System.out.println(email);
		System.out.println(mailContent.toString());
		
		//보낼메일 객체 생성
		MimeMessage mimeMsg = mailSender.createMimeMessage();
		mimeMsg.setSubject("로고나 회원가입 이메일 인증", "utf-8");
		mimeMsg.setText(mailContent.toString(), "utf-8", "html");
		mimeMsg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
		//메일 보내기
		mailSender.send(mimeMsg);
		
		return authCode;
	}

	
}
