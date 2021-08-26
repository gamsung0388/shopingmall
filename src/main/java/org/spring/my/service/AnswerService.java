package org.spring.my.service;

import java.util.List;

import org.spring.my.dto.Answer;

public interface AnswerService {

	public void insert(Answer answer);
	public List<Answer> selectList(int acode);

}
