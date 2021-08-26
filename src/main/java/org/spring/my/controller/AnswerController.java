package org.spring.my.controller;
//
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.spring.my.dto.Answer;
import org.spring.my.service.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController //@ResponseBody + @Controller 
@RequestMapping("answer")
public class AnswerController {
	
	@Autowired
	private AnswerService answerService;
//
	//답글 추가
	//@ResponseBody : 리턴되는 값(데이터) 자체를 보낼 때
	@ResponseBody
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@RequestBody Answer answer,
			HttpSession session, HttpServletRequest request) {
		//answer(dto) userid에 값 넣기
		String userid = (String) session.getAttribute("userid");
		answer.setUserid(userid);
		//answer(dto) ip에 값 넣기
		answer.setIp(request.getRemoteAddr());
		answerService.insert(answer);
		
		return "ok";
	}
	//
	//답글 조회
	//@PathVariable: URL경로에 변수를 넣어주는 것
	@RequestMapping(value = "/list/{acode}", method = RequestMethod.GET)
	public List<Answer> list(@PathVariable("acode") int acode){
		//댓글 조회
		List<Answer> ansSelect = answerService.selectList(acode);
		return ansSelect;
	}
}
