package org.spring.my.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dto.Guest;
import org.spring.my.dto.SellBox;
import org.spring.my.service.GuestService;
import org.spring.my.service.SellBoxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@RequestMapping("sellbox")
@Controller
public class SellBoxController {
	private static final Logger logger = LoggerFactory.getLogger(SellBoxController.class);
	
	@Autowired
	private SellBoxService sellboxService;
	
	@Autowired
	private GuestService guestService;
	
	@RequestMapping("jusoPopup") 
	public void popupform() {}
	
	//판매버튼 눌렀을때 장바구니 물품을 추가
	@GetMapping("boxinsert")
	public String boxinsert(SellBox sellBox,Model model, HttpSession session) throws Exception {
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		sellBox.setUserid(userid);
		System.out.println("userid : " +userid);
		System.out.println(sellBox.toString());
		//장바구니 물품 추가
		sellboxService.insert(sellBox);
		return "redirect:boxlist";
	}
	//장바구니 물품 리스트
	@GetMapping("boxlist")
	public String Sellform(Model model,HttpSession session) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		//장바구니 물품조회
		Map<String, Object> sellBoxmap = sellboxService.selectList(userid);
		logger.info(sellBoxmap.toString());
		model.addAttribute("sellBoxmap",sellBoxmap);
		
		return "Sell/Sellform";
	}
	//장바구니 전체 비우기
	@ResponseBody
	@DeleteMapping("Alldelete")
	public String Alldelete(HttpSession session) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		sellboxService.Alldelete(userid);
		return "delete";
	}
	//장바구니 단일 삭제
	@ResponseBody
	@DeleteMapping("delete/{pcode}")
	public String delete(@PathVariable("pcode") String pcode,HttpSession session) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		sellboxService.delete(userid, pcode);
		return "delete";
	}
	//장바구니 단일 주문
	@GetMapping("order")
	public String order(String sbcode,HttpSession session,RedirectAttributes rattr) throws Exception{
		rattr.addAttribute("sbcode",sbcode);
		return "redirect:orderOne";
	}
	//단일결제에서 결제폼으로
	@GetMapping("orderOne")
	public String orderOne(@ModelAttribute("sbcode") int sbcode,HttpSession session,Model model) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		SellBox sellbox = sellboxService.selectOne(sbcode);
		Map<String,Object> osmap = sellboxService.orderselectone(userid,sellbox.getPcode());
		Guest guest = guestService.selectOne(userid);
		model.addAttribute("guest",guest);
		model.addAttribute("osmap",osmap);
		return "Sell/Orderform";
	}
	//장바구니 전체 주문
	@GetMapping("Allorder")
	public String Allorder(HttpSession session,Model model) throws Exception{
		return "redirect:orderList";
	}
	//중복 결제에서 결제 폼으로
	@GetMapping("orderList")
	public String orderList(HttpSession session,Model model) throws Exception{
		String userid = (String)session.getAttribute("userid");
		//userid = "root";
		Map<String,Object> osmap = sellboxService.orderselectList(userid);
		Guest guest = guestService.selectOne(userid);
		model.addAttribute("guest",guest);
		model.addAttribute("osmap",osmap);
		return "Sell/Orderform";
	}
}
