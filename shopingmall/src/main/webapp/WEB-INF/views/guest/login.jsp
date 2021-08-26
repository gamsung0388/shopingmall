<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="../include/includeFile.jsp" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="./style.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

<style type="text/css">

a {
    color: #333;
    text-decoration: none;
}
input {
    -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    color: initial;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    -webkit-appearance: textfield;
    background-color: white;
    -webkit-rtl-ordering: logical;
    cursor: text;
    margin: 0em;
    font: 400 13.3333px Arial;
    padding: 1px 0px;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
}


.inner_login {
    position: absolute;
    left: 48%;
    top: 50%;
    margin: -145px 0 0 -160px;
}

.screen_out{
	font-size: 35px;
}


.login_tistory .box_login {
    margin: auto;
    border: 1px solid #ddd;
    border-radius: 3px;
    /* box-sizing: border-box; */
    width: 400;
}
.login_tistory .inp_text {
    position: relative;
    width: 100%;
    margin: 0;
    padding: 18px 19px 19px;
    box-sizing: border-box;
}
.login_tistory .inp_text+.inp_text {
    border-top: 1px solid #ddd;
}
.inp_text input {
    display: block;
    width: 100%;
    height: 100%;
    font-size: 20px;
    color: #000;
    border: none;
    outline: 0;
    -webkit-appearance: none;
    background-color: transparent;
}
.btn_login {
    margin: 20px 0 0;
    width: 100%;
    height: 48px;
    
    border-radius: 3px;
    font-size: 16px;
    color: #fff;
    background-color: #000;
}

</style>


<script type="text/javascript">
$(function() {
	//메시지 
	if ('${resultMap.msg}' != ''){
		alert('${resultMap.msg}');
	}
	
	
	//회원가입버튼을 클릭했을때
	$('#btnJoin').click(function(e) {
		e.preventDefault();
		location.href = '${path}/guest/join';
	});
	
	//로그인 버튼을 클릭했을때
	$('#btnLogin').click(function() {
		if ($('#userid').val() == ''){
			alert('아이디를 입력해주세요');
			$('#userid').focus();
		} else if ($('#passwd').val() == ''){
			alert('비밀번호를 입력해주세요');
			$('#passwd').focus();
		}else {
			$('#frmLogin').submit();
		};
		
	});
	
	
});




</script>
<%@ include file="../header.jsp" %>

</head>

<div class = "inner_login">
	<div class="login_tistory">

		<form class= "frmLogin" id ="frmLogin" action="${path}/guest/login" method="post">
		<fieldset>
		<legend class="screen_out" id = "screen"> 로그인 </legend>
		<div class="box_login">
			<div class  = "inp_text">
			<label for="loginId" class="screen_out">아이디</label>
			<input type="text" name="userid" id ="id" placeholder="ID">
			</div>
			<div class  = "inp_text">
			<label for="loginPw" class="screen_out">패스워드</label>
			<input type="password" name="passwd" id ="pw" placeholder="PW">
			</div>
		</div>
			<button type="button" id="btnLogin" class = "btn_login">로그인</button>
		 </div>
        </div>

</fieldset>



</form>



</body>
<%@ include file="../footer.jsp" %>
</html>