package org.spring.my.service;

import java.util.List;
import java.util.Map;

import org.spring.my.dto.Guest;
import org.springframework.web.multipart.MultipartFile;


public interface GuestService {

	public Map<String, Object> login(String userid, String passwd);
	public Guest selectOne(String userid);

	public Map<String, Object> insert(Guest guest);
	public List<Guest> selectList(Map<String,String> findmap);
	public Map<String, Object> update(Guest guest);
	public void delete(String userid);
	public void updateEmailAuth(String userid);
	public List<String>selectEmail(String email);
	
}
