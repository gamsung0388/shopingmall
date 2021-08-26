<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice list</title>

<style type="text/css">

/*공지사항 폼*/
.table{
	width : 1000;
	border-collapse: collapse;
	border-top: 3px solid #168;
}
/*공지사항 리스트 폼*/
.table1{
	
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 1000;
}

/*공지사항 리스트*/
 .table1 th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
.table1 th, .table1 td {
      padding: 10px;
      border: 1px solid #ddd;
}
.table1 th:first-child, .table1 td:first-child {
      border-left: 0;
}
.table1 th:last-child, .table1 td:last-child {
      border-right: 0;
}
.table1 tr td:first-child{
      text-align: center;
}
.table1 caption{caption-side: bottom; display: none;}

</style>

<script type="text/javascript">
	//폼이 로딩 되었을 때
 	$(function() {
 		//로그인 아이디가 root라면
 		if('${sessionScope.userid}' == 'root'){
			$('#write').show();
		}else{
			$('#write').hide();
		}
 		
		//작성하기를 클릭했을 때
		$('#write').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			location.href='${path}/notice/add';
		});
 		
  		//하이퍼링크 페이지를 클릭했을 때
  		$('.pageList').click(function(e) {
  			e.preventDefault(); //기본 이벤트 제거
			var curPage = $(this).attr('href');
			var findkey = $('#findkey').val();
			var findvalue = $('#findvalue').val();
			location.href = '${path}/notice/list?curPage=' + curPage + '&findkey=' + findkey + '&findvalue=' + findvalue;
		});
  		
  		//제목을 클릭했을 때
  		$('.listSubject').click(function(e) {
  			e.preventDefault(); //기본 이벤트 제거
  			if('${sessionScope.userid}' == ''){
  				alert('로그인을 해주세요!');
  				location.href = '${path}/login';
  			}else{
				var ncode = $(this).attr('href');
				location.href = '${path}/notice/detail?ncode=' + ncode; 				
  			}
		});
	});
</script>
</head>
<body>
<%-- ${page} --%>
<%@ include file="../header.jsp" %>
	<div id="listTile">
		<h2>공지사항</h2>
	</div>
	<br>
	<div align="center">
		<table class="table">
			  <tr id="trList" style="font-size: 14px">
			    <td id="tdList1">
				    <span style="font-weight: bolder;">고객센터</span><br>
					<span style="font-weight: bolder;">02-8613-2063</span><br>
					<span>평일 Am 9:00 ~ Pm 6:00 / 점심시간 Pm 1:00 ~ 2:00</span><br>
					<span>주말,공휴일 휴무</span><br>
			    </td>
			    <td id="tdList2">
			    	<span style="font-weight: bolder;">실시간 문의</span><br>
					<span style="font-weight: bolder;">카카오톡 친구추가: dontaddme</span> <br>
					<span>평일 Am 9:00 ~ Pm 6:00 / 점심시간 Pm 1:00 ~ 2:00</span><br>
					<span>주말,공휴일 휴무</span><br>
			    </td>
			  </tr>
		</table>
	</div>
	<br>
	<div align="center">
		<form action="${path}/notice/list">
			<select name="findkey" id="findkey">
				<option value="subject" ${page.findkey =='subject'?'selected':''}>제목</option>
				<option value="userid" ${page.findkey =='userid'?'selected':''}>작성자</option>
			</select>
			<input type="text" name="findvalue" id="findvalue" value="${page.findvalue}" size="50px">
			<button id="search"><i class="fas fa-search"></i></button>
			<a href="" id="write"><i class="fas fa-edit"></i>작성하기</a>	
		</form>
	</div>
	
	<div align="center">
		<table style="text-align: center;" class="table1" >
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>작성자</th>
			</tr>
			<c:forEach var="noticeList" items="${nlist}">
				<tr>
					<td style="padding: 5px 50px;">${noticeList.RN}</td>
					<td style="padding: 5px 100px;"><a href="${noticeList.NCODE}" class="listSubject">${noticeList.SUBJECT}</a></td>
					<td style="padding: 5px 50px;">${noticeList.USERID}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이징 처리 -->
	<div class="page" align="center">
 		<c:if test="${page.startPage != 1}">
			<a href="${page.startPage-1}" class="pageList">&laquo;</a>	
		</c:if>
		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}" step="1">
				<c:if test="${page.curPage == i}">
					<a href="${i}" class="pageList" id="curPage">${i}</a>
				</c:if>			
				<c:if test="${page.curPage != i}">
					<a href="${i}" class="pageList">${i}</a>
				</c:if>
		</c:forEach>
		<c:if test="${page.totPage > page.endPage}">
			<a href="${page.endPage+1}" class="pageList">&raquo;</a>	
		</c:if>
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>