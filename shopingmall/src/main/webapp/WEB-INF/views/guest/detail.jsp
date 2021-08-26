<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../include/includeFile.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'RixYeoljeongdo_Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2102-01@1.0/RixYeoljeongdo_Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@import url(//fonts.googleapis.com/earlyaccess/kopubbatang.css);

.kopubbatang * {
	font-family: 'KoPub Batang', serif;
}

/*detail 자체 div 폼*/
.detail{
	padding-top: 40;
	padding-left: 600;
}
/* detail logo*/
.detaillogo{
	font-size: 50;
}
/*아이디 안내*/
.detailid{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 30;
	font-size: 20;
}
/*아이디값*/
.userid{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 이름 폼 */
.name{
    font-family: 'RixYeoljeongdo_Regular';
	margin-top : 20;
}

/*유저 이름 안내*/
.detailname{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 50;
	font-size: 20;
}
/*유저 아이디값*/
.username{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 생년월일 폼 */
.birth{
	margin-top : 20;
}

/*생일 안내*/
.detailbirth{

    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 50;
	font-size: 20;
}

/*생년월일 값*/
.userbrith{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 이메일 폼 */
.email{

	margin-top : 20;
}
/*이메일 안내*/
.detailemail{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 30;
	font-size: 20;
}
/*이메일 값*/
.useremail{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 전화번호 폼 */
.phone{
	margin-top : 20;
}
/*전화번호 안내*/
.detailphone{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*전화번호 값*/
.userphone{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 우편번호 폼 */
.zip{
	margin-top : 20;
}
/*우편번호 안내*/
.detailzip{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*우편번호 값*/
.userzip{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 도로명 폼 */
.addr1{
	margin-top : 20;
}
/*도로명 안내*/
.detailaddr1{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 30;
	font-size: 20;
}
/*도로명 값*/
.useraddr1{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 상세주소 폼 */
.addr2{
	margin-top : 20;
}
/*상세주소 안내*/
.detailaddr2{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*상세주소 값*/
.useraddr2{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/* 가입날짜 폼 */
.regdate{
	margin-top : 20;
}
/*가입날짜 안내*/
.detailregdate{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*가입날짜 값*/
.userregdate{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
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
	$('#btndelete').click(function() {
		var result = confirm('정말 삭제하시겠습니까?');
		if (result){
			location.href='${path}/guest/delete?userid=${guest.userid}';	
		}
	});


});



</script>
<%@ include file="../header.jsp" %>
<%@ include file="../mypage.jsp" %>
</head>

<body>

<div class="detail">
	<h1 class = "detaillogo">회원 상세정보</h1>
	<div class="id"> 
		<span class="detailid">아이디</span> 
		<input class="userid" value="${userid}" readonly="readonly"> 
	</div>
	<div class="name">
		<span class="detailname">이름</span>
		<input class="username" type="text" value="${guest.username}"readonly="readonly">
	</div>
	<div class="birth">
		<span class="detailbirth">생일</span>
		<input class="userbrith" type="text" value="${guest.birth}"readonly="readonly">
		
	</div>
	<div class="email">
		<span class="detailemail">이메일</span>
		<input class="useremail" type="text" value="${guest.email}"readonly="readonly">
		
	</div>
	<div class="phone">
		<span class="detailphone">전화번호</span>
		<input class="userphone" type="text" value="${guest.phone}"readonly="readonly">
		
	</div>
	<div class="zip">
		<span class="detailzip">우편번호</span>
		<input class="userzip" type="text" value="${guest.zip}"readonly="readonly">
	</div>
	<div class="addr1">
		<span class="detailaddr1">도로명</span>
		<input class="useraddr1" type="text" value="${guest.addr1}"readonly="readonly">
	</div>
	<div class="addr2">
		<span class="detailaddr2">상세주소</span>
		<input class="useraddr2" type="text" value="${guest.addr2}"readonly="readonly">
	</div>
	<div class="regdate">
		<span class="detailregdate">가입 일자</span>
		<input class="userregdate" type="text" value="${guest.regdate}"readonly="readonly">
	</div>

</div>


<%@ include file="../footer.jsp" %>


</body>

</html>