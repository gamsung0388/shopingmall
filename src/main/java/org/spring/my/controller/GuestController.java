package org.spring.my.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.dao.GuestDAO;
import org.spring.my.dto.Guest;
import org.spring.my.service.GuestService;
import org.spring.my.service.MailSendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.iap.Response;


//테스트
@Controller
@RequestMapping("guest")
public class GuestController {
	
	private static final Logger logger = LoggerFactory.getLogger(GuestController.class);
	
	@Autowired
	private GuestService guestservice;
	
	@Autowired
	private MailSendService mailSendService;
	
	@Autowired
	private GuestDAO guestDAO;
	
	//회원가입 폼 이동
	@GetMapping("join")
	public void join() {}
	
	//회원 가입
	
	@PostMapping("join")
	public String join(Guest guest,String emailcode,String email, MultipartFile fname,Model model,String userid,HttpSession session) {
		String msg;
		Guest newid;
		
		String useemail  =  (String)session.getAttribute("authCode");
		
		//logger.info("userid:"+userid);
		//logger.info("logger:"+guest.toString());
		newid = guestservice.selectOne(userid);	
		//System.out.println("newid : "+newid);
		//System.out.println("guest"+guest);
		logger.info("useemail : " + useemail);
		logger.info("emailcode : "+emailcode);
		
	

		if(newid!=null) {
			msg = "아이디 중복 확인";
			logger.info("ID중복");
			logger.info(userid);
			model.addAttribute("msg",msg);
			return "guest/join";
		}else if(!useemail.equals(emailcode)){
			msg = " 이메일 인증번호 확인";
			logger.info("useemail : " + useemail);
			logger.info("emailcode : "+emailcode);
			model.addAttribute("msg",msg);
			return "guest/join";
		}else {
			msg = "로고나 가입을 환영합니다";
			guestservice.insert(guest);
			logger.info("userid");
			logger.info(userid);
			logger.info("guest");
			System.out.println(guest);
			model.addAttribute("msg",msg);
			return "guest/login";
			
		}
	}

	//로그인
	
	@PostMapping("login")
	public String login(String userid,String passwd,Model model,HttpSession session) {
		// 0 : 로그인 완료 => 메인으로 이동
		// 1 : 아이디 미존재 => 로그인으로
		// 2 : 비밀번호 불일치 => 로그인 이동
		System.out.println(session);
		Map<String,Object> resultMap = guestservice.login(userid, passwd);
		if((int)resultMap.get("rcode")==0) {
			session.setAttribute("userid",userid);
			System.out.println(session.getAttribute("userid"));
			return "main";
		}else {
			model.addAttribute("resultMap",resultMap);
			return "guest/login";
		}
		
	}	
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();

