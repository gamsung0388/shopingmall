<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice detail</title>

<style type="text/css">


/*게시글 폼*/
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
.table2 td{
	width: 25px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
}
.table2 th {
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.title1{
	background: #F5F5F5;
}
.title2{
	background: #F5F5F5;
}
.title3{
	background: #F5F5F5;
}
/*버튼 모음*/
button{

	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;

}
button:hover {

	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*리턴버튼*/
.return{
	height: 30px;
	width: 100px;
	position: absolute;
	left:500;
	
}
/*삭제버튼*/
.delete{
	height: 30px;
	width: 100px;
	position: absolute;
	right: 600;
}
/*수정버튼*/
.edit{
	position: absolute;
	right : 490;
	height: 30px;
	width: 100px;
}
</style>

<script type="text/javascript">
	//폼 로딩이 완료되었을 때
	$(function() {
		//로그인 아이디가 root라면
 		if('${sessionScope.userid}' == 'root'){
			$('#btnModify').show();
			$('#btnDelete').show();
		}else{
			$('#btnModify').hide();
			$('#btnDelete').hide();
		}
		
		//목록으로 버튼을 클릭했을 때
		$('#btn1').click(function() {
			location.href="${path}/notice/list";
		});
		
		//파일다운로드 아이콘을 클릭했을 때
		$('.FileDownload').click(function(e) {
			e.preventDefault(); //form 안에 있다면 기본 이벤트 제거하기
			var filename = $(this).val(); //파일 이름
			location.href='${path}/notice/filedownload?filename=' + filename;
		});
		
		//수정하기 버튼을 클릭했을 때
		$('#btnModify').click(function() {
			var ncode = ${nMap.notice.ncode};
			location.href="${path}/notice/modify?ncode=" + ncode;
		});
		
		//삭제하기 버튼을 클릭했을 때
		$('#btnDelete').click(function() {
			var ncode = ${nMap.notice.ncode};
			location.href="${path}/notice/delete?ncode=" + ncode;
		});
	});

</script>
</head>
<body>
<%@ include file="../header.jsp" %>

	<div align="center">
		<table class="table2" >
			<tr class="title">
				<td align="center" class="title1"> 게시글 </td>
				<th colspan="2" align="left">${nMap.notice.subject}</th>
			</tr>
			<tr class="writer">
				<td align="center" class="title2">작성자</td>
				<th colspan="2" align="left"> ${nMap.notice.userid} </th>
			</tr>
			<tr class="readcnt">
				<td align="center" class="title3">조회수 ${nMap.notice.readcnt} </td>
				<td align="left" id="date" class="date"><fmt:formatDate value="${nMap.notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			</tr>
			<tr>
				<td colspan="2"> <textarea rows="20" cols="100" readonly="readonly" class="subject">${nMap.notice.content}</textarea> </td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<c:forEach var="noticefile" items="${nMap.nflist}">
						${noticefile.fname}
						<button id="FileDownload" class="FileDownload" value="${noticefile.fname}"><i class="fas fa-download"></i></button><br>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<div align="center">
		<button id="btn1" class="return">목록으로</button>
		<button id="btnModify" style="margin-left: 460px;"class="edit">수정하기</button>
		<button id="btnDelete" class="delete">삭제하기</button>
	</div>
<div align="center">
	</div>
	<div id="answerAdd" hidden="" align="center">
		<input type="hidden" id="reStep" value="0">
		<input type="hidden" id="reLevel" value="0">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" id="ansUserid" name="ansUserid" value="${sessionScope.userid}" readonly size="35px"></td>
				<th>등록일자</th>
				<td>
				<input type="text" id="ansRegdate" name="ansRegdate" value="<fmt:formatDate value="${aMap.ask.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly size="35px">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3"><textarea rows="20" cols="90" id="ansContent" name="ansContent"></textarea></td>
			</tr>
		</table>
		<button id="btnAdd" style="margin-left: 620px;margin-top: 10px;">등록</button>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>