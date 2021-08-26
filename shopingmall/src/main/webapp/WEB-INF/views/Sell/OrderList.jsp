<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제내역리스트</title>
<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'IM_Hyemin-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Regular.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}

/*주문내역 테이블 폼*/
table{
	position: absolute;
	right : 200;
	top : 500;
	width: 900;
}
table td{
	height: 200;
}
table th{
	background: #F5F5F5;
	
}
.line{
	border-bottom: 1px solid #ccc;
	    font-family: 'IM_Hyemin-Regular';
}
.buttonarea{
	width: 70;
	border-bottom: 1px solid #ccc;
}
/*주문내역 글씨*/
.ordertitle{
	font-size: 35pt;
	margin-top : 10;
	margin-right: 300;
}
</style>
<script type="text/javascript">
	$(function(){
		/* $('#Adetail').click(function(e) {
			e.preventDefault();
			//해당 scode 주문코드를 하나만 찍어줌
			location.href='${path}/order/sdselectOne?scode='+scode;
		}) */
	});
</script>
</head>
<%@ include file="../header.jsp" %>
<%@ include file="../mypage.jsp" %>
<body>
	<h2 align="center" class="ordertitle">주문내역</h2>

		<div align="center">		
			<table  class="selllist">
			<c:forEach items="${ssdlist}" var="ssd">
				<tr>
					<td rowspan="2" class="productfile">
						<a href="${path}/order/sdselectOne?scode=${ssd.SCODE}&pcode=${ssd.PCODE}"><img src="${path}/uploadimg/${ssd.FNAME}" alt=""height="250" width="100%"></a> 							
					</td>	
					<td rowspan="2" class="line">
					주문코드:${ssd.SCODE}번<br>상품명:${ssd.PNAME}<br>색:${ssd.PCOLOR}<br>사이즈:${ssd.PSIZE}		
						<c:set var="beforecode" value="${ssd.SCODE}"/>
					</td>
				<th>
					진행상태
				</th>
				<th>
				</th>
			</tr>
			<tr>
				<td class="line">
					배송중/배송완료
				</td>
				<td class="buttonarea">
					<button>배송조회</button><br>
					<button>판매확인</button>
				</td>
			</tr>
			</c:forEach>
		</table>
		</div>
	
<%@ include file="../footer.jsp" %>
</body>
</html>