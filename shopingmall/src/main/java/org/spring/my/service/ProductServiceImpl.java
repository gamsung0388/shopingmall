package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.ProductDAO;
import org.spring.my.dao.ProductFileDAO;
import org.spring.my.dto.Page;
import org.spring.my.dto.Product;
import org.spring.my.dto.ProductFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductFileService productFileService;
	
	@Autowired
	private ProductDAO	productDAO;
	
	@Autowired
	private ProductFileDAO productFileDAO;
	
	//상품등록
	@Transactional
	@Override
	public void insert(Product product) throws Exception {
		productDAO.insert(product);		
		
		//파일을 업로드 하고 db에 저장
		productFileService.insertBoardFiles(product.getPcode(),product.getFiles());
	}
	//상품 리스트
	@Override
	public List<Map<String, Object>> selectList(Page page) throws Exception {
		//page 값 구하기
		//전체 게시물수 
		int totCnt = productDAO.selectTotCnt(page);
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
		//검색 상품
	    List<Map<String, Object>> slist=productDAO.selectList(page);
		return slist;
	}
	//상품 삭제
	@Override
	public void delete(String pcode) throws Exception {
		productDAO.delete(pcode);			
	}
	//상품 단일 조회
	@Override
	public Map<String, Object> selectOne(String pcode) throws Exception {

		Map<String, Object> product = productDAO.selectOne(pcode);

		List<ProductFile> pflist = productFileDAO.selectList(pcode);
		Map<String, Object> productMap = new HashMap<>();
		productMap.put("product", product);
		productMap.put("pflist", pflist);
		
		return productMap;
	}

	@Override
	public void update(Product product) throws Exception {
		//게시물수정
		productDAO.update(product);
		
		System.out.println("product:" +product.toString());
		
		//기존파일 삭제
		productFileDAO.deleteAll(product.getPcode());
		
		/*
		 * if (fileDeleteList != null) { for(int fcode : fileDeleteList) {
		 * productFileDAO.delete(fcode); } }
		 */
			
		//파일 추가
		//파일을 업로드 하고 db에 저장
		productFileService.insertBoardFiles(product.getPcode(),product.getFiles());
	}

}
