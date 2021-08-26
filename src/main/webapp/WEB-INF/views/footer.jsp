<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="./include/includeFile.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*footer 폼*/
.footer{
	margin-top : 1200;
	width : 97%;
	bottom : 0;
    background : grey;
    display: flex;

    
}
.footer > div:first-child{

    flex: 3;
    color: white;
    text-align: center;
}
.footer > div:last-child{
    color: #fff;
    
    flex: 9;
}

.footer1{
	margin: auto;
}
.footer2{
	margin: auto;
}

</style>

</head>
<body>

	<footer class="footer">
			<div class="footer1">
				<h4 class="center"> 고객센터 </h4> <br>
				<h4> 1577-○○○○ </h4> <br>
				<h6> 평일 AM 09:00 ~ PM 06:00 / 주말, 공휴일 휴무</h6> <br>
				<h6> 점심 PM 12:00 ~ PM 01:00</h6> <br>
			</div>
			<div class="footer2">
				<h6> 주식회사 로고나 | 대표이사 : 로고나 | 사업자 등록번호 : 215-687-546678-565</h6>
				<h6> 서울시 로고구 여의로 452(몰라동) 삼성빌딩 8층 로고나 </h6>
				<h6> TEL : 1577-0000 | E-mail : rogona@rogona.co.kr</h6>
			</div>
		</footer>
	</div>

</body>
</html>