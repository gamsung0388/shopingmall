<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소분류 리스트</title>
<script type="text/javascript">
$(function () {		
	$('.aList').click(function(e) {
		
		e.preventDefault();
		var curPage = $(this).attr('href');
		var findkey = $('#findkey').val();
		var findvalue = $('#findvalue').val();
		location.href = '${path}/little/list?curPage='+curPage+'&findkey='+findkey+'&findvalue='+findvalue ;
	});
	
	
	
	$('#btnDelete').click(function() {
		location.href ='/my/little/delete?lcode=${little.LCODE}';
	});	
});
</script>
</head>
<body>
	<h2>소분류 리스트</h2>
		<form action="${path}/little/list">
		<select name="findkey" id="findkey">
			<option value="bname" ${page.findkey=='bname'?'selected':''}>대분류 이름</option>
			<option value="lname" ${page.findkey=='lname'?'selected':''}>소분류 이름</option>
			<option value="bcode" ${page.findkey=='bcode'?'selected':''}>대분류 코드</option>
			<option value="lcode" ${page.findkey=='lcode'?'selected':''}>소분류 코드</option>
		</select>
		<input type="text" name = "findvalue"  id="findvalue" maxlength="10"  value="${page.findvalue}">
		<input type="hidden" name="curPage" value="1">
		<button>조회</button> 
	</form>	
	<form name="frmList" id="frmList" action="${path}/little/list" method="post">
		<table border="1">
			<tr>
				<th>대분류 이름</th>
				<th>대분류 코드</th>
				<th>소분류 이름</th>
				<th>소분류 코드</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="little" items="${llist}">
				<tr>			
					<td>${little.BNAME}</td>		
					<td>${little.BCODE}</td>
					<td>${little.LNAME}</td>
					<td>${little.LCODE}</td>
					<td><a href="/my/little/delete?lcode=${little.LCODE}">삭제</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<hr>
	<c:if test="${page.startPage != 1}">
		<a href="${page.startPage-1}" class="aList" >이전</a>
	</c:if>
	
	<c:forEach  var="i"  begin="${page.startPage}" end="${page.endPage}">
		<c:if test="${page.curPage==i}">
			<a href="${i}" class="aList" id="aCurPage">${i}</a>
		</c:if>
		<c:if test="${page.curPage!=i}">
			<a href="${i}" class="aList" >${i}</a>
		</c:if>
		
	</c:forEach>
	<c:if test="${page.totPage > page.endPage}">
		<a href="${page.endPage+1}" class="aList" >다음</a>
	</c:if>	
<%@ include file="../footer.jsp" %>	
</body>
</html>