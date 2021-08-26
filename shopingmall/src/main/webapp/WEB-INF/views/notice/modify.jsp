<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지글 수정하기</title>

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
.edit{
	position: absolute;
	right : 460;
	height: 30px;
	width: 100px;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.edit:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
</style>
<script type="text/javascript">
	//폼 로딩이 완료되었을 때
	$(function() {
		
		//수정하기 버튼을 클랙했을 때
		$('#btnModify').click(function(e) {
			e.preventfault(); //기본 이벤트 제거
			if($('#subject').val() == ''){
				alert('제목을 입력해주세요!');
				$('#subject').focus();
			}else if($('#content').val() == ''){
				alert('내용을 입력해주세요!');
				$('#content').focus();
			}else {
				$('#frmModify').submit();
			}		
		});
		
		//plus 버튼을 클릭했을 때
		$('#btnPlus').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거하기
			$('#btnFiles').append('<li><input type="file" name="files" class="files">' +
					'<button id="btnMinus" class="btnMinus"><i class="fas fa-minus"></i></button></li>');
		});
		
		//minus 버튼을 클릭했을 때
		//동적으로 생성된 버튼에 이벤트 달기
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
		<h2>공지글 수정하기</h2>
	</div>
	<form id="frmModify" action="${path}/notice/modify" method="post" enctype="multipart/form-data">
	<div align="center">
		<table class="table2">
			<tr>
				<th>작성자</th>
				<td>
				<input type="hidden" name="ncode" value="${nMap.notice.ncode}">
				<input type="text" name="userid" value="${sessionScope.userid}" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" id="subject" name="subject" size="50px" value="${nMap.notice.subject}"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="100" id="content" name="content">${nMap.notice.content}</textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>				
					<td>
						<c:forEach var="noticefile" items="${nMap.nflist}">
							<i class="fas fa-times" style="color: red;"></i><input type="checkbox" name="fileDelete" value="${noticefile.fcode}">${noticefile.fname}<br>
						</c:forEach>
						<ol id="btnFiles"> 
							<li> 
								<input type="file" name="files" class="files">
								<button id="btnPlus"><i class="fas fa-plus"></i></button>
								<button id="btnMinus" class="btnMinus" ><i class="fas fa-minus"></i></button>
							</li>					
						</ol>
				 </td>
			</tr>
		</table>
		<button id="btnModify" class="edit">수정하기</button>					
	</div>
	</form>
<%@ include file="../footer.jsp" %>
</body>
</html>