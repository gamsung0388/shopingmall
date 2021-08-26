<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="./include/includeFile.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Header </title>
<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'ONE-Mobile-POP';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Wemakeprice-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Wemakeprice-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'ELAND_Choice_B';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_B.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'ELAND_Nice_M';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Nice_M.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'ELAND_Choice_L';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/ELAND_Choice_L.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/* 맨위 공지사항 / 문의사항 등.. 폼 */

.header{
	osition : fixed;
	margin-right : 50;
	
}

/*로고나 메인 사진/레터링*/
.logona{
	position : absolute;
	text-decoration-line: none;
	color : black;
	width: 540; 
	left : 300;
	height: 100;
	font-size : 60pt;
	font-family: 'Wemakeprice-Bold';

}
/*공지사항/로그인 등..상위 메뉴*/
.nav{
	font-family: 'ONE-Mobile-POP';
	osition : fixed;
	width : 600;
	height : 98;
	margin-left : 900;
	margin-right : 250;
	padding-top : 50;
	list-style: none; /*list 행으로 정렬*/
}
/*ul에 속해있는 공지사항 / 문의사항 등.. <li>*/
li{
	float: left;
	margin-left: 30;
}
/*li 안에 있는 공지사항 / 문의사항 */
li > a {
	text-decoration-line: none; /*하이퍼 링크 밑줄 제거*/
	font-size: 15pt;
	color: black;
	
}

/*상위메뉴 버튼 및 하위메뉴 설정 폼*/
.btntest{
	padding-bottom : 200;
	margin-left: 1100;
	margin-right: 80;
}
.Add{
    font-family: 'ELAND_Nice_M';
	background-color: white;
	color: black;
	padding: 16px;
	font-size: 16px;
	border: none;

}
.Add > a{
	text-decoration-line: none;
	color: black;
}
/*상위메뉴 버튼 설정 */
.dropbtn {

	background-color: white;
	color: black;
	padding: 16px;
	font-size: 16px;
	border: none;
    font-family: 'ELAND_Nice_M';
}
/*하위메뉴 버튼 설정*/
.dropdown {
	position: relative;
	display: inline-block;
	font-family: 'ELAND_Choice_B';
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}

</style>
<script type="text/javascript">



</script>
</head>
<body>

<div class="header">
		<ul class="nav">
			<li class="list"> <a href="${path}/notice/list">공지사항</a></li>
			<li class="list"> <a href="${path}/ask/list">문의사항</a></li>
			<c:choose>
			    <c:when test="${userid ne null}">
			        <li class="list"><a href ="${path}/guest/detail">${userid}님</a></li>
			    </c:when>
			    <c:otherwise>
			        <li class="list"> <a href="${path}/login">Login</a></li>
			    </c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test = "${userid ne null}">
				<li class="list"> <a href="${path}/guest/logout">Logout</a></li>
				</c:when>
				<c:otherwise>
			        <li class="list"> <a href="${path}/guest/join">Join</a></li>
			    </c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test = "${userid eq 'root'}">
					<li> <a href="${path}/product/add">상품추가</a></li>
				</c:when>
				<c:otherwise>
			    	<li> <a href="${path}/sellbox/boxlist">Cart</a></li>
			    </c:otherwise>
			</c:choose>
		</ul>                              
</div>
<span> <a class="logona" href = "${path}"> 로고나 쇼핑몰</a> </span>
<div class="btntest">
	<button class="Add"> <a href="${path}/product/list"> ALL</a> </button>
	<div class="dropdown">
	  <button class="dropbtn">Outer</button>
	  <div class="dropdown-content">
	    <a href="${path}/product/list?findkey=lname&findvalue=재킷">재킷</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=점퍼">점퍼</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=코트">코트</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=패딩">패딩</a>
	  </div>
	</div>

	<div class="dropdown">
	  <button class="dropbtn">TOP</button>
	  <div class="dropdown-content">
	    <a href="${path}/product/list?findkey=lname&findvalue=긴팔">긴팔</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=재킷">후드</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=후드">니트</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=맨투맨">맨투맨</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn">SHIRTS</button>
	  <div class="dropdown-content">
	    <a href="${path}/product/list?findkey=lname&findvalue=캐주얼 셔츠">캐주얼 셔츠</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=리넨 쳐츠">리넨 쳐츠</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=헨리넥">헨리넥</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=스프레드">스프레드</a>
	  </div>
	</div>
	<div class="dropdown">
	  <button class="dropbtn">PANTS</button>
	  <div class="dropdown-content">
	    <a href="${path}/product/list?findkey=lname&findvalue=반바지">반바지</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=트레이닝팬츠">트레이닝 팬츠</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=와이드팬츠">와이드 팬츠</a>
	    <a href="${path}/product/list?findkey=lname&findvalue=슬랙스">슬랙스</a>
	  </div>
	</div>
</div>

</body>
</html>