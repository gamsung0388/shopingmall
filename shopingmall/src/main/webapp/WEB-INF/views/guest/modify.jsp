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

/*join 자체 div 폼*/
.join{
	width : 580;
	padding-top: 50;
	padding-left: 600;
}
/*join "회원가입 입력"*/
.joinlogo{
	font-size: 50;
}
/*기준선*/
.hr{
	width: 300;
}
/*아이디 안내*/
.joinid{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 30;
	font-size: 20;
}
/*패스워드 안내*/
.joinpasswd{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*유저 이름 안내*/
.joinname{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 50;
	font-size: 20;
}
/*생일 안내*/
.joinbirth{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*이메일 안내*/
.joinemail{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 30;
	font-size: 20;
}
/*코드 안내*/
.joincode{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*전화번호 안내*/
.jointel{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*우편번호 안내*/
.joinzip{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*주소 안내*/
.joinaddr1{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 50;
	font-size: 20;
}
/*상세주소 안내*/
.joinaddr2{
    font-family: 'RixYeoljeongdo_Regular';
	margin-right : 10;
	font-size: 20;
}
/*유저 input 박스 입력란*/
/*아이디 입력란*/
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
/*패스워드 폼*/
.passwd{
	margin-top : 20;
}
/*패스워드 입력란*/
.password{
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*생년월일 폼*/
.birthday{
	margin-top : 20;
}
/*생년월일 입력란*/
.birth{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*전화번호 폼*/
.tel{
	margin-top : 20;
}
/*전화번호 입력란*/
.phone{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}


/*이름 폼*/
.name{
	margin-top : 20;
}
/*이름 입련란*/
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
/* 이메일 폼 */
.mail{
	margin-top : 20;
}
/*이메일 입력란*/
.email{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*인증코드 폼 */
.code{
	margin-top : 20;
}
/*인증코드 입력란*/
.emailcode{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*우편번호 폼*/
.zip{
	margin-top : 20;
}
/*우편번호 입력란*/
.zipp{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*주소 폼*/
.addr1{
	margin-top : 20;
}
/*주소 입력란*/
.addr11{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*상세주소 폼*/
.addr2{
	margin-top : 20;
}
/*상세주소 입력란*/
.addr22{
	font-family: 'KoPub Batang', serif;
	font-size : 20;
	width: 350px;
	height: 50px;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
}
/*버튼 모음*/
/*우편번호 조회 버튼*/
.btnzip{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	height: 30px;
	width: 100px;
}
.btnzip:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*가입 버튼*/
.btnudate{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	margin-top : 40;
	height: 50px;
	width: 500px;
}
.btnudate:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
</style>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
<script type="text/javascript">

function jusoCallBack(roadAddrPart1,addrDetail,zipNo){

	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
	document.frmGuestModify.zip.value = zipNo;
	document.frmGuestModify.addr1.value = roadAddrPart1;
	document.frmGuestModify.addr2.value = addrDetail;
	

}

function goPopup(){

	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	//controller를 호출해서 주소팝업 띄우기

var pop = window.open("${path}/guest/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

//메세지

if('${msg}' != ''){
	alert('${msg}');
}


$(function() {
	//저장 버튼을 눌렀을 때
	$('#btnudate').on('click',function(){
		var passwd = $('#passwd').val();
		if(passwd==''){
			alert('passwd입력');
		}else{
			$('#frmGuestModify').submit();
		}
			
		
		
	});
	

	
});

</script>
<%@ include file="../header.jsp" %>
<%@ include file="../mypage.jsp" %>
</head>
<body>

<div class = "join">

<form action="${path}/guest/modify"  name="frmGuestModify" id = "frmGuestModify" method="post">
	<h1 class = "joinlogo"> 회원정보 수정 </h1>

	<div class = "id">	
				<span class="joinid"> 아이디 </span>
				<input type="text" name="userid" id="userid" class="userid" value="${guest.userid}" readonly="readonly"> 

	</div>	
	<div class="passwd">	
		<span class="joinpasswd"> 비밀번호 </span>
		<input type="password" name= "passwd" id = "passwd" class = "password">	
	</div>
	<div class = "name">	
		<span class = "joinname"> 이름 </span> 
		<input type="text" name= "username" id = "username" class = "username" value="${guest.username}">		
	</div>
	<div class = "birthday">	
		<span class = "joinbirth"> 생년월일 </span>
		<input type="date" id = "birth" name = "birth" class="birth" value="${guest.birth}">
	</div>
	<div class = "mail">	
		<span class = "joinemail"> 이메일 </span>
		<input type="email" name="email" id="email" class="email" value="${guest.email}">
<%-- 		<input id="oldemail" type="hidden" value="${oldemail}"> 
		<button id="emailCheck" class="btnemail">이메일인증</button>  --%>
	</div>
<%-- 	<div class = "code">	
		<span class = "joincode"> 인증코드 </span>
		<input type="text" name= "emailcode" id = "emailcode" value="${emailcode}" class="emailcode"> 
		<button type="button" id="codeCheck" class="btncode"> 인증확인 </button>
		<input type="hidden" id="useemail"  value="${useemail}">
	</div> --%>
	<div class = "tel">	
		<span class = "jointel"> 전화번호 </span>
		<input type="text" name= "phone" id = "phone" class="phone" value="${guest.phone}">
	</div>
	<div class = "zip">	
		<span class = "joinzip"> 우편번호 </span>
		<input type="text" name= "zip" class="zipp" value="${guest.zip}"> 
		<button type="button" onclick="goPopup()" class="btnzip"> 우편번호 검색 </button>
	</div>
	<div class = "addr1">	
		<span class = "joinaddr1"> 주소 </span>
		<input type="text" name= "addr1" class="addr11"value="${guest.addr1}">	
	</div>
	<div class = "addr2">	
		<span class = "joinaddr2"> 상세주소 </span>
		<input type="text" name= "addr2" class="addr22" value="${guest.addr2}">
	</div>

	<button type="button" id="btnudate" class="btnudate">저장</button>


</form>
</div>



</form>

</body>
<%@ include file="../footer.jsp" %>
</html>