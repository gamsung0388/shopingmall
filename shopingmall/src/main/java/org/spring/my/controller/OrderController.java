package org.spring.my.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Sell;
import org.spring.my.dto.SellBox;
import org.spring.my.dto.SellDetail;
import org.spring.my.service.SellBoxService;
import org.spring.my.service.SellDetailService;
import org.spring.my.service.SellService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("order")
@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private SellDetailService selldetailService;
	
	@Autowired
	private SellService sellService;
	
	//결제 등록
	@PostMapping("add")
	//sellbox가 중복해서 넘어올때의 경우 for구문으로 찍어줘야됨
	//참고 board의 update파일
	public String sellinsert(@RequestParam(value="sbcode",required = false) List<Integer> sbcodelist,Sell sell,HttpSession session) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		//결제추가
		sell.setUserid(userid);
		sellService.insert(sell);
		//결제 코드
		int scode =sell.getScode();
		//결제상세 추가
		selldetailService.insert(scode,userid,sbcodelist);
		
		return "redirect:sdselect";
	}
	//마이페이지에 주문내역으로
	@GetMapping("sdselect")
	public String selectList(HttpSession session,Model model) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		//상품내역
		List<Map<String, Object>> ssdlist = sellService.selectList(userid);
		model.addAttribute("ssdlist",ssdlist);
		
		return "Sell/OrderList";
	}
	//주문내역에서 상세내역으로
	@GetMapping("sdselectOne")
	public String selectOne(int scode,String pcode,HttpSession session,Model model) throws Exception {
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		//상품 단일조회
		Map<String, Object> ssdOne = sellService.selectOne(scode,pcode);
		model.addAttribute("ssdOne",ssdOne);
		System.out.println(userid);
		System.out.println(pcode);
		System.out.println(ssdOne.toString());
		return "Sell/Orderdetail";
	}
	
}
