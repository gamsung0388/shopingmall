package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Big;
import org.spring.my.dto.Little;
import org.spring.my.dto.Page;
import org.spring.my.dto.Product;
import org.spring.my.service.BigService;
import org.spring.my.service.LittleService;
import org.spring.my.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("product")
public class ProductController {	
	@Autowired
	private LittleService littleService;
	
	@Autowired
	private BigService bigService;
	
	@Autowired
	private ProductService productService;

	
	
	
	//상품등록 폼으로 이동
	@GetMapping("add")
	public void add(Page page, Model model) throws Exception{
		List<Big> blist = bigService.selectList();
		List<Little> llist = littleService.selectList(page);
		model.addAttribute("blist", blist);
		model.addAttribute("llist", llist);
	}
	//상품등록
	@PostMapping("add")
	public String add(Product product) throws Exception{
	productService.insert(product);
	return "redirect:add";		
	}

	//상품목록
	@GetMapping("list")
	public void list(@ModelAttribute("page") Page page, Model model)throws Exception{
		List<Map<String,Object>> plist = productService.selectList(page);
		model.addAttribute("plist", plist);
	}
	//상품삭제
	@GetMapping("delete")
	public String delete(String pcode) throws Exception{
		productService.delete(pcode);
		return "redirect:list";
	}
	//상품 상세
	@GetMapping("detail")
	public void detail(String pcode, Model model) throws Exception{
		Map<String, Object> productMap = productService.selectOne(pcode);
		model.addAttribute("productMap" , productMap);
	}
	
	//상품수정으로 이동
	@GetMapping("modify")
	public String modify(Page page, String pcode, Model model) throws Exception{
		Map<String, Object> productMap = productService.selectOne(pcode);
		List<Big> blist = bigService.selectList();
		List<Little> llist = littleService.selectList(page);
		model.addAttribute("blist", blist);
		model.addAttribute("llist", llist);
		model.addAttribute("productMap" , productMap);		
		return "product/modify";
		
	}
	//상품파일수정
	@PostMapping("modify")
	public String modify(Product product)throws Exception{
		productService.update(product);	
		return "redirect:list";
	}
}
