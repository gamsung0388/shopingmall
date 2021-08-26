package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Ask;
import org.spring.my.dto.Page;
import org.spring.my.service.AskFileService;
import org.spring.my.service.AskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
@RequestMapping("ask")
public class AskController {
	private static final Logger logger = LoggerFactory.getLogger(AskController.class);
	
	@Autowired
	private AskService askService;
	
	@Autowired
	private AskFileService askFileService;
	
	//문의글 등록폼으로 이동
	@GetMapping("add")
	public void add() {
		
	}
	
	//문의글 등록
	@PostMapping("add")
	public String add(Ask ask, HttpServletRequest request) {
		//사용자의 ip 얻기
		logger.info(ask.toString());
		ask.setIp(request.getRemoteAddr());
		askService.insert(ask);
		return "redirect:list";
	}
	
	//문의글 조회
	@GetMapping("list")
	public void list(Page page, Model model) {
		List<Map<String, Object>> alist = askService.selectList(page);
		model.addAttribute("alist", alist);
		model.addAttribute("page", page);
	}
	
	//문의글 상세조회
	@GetMapping("detail")
	public void detail(int acode, HttpSession session, Model model) {
		//조회수 +1
		String userid = (String) session.getAttribute("userid");
		askService.updateReadCnt(acode, userid);
		
		//한 건 조회
		Map<String, Object> aMap = askService.selectOne(acode);
		
		model.addAttribute("aMap", aMap);
	}
	//문의글 삭제하기
	@GetMapping("delete")
	public String delete(int acode) {
		askService.delete(acode);
		return "redirect:list";
	}
	
	//파일다운로드
	@RequestMapping("filedownload")
	public void filedownload(String filename, HttpServletResponse response) {
		try {
			askFileService.filedownload(filename, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	

}
