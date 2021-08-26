package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.NoticeDAO;
import org.spring.my.dao.NoticeFileDAO;
import org.spring.my.dao.NoticeUserManagerDAO;
import org.spring.my.dto.Notice;
import org.spring.my.dto.NoticeFile;
import org.spring.my.dto.NoticeUserManager;
import org.spring.my.dto.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private NoticeFileService noticeFileService;
	
	@Autowired
	private NoticeFileDAO noticeFileDAO;
	
	@Autowired
	private NoticeUserManagerDAO noticeUserManagerDAO;
	
	@Transactional
	@Override
	public void insert(Notice notice) {
		//공지사항 등록
		noticeDAO.insert(notice);
		
		//파일을 업로드하고 db에 저장
		noticeFileService.insertNoticeFiles(notice.getNcode(), notice.getFiles());
		
	}

	@Override
	public List<Map<String, Object>> selectList(Page page) {
		//page값 구하기
		//전체 게시물 수
		int totCnt = noticeDAO.selectTotCnt(page);
		
		
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
		
		return noticeDAO.selectList(page);
		
	}

	@Override
	public Map<String, Object> selectOne(int ncode) {
		//공지글 한 건 조회
		Notice notice = noticeDAO.selectOne(ncode);
		
		//공지글의 파일들을 조회
		List<NoticeFile> nflist = noticeFileDAO.selectList(ncode);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("notice", notice);
		resultMap.put("nflist", nflist);
		
		return resultMap;
	}

	@Override
	public void updateReadCnt(int ncode, String userid) {
		//유저관리 테이블에 data가 없다면 insert + readCnt+1
		NoticeUserManager noticeUserManager = new NoticeUserManager();
		noticeUserManager.setGubun("0"); //0:게시글
		noticeUserManager.setNum(ncode); //게시글 번호
		noticeUserManager.setUserid(userid); //회원의 아이디
		noticeUserManager.setState("0"); //0:조회
		
		System.out.println("noticeUserManager: " + noticeUserManager);
		noticeUserManagerDAO.noticeReadCnt(noticeUserManager);
		
	}

	//삭제하기
	@Transactional
	@Override
	public void delete(int ncode) {
		//파일 삭제
		noticeFileDAO.delete(ncode);
		
		//게시물 삭제
		noticeDAO.delete(ncode);
		
	}

	//수정하기
	@Override
	public void update(Notice notice, List<Integer> fileDeleteList) {
		// 게시물 수정
		noticeDAO.update(notice);
		
		//기존파일 삭제
		if(fileDeleteList != null) {
			for(Integer fcode : fileDeleteList) {
				noticeFileDAO.filedelete(fcode);
			}
		}
		
		//파일 추가
		//파일을 업로드 하고 db에 저장
		noticeFileService.insertNoticeFiles(notice.getNcode(), notice.getFiles());
	}

}