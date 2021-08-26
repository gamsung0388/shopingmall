package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Big;
import org.spring.my.dto.Little;
import org.spring.my.dto.Page;
import org.spring.my.service.BigService;
import org.spring.my.service.LittleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("little")
public class LittleController {
	private static final Logger logger = LoggerFactory.getLogger(LittleController.class);
	
	@Autowired
	private LittleService littleService;
	
	@Autowired
	private BigService bigService;
	
	//상품등록 폼으로 이동
	@GetMapping("add")
	public void add(Model model) throws Exception {
		List<Big> blist = bigService.selectList();
		logger.info(blist.toString());
		model.addAttribute("blist", blist);
	}
	
	@PostMapping("add")
	public String add(Little little) throws Exception {
		littleService.insert(little);
		return "redirect:list";	
	}
	
	@GetMapping("list")
	public void list(@ModelAttribute("page") Page page,Model model) throws Exception{
		List<Little> llist = littleService.selectList(page);
		logger.info(llist.toString());
		model.addAttribute("llist", llist);
	}
	

	@GetMapping("delete")
	public String delete(String lcode) throws Exception{
		littleService.delete(lcode);
		return "redirect:list";
	}
}
