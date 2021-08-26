package org.spring.my.service;

import java.util.List;

import org.spring.my.dao.LittleDAO;
import org.spring.my.dto.Little;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LittleServiceImpl implements LittleService{
	@Autowired
	private LittleDAO littleDAO;

	@Override
	public void insert(Little little) throws Exception {
		littleDAO.insert(little);
		
	}

	@Override
	public List<Little> selectList(Page page) throws Exception {
		//page 값 구하기
		//전체 게시물수 
		int totCnt = littleDAO.selectTotCnt(page);
		//전체페이지수
		int totPage = totCnt / page.getPerPage();
		if (totCnt % page.getPerPage()!=0 ) totPage += 1;
		page.setTotPage(totPage);
		
		//현재 페이지
		int curPage = page.getCurPage();
		//시작번호
		int startNum = (curPage-1) * page.getPerPage() + 1;
		page.setStartNum(startNum);
		
		//끝번호
		int endNum = startNum + page.getPerPage() -1;
		page.setEndNum(endNum);
		
		//시작페이지
		int startPage = curPage - ((curPage-1) %page.getPerBlock());
		page.setStartPage(startPage);
		
		//끝페이지
		int endPage = startPage + page.getPerBlock() -1;
		if (endPage > totPage) endPage = totPage;
		page.setEndPage(endPage);
		return littleDAO.selectList(page);
	}

	@Override
	public void delete(String lcode) throws Exception {
		littleDAO.delete(lcode);
		
	}
	
}
