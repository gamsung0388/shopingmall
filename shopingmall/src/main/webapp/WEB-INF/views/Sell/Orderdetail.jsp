<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제상세내역</title>

<style type="text/css">
table.type06 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}
table.type06 th {
  width: 350px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
}
table.type06 td {
  width: 100px;
  padding: 10px;
  vertical-align: top;
}
table.type06 .even {
  background: #efefef;
}


</style>


</head>
<body>
<%@ include file="../header.jsp" %>
<%@ include file="../mypage.jsp" %>
	<h2 align="center">결제상세내역</h2>
	<div align="center">
			<img src="${path}/uploadimg/${ssdOne.FNAME}" width="500">	
			<table class="type06">
			<tr>
				<td scope="row" class="even" >주문번호</td>
				<th align="left" class="even">${ssdOne.SCODE}</th>
			</tr>
			<tr>
				<td scope="row">주문자</td>
				<th align="left">${ssdOne.ORDERER}</th>
			</tr>
			<tr>
				<td scope="row" class="even">받는사람</td>
				<th align="left" class="even">${ssdOne.RECEIVER}</th>
			</tr>
			<tr>
				<td>전화번호</td>
				<th align="left">${ssdOne.PHONE}</th>
			</tr>
			<tr>
				<td class="even">이메일</td>
				<th class="even" align="left">${ssdOne.EMAIL}</th>
			</tr>
			<tr>
				<td>받는주소</td>
				<th align="left">(${ssdOne.ZIP})${ssdOne.ADDR1} ${ssdOne.ADDR2}</th>
			</tr>	
			<tr>
				<td class="even">상품이름</td>
				<th class="even" align="left">${ssdOne.PNAME}</th>
			</tr>
			<tr>
				<td>제조사</td>
				<th align="left">${ssdOne.PMAKER}</th>
			</tr>
			<tr>
				<td class="even">사이즈</td>
				<th class="even" align="left">${ssdOne.PSIZE}</th>
			</tr>	
			<tr>
				<td>색상</td>
				<th align="left">${ssdOne.PCOLOR}</th>
			</tr>
			<tr>
				<td class="even">수량</td>
				<th class="even" align="left">${ssdOne.SELLCNT}개</th>
			</tr>							
			<tr>
				<td >총주문가격</td>
				<th align="left"> ${ssdOne.AMOUNT}원</th>
			</tr>
			<tr>
				<td class="even">구매날짜</td>
				<th class="even" align="left">${ssdOne.REGDATE}</th>
			</tr>																	
		</table>
	</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>