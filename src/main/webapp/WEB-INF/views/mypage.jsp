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
/*마이페이지 폼*/
.mypage{
	position : absolute;
	left: 330;
	top : 500;
	
}

/*주문관리 폼*/
.order{
	font-size: 30pt;
}
/*주문내역 조회*/
.buylist{
	margin-top: 30;
}
/*구매후기*/
.review{
	margin-top: 10;
}
/*장바구니*/
.cart{
	margin-top: 10;
}
/*1:1문의*/
.onetoone{
	margin-top: 10;
}
/*최근 본 상품*/
.lately{
	margin-top: 10;
}
/*계정 관리*/
.idmanagement{
	font-size: 30pt;
	margin-top: 30;
}
/*회원정보 변경*/
.edit{
	margin-top: 30;
}

/*회원정보 변경2*/
.btnmodify{
	border: none;
    outline:none;
}
.btndelete{
	margin-top: 10;
}
</style>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">

$(function() {
	//수정 버튼 눌렀을 때
	$('.btnmodify').click(function() {
		alert('수정폼');
		var userid = $(this).val();
		alert(userid);
		location.href = "${path}/guest/modify?userid=" + userid;	
		
	});
	$('.btndelete').click(function() {
		var result = confirm('정말 삭제하시겠습니까?');
		if (result){
			location.href='${path}/guest/delete?userid=${guest.userid}';	
		}
	});


});



</script>
</head>
<body>
<div class="mypage">
	<div class = "order"> 주문관리 </div>
	<div class="buylist"> <a href ="${path}/order/sdselect"> 주문 내역 조회 </a> </div>
	<div class="review">구매 후기</div>
	<div class="cart"> <a href="${path}/sellbox/boxlist"> 장바구니 </a> </div>
	<div class="onetoone"> <a href="${path}/ask/list"> 1:1문의 </a> </div>
	<div class="idmanagement"> 계정관리 </div>
	<div> <a class="btnmodify" href="${path}/guest/modify?userid=${guest.userid}"> 회원 수정 </a> </div>
	<div> <a class="btndelete" href="${path}/guest/delete?userid=${guest.userid}"> 회원 탈퇴 </a> </div>
	<c:choose>
	    <c:when test="${userid eq 'root'}">
	       <a href ="${path}/guest/list">회원 리스트</a>
	    </c:when>
	</c:choose>
</div>
</body>
</html>