<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소분류 등록</title>
<script type="text/javascript">
$(function () {		
	$('#btnAdd').click(function() {
 		var lcode = $('#lcode').val();
		var lname = $('#lname').val();
		if (lcode==''){
			alert('소분류 코드를 입력해 주세요');
			$('#lcode').focus();
		}else if (lname==''){
			alert('소분류 이름을 입력해 주세요');
			$('#lname').focus();
		}else{
			$('#frmAdd').submit();
		}
		
	});
	
});
</script>
</head>
<body>
	<h2>소분류 등록</h2>
	<form name="frmAdd" id="frmAdd" action="${path}/little/add" method="post">
		<table>
			<tr>
				<th>소분류 코드</th>
				<td><input type="text" name="lcode" id="lcode"> </td>
			</tr>
			<tr>
				<th>소분류 이름</th>
				<td><input type="text" name="lname" id="lname"> </td>
			</tr>
			<tr>
				<th>대분류 이름</th>
				<td>
					<select name="bcode">
						<c:forEach var="big" items="${blist}">						
								<option value="${big.bcode}">${big.bname}</option>
						</c:forEach>
					</select>				
				</td>
			</tr>
			<tr>
				<td><button type="button" id="btnAdd">등록</button> </td>
			</tr>
		</table>
		
	
	</form>
<%@ include file="../footer.jsp" %>	
</body>
</html>