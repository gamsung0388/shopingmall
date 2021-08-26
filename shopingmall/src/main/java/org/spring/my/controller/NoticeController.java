package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Notice;
import org.spring.my.dto.Page;
import org.spring.my.service.NoticeFileService;
import org.spring.my.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private NoticeFileService noticeFileService;
	
	//공지글 등록폼으로 이동
	@GetMapping("add")
	public void add() {
		
	}
	
	//공지글 등록
	@PostMapping("add")
	public String add(Notice notice, HttpServletRequest request) {
		//사용자의 ip 얻기
		logger.info(notice.toString());
		notice.setIp(request.getRemoteAddr());
		noticeService.insert(notice);
		return "redirect:list";
	}
	
	//공지글 조회
	@GetMapping("list")
	public void list(Page page, Model model) {
		logger.info(page.toString());
		List<Map<String, Object>> nlist = noticeService.selectList(page);
		logger.info(page.toString());
		model.addAttribute("nlist", nlist);
		model.addAttribute("page", page);
		
	}
	
	//공지글 상세조회
	@GetMapping("detail")
	public void detail(int ncode, HttpSession session, Model model) {
		//조회수 +1
		String userid = (String)session.getAttribute("userid");
		noticeService.updateReadCnt(ncode, userid);
		
		//한 건 조회
		Map<String, Object> nMap = noticeService.selectOne(ncode);
		logger.info(nMap.toString());
		
		model.addAttribute("nMap", nMap);
	}
	
	//공지글 수정폼으로 이동
	@GetMapping("modify")
	public String modify(int ncode, Model model) {
		Map<String, Object> nMap = noticeService.selectOne(ncode);
		 
		model.addAttribute("nMap", nMap);
		return "/notice/modify";
	}
	
	//공지글 수정하기
	@PostMapping("modify")
	public String modify(Notice notice, 
			@RequestParam(value = "fileDelete", required = false) List<Integer> fileDeleteList, //래퍼 클래스(Integer)
			HttpServletRequest request) {
		//ip구하기
		notice.setIp(request.getRemoteAddr());
		noticeService.update(notice, fileDeleteList);
		return "redirect:list";
	}
	
	//공지글 삭제하기
	@GetMapping("delete")
	public String delete(int ncode) {
		noticeService.delete(ncode);
		return "redirect:list";
	}
	
	//파일 다운로드
	@RequestMapping("filedownload")
	public void filedownload(String filename, HttpServletResponse response) {
		try {
			noticeFileService.filedownload(filename, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
