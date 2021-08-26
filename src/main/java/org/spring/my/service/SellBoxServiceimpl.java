package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.spring.my.dao.ProductDAO;
import org.spring.my.dao.ProductFileDAO;
import org.spring.my.dao.SellBoxDAO;
import org.spring.my.dto.Product;
import org.spring.my.dto.ProductFile;
import org.spring.my.dto.SellBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class SellBoxServiceimpl implements SellBoxService{

	@Autowired
	private SellBoxDAO sellBoxDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private ProductFileDAO productFileDAO;
	
	//장바구니에 상품 추가
	@Override
	public void insert(SellBox sellBox) throws Exception {
		//기존 상품이 있는지
		int pcnt = sellBoxDAO.CountCheck(sellBox.getPcode(),sellBox.getUserid());
		if(pcnt==0) {//없다면 장바구니에 추가
			Map<String, Object> productmap=productDAO.selectOne(sellBox.getPcode());
			int amount =Integer.parseInt(productmap.get("PRICE").toString())*sellBox.getSellcnt();
			sellBox.setAmount(amount);
			sellBoxDAO.insert(sellBox);
		}else {//있다면 장바구니 수정
			sellBoxDAO.Sellcntup(sellBox.getUserid(),sellBox.getSellcnt(),sellBox.getPcode());
		}
	}
	//장바구니 상품 전체 조회
	@Override
	public	Map<String, Object>  selectList(String userid) throws Exception{
		
	
		
		//상품전체 조회
		List<Map<String, Object>> slist = sellBoxDAO.selectList(userid);
		
		//상품 사진파일 조회
//		List<ProductFile> pflist = productFileDAO.selectList(pcode);
		
		
		//장바구니+배송비
		Map<String, Object> sellBoxmap = new HashMap<>();
		
//		sellBoxmap.put("pflist", pflist); //사진 정보
		sellBoxmap.put("slist", slist); //장바구니 정보
		sellBoxmap.put("count", slist.size());
		return sellBoxmap;
	}
	//장바구니 전체 비우기
	@Override
	public void Alldelete(String userid) throws Exception{
		sellBoxDAO.Alldelete(userid);
	}
	//장바구니 단일 비우기
	@Override
	public void delete(String userid,String pcode) throws Exception{
		sellBoxDAO.delete(userid,pcode);
	}
	//장바구니 상품 단일 조회
	@Override
	public SellBox selectOne(int sbcode) throws Exception{
		return sellBoxDAO.selectOne(sbcode);
	}
	
	//장바구니를 단일결제에서 출력
	@Override
	public Map<String,Object> orderselectone(String userid,String pcode)throws Exception{
		//총 가격
		int amount = sellBoxDAO.Amount(userid,pcode);
		System.out.println(userid);
		System.out.println(pcode);
		System.out.println(amount);
		//배송비(5만원이상이면 공짜 이하면 3000원 배송비)
		int fee = amount>=50000?0:3000;
		List<Map<String,Object>> oslist=sellBoxDAO.orderselectone(userid,pcode);
		//장바구니+배송비
		Map<String, Object> sellBoxmap = new HashMap<>();
		sellBoxmap.put("oslist", oslist); //장바구니 정보
		sellBoxmap.put("fee", fee); //배송비
		sellBoxmap.put("amount",amount+fee);//물품 가격 총 합계
		return sellBoxmap;
	}
	//장바구니를 중복결제에서 출력
	@Override
	public Map<String, Object> orderselectList(String userid)throws Exception{
		//총 가격//userid로만
		int amount = sellBoxDAO.AllAmount(userid);
		//배송비(5만원이상이면 공짜 이하면 3000원 배송비)
		int fee = amount>=50000?0:3000;
		List<Map<String, Object>> oslist=sellBoxDAO.orderselectList(userid);
		//장바구니+배송비
		Map<String, Object> sellBoxmap = new HashMap<>();
		sellBoxmap.put("oslist", oslist); //장바구니 정보
		sellBoxmap.put("fee", fee); //배송비
		sellBoxmap.put("amount",amount+fee);//물품 가격 총 합계
		return sellBoxmap;
	}
}
