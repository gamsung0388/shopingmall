package org.spring.my.dto;

import lombok.Data;

@Data
public class SellBox {
	public int sbcode;//장바구니 코드
	public String userid;//아이디
	public String pcode;//상품코드
	public int sellcnt;//주문수량
	public int amount;//가격
}