		return "main";
		
	}

	@GetMapping("/")
	public String list() {
		return "guest/main";
	}
	
	//사용자 리스트 
	@GetMapping("list")
	public String list(@RequestParam HashMap<String,String>findmap,Model model) {
		logger.info(findmap.toString());
		List<Guest> glist = guestservice.selectList(findmap);
		model.addAttribute("glist",glist);
		
		return "guest/list";
	}
	
	//상세조회 이동
	@GetMapping("detail")
	public void detail(String userid,Model model,HttpSession session) {

		/*
		 * Guest guest = guestservice.selectOne("userid"); Guest gguest =
		 * guestservice.selectOne(userid);
		 */
		model.getAttribute(userid);
		System.out.println(userid);
		
		String userinfo = (String) session.getAttribute("userid");
		Guest guest = guestservice.selectOne(userinfo);
		System.out.println("detail guetst 1 : "+guest);
		model.addAttribute(guest);
		System.out.println("detail guetst 2 : "+guest);
		model.getAttribute(userid);
		System.out.println("detail userid 2 : "+userid);
	
	}
	//수정 폼 이동
	@GetMapping("modify")
	public void modify(String userid,Model model,HttpSession session) {
		logger.info("modify logger guest.userid : "+ userid);
		Guest guest = guestservice.selectOne(userid);
		System.out.println("modify guetst 1 : "+guest);
		model.addAttribute("guest",guest);
		System.out.println("modify guetst 2 : "+guest);
	}
	
	
	
	
		//수정하기
		@PostMapping("modify")
		public String modify(Guest guest,Model model) {
			logger.info("modify logger guest.toString : "+guest.toString());
			guestservice.update(guest);
			
			//주소 변경 detail로 이동
		
			model.addAttribute(guest);
			System.out.println("modify guest 3 : "+guest);
			return "guest/detail";
			
		}


		//아이디 중복 체크
		@ResponseBody
		@RequestMapping("idCheck")
		public Guest idCheck(@ModelAttribute("userid") String userid,Model model) {
		Guest useok = guestservice.selectOne(userid);
		logger.info(userid);

		System.out.println(useok);
		String msg;
		if(useok == null) {
			msg = "사용가능";
			
			logger.info(msg);
			
		}else {
			msg = "중복된 아이디";
			
			logger.info(msg);
		}
		model.addAttribute("msg",msg);
		model.addAttribute("useok",useok);
		
		return useok = guestservice.selectOne(userid);
		
	}
		//삭제
		@GetMapping("delete")
		public String delete(String userid,HttpSession session) {
			logger.info(userid);
			guestservice.delete(userid);
			session.invalidate();
			return "redirect:/";
			
		}
		
		//팝업 띄우기
		//get 방식과 post 방식 처리
		//get : 주소 창 띄우기
		//post : 주소 결과 값
		//callback시 post방식 실행
		@RequestMapping("jusoPopup") 
		public String popup() {
			return "guest/jusoPopup";

		}
		
		//이메일에서 링크을 클릭했을때 처리
		@RequestMapping("joinConfirm")
		public String joinConfirm(String userid, String authCode, String email,  HttpSession session, RedirectAttributes rattr) {
			String sessionAuthCode = (String)session.getAttribute(userid);
			//인증키 검증
			if (sessionAuthCode == null) { //세션기간이 종료되면 key사라짐
				logger.info("세션기간 만료");
				return "redirect:/main";
			}else if (sessionAuthCode.equals(authCode)) {
				logger.info("인증성공");
				//emailauth 1로 변경
				//memberService.updateEmailAuth(userid);
				rattr.addFlashAttribute("userid", userid);
				rattr.addFlashAttribute("email", email);
				rattr.addFlashAttribute("emailCheckYn", "y");
				return "redirect:/guest/join";
			}else {
				logger.info("인증키 일치 하지 않습니다.");
				return "redirect:/main";
			}

		
		}
		//이메일 전송
		@ResponseBody
		@RequestMapping("emailCheck")
		public String emailCheck(@RequestParam HashMap<String,String>findmap,Guest guest,String userid, String email,HttpSession session,Model model) throws Exception{
		
			
			
			List<String> eemail = guestservice.selectEmail(email);
			String msg;
			/*
			 * System.out.println("elist : " + elist); logger.info("guest : "+guest);
			 * logger.info("email : "+email); logger.info("oo : "+oo);
			 * System.out.println("ooo : " + ooo); System.out.println("oooo : " + oooo);
			 * logger.info("eemail : "+eemail);
			 */
	
			if(!eemail.isEmpty()) {
				System.out.println("바보");
			}else {
				String authCode = mailSendService.sendAuthMail(email, userid);
				System.out.println("멍청이");
			
			
				//인증키를 세션에 넣기
				//key:userid, value : authCode 인 세션생성
				session.setAttribute("authCode" , authCode);
				session.setMaxInactiveInterval(60*60*2);
				return authCode;
			}
			return "Y";
		}
		//이메일 코드값 중복 체크
		@ResponseBody
		@GetMapping("codeCheck")
		public String codeCheck(String emailcode,String email,Model model,HttpSession session) throws Exception {
			String msg;
	
			

			String useemail  =  (String)session.getAttribute("authCode");
			logger.info(email);
			logger.info(emailcode);
			System.out.println(useemail);
		
			if(useemail.equals(emailcode)) {
				msg = "일치";
			

				logger.info(msg);
				logger.info(useemail);
				

			}else{
				msg = "불일치";
				

				logger.info(msg);
				logger.info(useemail);
			
			}
			model.addAttribute("msg",msg);
			model.addAttribute("useemail",useemail);
			
			return useemail;
			
			
			
		}
		
		
		
}
