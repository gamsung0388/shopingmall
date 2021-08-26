package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.spring.my.dao.AnswerDAO;
import org.spring.my.dao.AskDAO;
import org.spring.my.dao.AskFileDAO;
import org.spring.my.dao.AskUserManagerDAO;
import org.spring.my.dto.Ask;
import org.spring.my.dto.AskFile;
import org.spring.my.dto.AskUserManager;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AskServiceImpl implements AskService{

	@Autowired
	private AskDAO askDAO;
	
	@Autowired
	private AskFileService askFileService;
	
	@Autowired
	private AskUserManagerDAO askUserManagerDAO;
	
	@Autowired
	private AskFileDAO askFileDAO;
	
	@Autowired
	private AnswerDAO answerDAO;
	
	@Transactional
	@Override
	public void insert(Ask ask) {
		//문의사항 등록
		askDAO.insert(ask);
		
		//파일을 업로드하고 db에 저장
		askFileService.insertAskFiles(ask.getAcode(), ask.getFiles());
		
	}

	@Override
	public List<Map<String, Object>> selectList(Page page) {
		//page값 구하기
		//전체 게시물 수
		int totCnt = askDAO.selectTotCnt(page);
		
		//전체 페이지 수
		//전체 페이지 수 = 전체 게시물 수 / 한 페이지의 게시물 수 (나머지가 있으면 +1)
		int totPage = totCnt / page.getPerPage() ;
		if(totCnt % page.getPerPage() != 0) totPage += 1;
		page.setTotPage(totPage);
		
		//현제 페이지
		int curPage = page.getCurPage();
		
		//시작번호
		//시작번호 = (현재페이지-1) * 한페이지의 게시물수 + 1
		int startNum = (curPage-1) * page.getPerPage() + 1;
		page.setStartNum(startNum);
		
		//끝번호
		//끝번호 = 시작번호 + 한페이지의 게시물수 -1
		int endNum = startNum + page.getPerPage() -1;
		page.setEndNum(endNum);
		
		//시작페이지
		//시작페이지 = 현재페이지 - ((현재페이지-1) % 페이지블럭의수)
		int startPage = curPage - ((curPage-1) % page.getPerBlock());
		page.setStartPage(startPage);
		
		//끝페이지
		//끝페이지 = 시작페이지 + (페이지블럭의수-1)
		int endPage = startPage + (page.getPerBlock() -1);
		//전체 페이지 수보다 끝 페이지가 크다면
		if (endPage > totPage) endPage = totPage;
		page.setEndPage(endPage);
		
		return askDAO.selectList(page);
		
	}

	@Override
	public Map<String, Object> selectOne(int acode) {
		//공지글 한 건 조회
		Ask ask = askDAO.selectOne(acode);
		
		//공지글 파일 조회
		List<AskFile> aflist = askFileDAO.selectList(acode);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("ask", ask);
		resultMap.put("aflist", aflist);
		
		return resultMap;
		
	}

	@Override
	public void updateReadCnt(int acode, String userid) {
		//유저관리 테이블에 data가 없다면 insert + readCnt + 1
		AskUserManager askUserManager = new AskUserManager();
		askUserManager.setGubun("0"); //0:문의글
		askUserManager.setNum(acode); //문의글 번호
		askUserManager.setUserid(userid); //아이디
		askUserManager.setState("0"); //0:조회
		
		askUserManagerDAO.readcnt_ask(askUserManager);		
	}

	@Transactional
	@Override
	public void delete(int acode) {
		//질문의 답변 삭제
		answerDAO.delete(acode);
		
		//원본의 파일 삭제
		askFileDAO.delete(acode);
		
		//원본글 삭제
		askDAO.delete(acode);
		
	}
	

}
