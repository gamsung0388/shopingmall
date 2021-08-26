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

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

<style type="text/css">
@font-face {
    font-family: 'BMJUA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
table{
	width: 1400;
	font-size: 15pt
}
/*페이지 제목*/
.listtitle{
	margin-left: 240;
}
/*리스트 폼*/
.guestlist{
	margin: auto;
}
/*맨 상단 한글제목*/
.koreaname{
	background: #F5F5F5;
}
td{
	border-bottom: 2px solid #ccc;
	font-family: 'BMJUA';
}


</style>

<script type="text/javascript">
	
$(function() {
	
	//수정 버튼 눌렀을 때
	$('.btndetail').click(function() {
		alert('디테일');
		var userid = $(this).val();
		alert(userid);
		location.href = "${path}/guest/detail?userid=" + userid;	
		
	});
	
});

</script>

</head>
<body>
<%@ include file="../header.jsp" %>
<h1 class="listtitle"> 로고나 회원 리스트 </h1>



<table class="guestlist">
	<tr class="koreaname" align="center">
		<td> 아이디 </td>
		<td> 이름 </td>
		<td> 생년월일 </td>
		<td> 이메일 </td>
		<td> 전화번호 </td>
		<td> 우편번호 </td>
		<td> 도로명 주소 </td>
		<td> 상세주소 </td>
		<td> 가입일자 </td>
		<td> </td>
	</tr>
		<c:forEach var="guest" items="${glist}">
	<tr align="center">
		<td class="idlist">${guest.userid} </td>
		<td>${guest.username} </td>
		<td>${guest.birth} </td>
		<td>${guest.email} </td>
		<td>${guest.phone} </td>
		<td>${guest.zip} </td>
		<td>${guest.addr1} </td>
		<td>${guest.addr2} </td>
		<td>${guest.regdate} </td>
	</tr>
</c:forEach>
</table>
	








</body>
<%@ include file="../footer.jsp" %>
</html>