package org.spring.my.dao;

import java.util.List;

import org.spring.my.dto.Answer;

public interface AnswerDAO {

	public void insert(Answer answer);
	public List<Answer> selectList(int acode);
	public void delete(int acode);

}
