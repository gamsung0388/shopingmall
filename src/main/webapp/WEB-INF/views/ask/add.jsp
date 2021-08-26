<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask add</title>
<style type="text/css">
.table2{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin : 20px 10px;
}
.table2 tr{
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.table2 td {
	width: 100px;
	padding: 25px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.table2 th {
	width: 100px;
	padding: 20px;
	border-bottom: 1px solid #ccc;
}
/*버튼 모음*/

button:hover {

	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
.return{
	height: 30px;
	width: 100px;
	position: absolute;
	left:1000;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}
.add1{
	
	height: 30px;
	width: 100px;
	position: absolute;
	left:1150;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}
select {
width: 200px; /* 원하는 너비설정 */ 
padding: .8em .5em; /* 여백으로 높이 설정 */ 
font-family: inherit; /* 폰트 상속 */ 
background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ 
-webkit-appearance: none; /* 네이티브 외형 감추기 */ 
-moz-appearance: none; 
appearance: none; 
}


</style>
<script type="text/javascript">
	//폼 로딩이 완료되었을 때
	$(function() {
		//plus 버튼을 클릭했을 때
		$('#btnPlus').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			//ol 태그에 li 태그를 추가
			$('#askFiles').append('<li><input type="file" id="files" name="files">' +
					'<button id="btnMinus" class="btnMinus"><i class="fas fa-minus"></i></button></li>');
		});
		//동적으로 생성된 minus 버튼을 클릭했을 때
 		$('#askFiles').on('click', '.btnMinus', function(e) {

			e.preventDefault(); //기본 이벤트 제거
			//this: 인스턴스 자신을 자리키는 키워드
			$(this).parent().remove();
		});

		
		//목록으로 버튼을 클릭했을 때
		$('#btn1').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			location.href="${path}/ask/list";
		});
		
		//등록 버튼을 클릭했을 때
		$('#btnAskAdd').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			//제목을 입력하지 않았다면
			if($('#subject').val() == ''){
				alert('제목을 입력해주세요!');
				$('#subject').focus();
			//내용을 입력하지 않았다면
			}else if($('#content').val() == ''){
				alert('내용을 입력해주세요!');
				$('#content').focus();
			}else if($('#passwd').val() == ''){
				alert('비밀번호를 입력해주세요!');
				$('#passwd').focus();
			}else{
				$('#frmAdd').submit();
			}
		});
		

	});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div align="center">
		<h2>문의사항 등록</h2>
	</div>
	<!-- ${path}/ask/add method="post" enctype="multipart/form-data"-->
	<form id="frmAdd" action="${path}/ask/add" method="post" enctype="multipart/form-data">
		<div align="center">
			<table  class="table2">
				<tr>
					<th style="width: 70px;">분류</th>
					<td style="width: 70px; text-align: center;">
						<select id="gubun" name="gubun">
							<option id="deliver">배송</option>
							<option id="order">주문</option>
							<option id="product">상품</option>
							<option id="payment">결제</option>
							<option id="other">기타</option>
						</select>
					</td>
					<th style="width: 100px;">작성자</th>
					<td> 
					<input type="text" id="userid" name="userid" style="border:0 solid black" value="${sessionScope.userid}" readonly size="29px">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
						<input type="text" style="border:0 solid black" id="subject" name="subject" size="57px">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea rows="10" cols="60" id="content" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td colspan="3">
						<ol id="askFiles">
							<li>
								<input type="file" id="files" name="files">
								<button id="btnPlus"><i class="fas fa-plus"></i></button>
								<button id="btnMinus" class="btnMinus" ><i class="fas fa-minus"></i></button>
							</li>
						</ol> 

					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3"> <input type="password" id="passwd" name="passwd" maxlength="4"> </td>
				</tr>
			</table>
			<button id="btn1" class="return">목록으로</button>
			<button id="btnAskAdd" class="add1">등록하기</button>
		</div>
	</form>
	
<%@ include file="../footer.jsp" %>
</body>
</html>