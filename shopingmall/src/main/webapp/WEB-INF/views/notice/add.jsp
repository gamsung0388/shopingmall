<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice add</title>

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
	padding: 10px;
	vertical-align: top;
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
	left:500;
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
</style>

<script type="text/javascript">
	//폼 로딩이 완료되었을 때
	$(function() {
		//목록으로 버튼을 클릭했을 때
		$('#btn1').click(function() {
			location.href="${path}/notice/list";
		});
		
		//등록하기 버튼을 클릭했을 때
		$('#btn2').click(function() {
			location.href="${path}/notice/add";
		});
		
		//plus 버튼을 클릭했을 때
		$('#btnPlus').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거하기
			//ol 태그에 li 태그를 추가
			$('#btnFiles').append('<li><input type="file" name="files" class="files">' +
					'<button id="btnMinus" class="btnMinus"><i class="fas fa-minus"></i></button></li>');
		});
		
		//동적으로 생성된 minus 버튼을 클릭했을 때
		$('#btnFiles').on('click', '.btnMinus', function(e) {
			e.preventDefault(); //기본 이벤트 제거하기
			$(this).parent().remove();
		});
		
		
	});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div align="center">
	<h2>공지글 작성하기</h2>
	</div>
	<form id="frmNoticeAdd" action="${path}/notice/add" method="post" enctype="multipart/form-data">
	<div align="center">
		<table class="table2">
			<tr>
				<th>작성자</th>
				<td><input type="text" id="userid" name="userid" size="10px" value="${sessionScope.userid}" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="subject" name="subject" size="50px"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="100" id="content" name="content"></textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>				
				<td> 
					<ol id="btnFiles"> 
						<li> 
							<input type="file" name="files" class="files">
							<button id="btnPlus"><i class="fas fa-plus"></i></button>
							<button id="btnMinus" class="btnMinus"><i class="fas fa-minus"></i></button>
						</li>					
					</ol>
				 </td>
			</tr>
		</table>
	</div>
	<div align="center">
		<table>
			<tr>
				<td id="btnList1">
					<button type="button" id="btn1" class="return">목록으로</button>	
				</td>
				<td id="btnList2">
				 	<button id="btn2" class="add1">등록하기</button>
				</td>
			</tr>
		</table>		
	</div>
	</form>
<%@ include file="../footer.jsp" %>
</body>
</html>