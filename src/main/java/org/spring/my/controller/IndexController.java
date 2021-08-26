package org.spring.my.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dao.ProductDAO;
import org.spring.my.dto.Page;
import org.spring.my.service.GuestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("page")
public class IndexController {
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);
	
	@Autowired
	private GuestService guestService;
	
	@Autowired
	private ProductDAO productDAO;
	
	//세션생성
	@RequestMapping("/")
	public String home(Page page,Model model) throws Exception{
		//모델을 생성해서 @SessionAttributes에 생성
		model.addAttribute("page",page);
		return "redirect:main";
	}
	
	//메인페이지로 이동
	@RequestMapping("main")
	public void main(@ModelAttribute("page") Page page, Model model) throws Exception {
		int startNum = 1;
		int endNum = 12;
		page.setStartNum(startNum);
		page.setEndNum(endNum);
		
		System.out.println(page);
		List<Map<String,Object>> plist =productDAO.selectList(page);
		//product 리스트 / 상품 사진 파일 찍어주기
		System.out.println(plist.toString());
		model.addAttribute("plist",plist);		
	}	
	//로그인폼으로 이동
	//mapping값과 return값이 같으면 void로 생략 가능!
	//그렇지 않다면 String으로 return값 지정!
	@GetMapping("login")
	public String login() {
		return "guest/login";
	}
	
	@PostMapping("login")
	public String login(String userid, HttpSession session) {
		session.setAttribute("userid", userid);
		guestService.selectOne(userid);
		return "redirect:index";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		//모든 세션의 변수를 삭제
		session.invalidate();
		return "redirect:index";		
	}
	
}
