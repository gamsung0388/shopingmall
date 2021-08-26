package org.spring.my.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.spring.my.controller.OrderController;
import org.spring.my.dao.SellBoxDAO;
import org.spring.my.dao.SellDetailDAO;
import org.spring.my.dto.SellBox;
import org.spring.my.dto.SellDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellDetailServiceimpl implements SellDetailService{
	
	private static final Logger logger = LoggerFactory.getLogger(SellDetailServiceimpl.class);
	
	@Autowired
	private SellBoxService sellBoxService;

	@Autowired
	private SellDetailDAO selldetailDAO;
	
	//결제 상세 추가
	@Override
	public void insert(int scode,String userid,List<Integer> sbcodelist) throws Exception{
		for(int sbcode : sbcodelist) {
			//장바구니 정보
			SellBox sellBox = sellBoxService.selectOne(sbcode);
			//결제상품 추가
			SellDetail sellDetail = new SellDetail();
			sellDetail.setScode(scode);//결제코드
			sellDetail.setPcode(sellBox.getPcode());//상품코드
			sellDetail.setSellcnt(sellBox.getSellcnt());//상품수
			sellDetail.setAmount(sellBox.getAmount());//상품가격
			//결제상세 추가
			selldetailDAO.insert(sellDetail);
			//구매시 장바구니 삭제
			sellBoxService.delete(userid, sellBox.getPcode());
			logger.info("장바구니삭제");
		}
	}

}
