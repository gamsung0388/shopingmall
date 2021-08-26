package org.spring.my.service;

import java.util.List;

import org.spring.my.dao.AnswerDAO;
import org.spring.my.dto.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService{
	
	@Autowired
	private AnswerDAO answerDAO;

	@Override
	public void insert(Answer answer) {
		//viwe에서 받은 데이터는 부모의 정보
		//글의 순서 +1
		answer.setRestep(answer.getRestep()+1);
		//글의 레벨 +1
		answer.setRelevel(answer.getRelevel()+1);
		
		//추가
		answerDAO.insert(answer);
	}

	@Override
	public List<Answer> selectList(int acode) {
		return answerDAO.selectList(acode);
		
	}

}
