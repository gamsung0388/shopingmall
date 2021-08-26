package org.spring.my.service;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dao.GuestDAO;
import org.spring.my.dto.Guest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class GuestServiceImpl implements GuestService{
	
	private static final Logger logger = LoggerFactory.getLogger(GuestServiceImpl.class);
	
	/* 암호화위해서 자동주입(DI) */
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Autowired
	private GuestDAO guestDAO;
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	@Override
	public Map<String,Object> insert(Guest guest){
		Map<String,Object> resultMap = new HashMap<>();
		//중복 아이디 체크
		//rcode
		//0 : 사용가능 id
		// -1 : 사용불가 id
		//msg
		int rcode;
		String msg;
		
		Guest oldguest = guestDAO.selectOne(guest.getUserid());
		if(oldguest != null) { //기존 회원이 존재한다면
			resultMap.put("rcode",-1);
			resultMap.put("msg","중복된 아이디");
			
			return resultMap;
			
			
			
		}
		
		
		
		//resultMap.put("rcode",rcode);
		//resultMap.put("msg",msg);
		
		
		
		//1)파일 업로드
//		String filename = fileservice.fileUpload(fname);
//		//실제 올려진 파일의 이름
//		Member.setFilename(filename);
//		logger.info(Member.toString());
		
		//2)비밀번호 암호화
		guest.setPasswd(bCryptPasswordEncoder.encode(guest.getPasswd()));
		logger.info(guest.toString());
		
		//3)DB에 저장
		guestDAO.insert(guest);
		
		//4)이메일 정송
		//String authCode = mailsendservice.sendAuthMail(Member.getEmail(),Member.getUserid());
		
		
		//resultMap.put("authCode", authCode);
		resultMap.put("rcode",0);
		resultMap.put("msg","가입성공");
		
		return resultMap;
	}

	@Override
	public Map<String, Object> login(String userid, String passwd) {
		Map<String,Object> resultMap = new HashMap<>();
		// 0 : 로그인 완료
		// 1 : 아이디 미 존재
		// 2 : 패스워드 불일치
		int rcode;
		String msg;
		//회원조회
		Guest guest = guestDAO.selectOne(userid);
		if(guest == null) { //아이디 미존재
			rcode = 1;
			msg = "ID 확인";
		}else{ 
			//비밀번호 체크
			// 매개변수 : 평문,암호화된 password 
			if (bCryptPasswordEncoder.matches(passwd, guest.getPasswd())) {
				rcode = 0;
				msg = "로그인 완료";
			}else {
				rcode = 2;
				msg = "비밀번호 체크";
			}
		}
		resultMap.put("rcode",rcode);
		resultMap.put("msg",msg);
		return resultMap;
		
		
	}

	@Override
	public Guest selectOne(String userid) {
		return guestDAO.selectOne(userid);
	}

	@Override
	public List<Guest> selectList(Map<String,String> findmap) {
		return guestDAO.selectList(findmap);
	}

	@Override
	public Map<String, Object> update(Guest guest) {
		Map<String,Object> resultMap = new HashMap<>();
		// 0 : 수정완료 
		// 1 : 비밀번호 체크
		int rcode;
		String msg;
		guest.setPasswd(bCryptPasswordEncoder.encode(guest.getPasswd()));
		
		Guest oldguest = guestDAO.selectOne(guest.getUserid());
		
		if (bCryptPasswordEncoder.matches(guest.getUserid(), guest.getPasswd())) {
			rcode = 0;
			msg = "수정 완료";
		}else {
			rcode = 1;
			msg = "비밀번호 체크";
		}
		
		logger.info(guest.toString());
		guestDAO.update(guest);
		resultMap.put("rcode",rcode);
		resultMap.put("msg",msg);
		
		System.out.println("resultMap : "+resultMap);
		return resultMap;
		
	}

	@Override
	public void delete(String userid) {
		guestDAO.delete(userid);
		
	}

	@Override
	public void updateEmailAuth(String userid) {
		guestDAO.updateEmailAuth(userid);
		
	}

	//이메일만 조회
	@Override
	public List<String> selectEmail(String email) {

		return guestDAO.selectEmail(email);
	}
	


}
