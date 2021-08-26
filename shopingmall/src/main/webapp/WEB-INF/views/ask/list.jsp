<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask list</title>

<style type="text/css">

/*검색 폼 */
.search{
	position : absolute;
	left: 350;
	top: 420;

}
.new{
	position : absolute;
	left: 50;
	width : 100;
}
/*문의사항 리스트 폼*/
.table{
	border-collapse: collapse;
	border-top: 3px solid #168;
	width: 1000;
}

/*문의사항 리스트*/
 .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
      border-color: gray;
    }
.table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
}
.table th:first-child, .table td:first-child {
      border-left: 0;
}
.table th:last-child, .table td:last-child {
      border-right: 0;
}
.table tr td:first-child{
      text-align: center;
}
.table caption{caption-side: bottom; display: none;}
</style>

<script type="text/javascript">
	//폼 로딩이 완료되었을 때
	$(function() {
 		//로그인 아이디가 root라면
 		if('${sessionScope.userid}' == 'root'){
			$('.passwd').show();
			$('.passwdName').show();
		}else{
			$('.passwd').hide();
			$('.passwdName').hide();
		}
		
		
		//작성하기를 클릭했을 때
		$('#write2').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			location.href='${path}/ask/add';
		});
		
		//하이퍼링크 페이지를 클릭했을 때
  		$('.pageList').click(function(e) {
  			e.preventDefault(); //기본 이벤트 제거
			var curPage = $(this).attr('href');
 			var findkey = $('#findkey').val();
			var findvalue = $('#findvalue').val();
			location.href = '${path}/ask/list?curPage=' + curPage + '&findkey=' + findkey + '&findvalue=' + findvalue;
  		});
		
		//제목을 클릭했을 때
		$('.listSubject').click(function(e) {
			e.preventDefault(); //기본 이벤트 제거
			var acode, passwd, passwdCheck;
			acode = $(this).attr('href');
			passwd = $('#passwd' + acode).text();
			passwdCheck = prompt('비밀번호를 입력해주세요!', '4자리');
			
			
			if(passwd != passwdCheck){
				alert('비밀번호를 다시 입력해주세요.');
  			}else if('${sessionScope.userid}' == ''){				
  				alert('로그인을 해주세요!');
  				location.href = '${path}/login';
  			}else {
				location.href = '${path}/ask/detail?acode=' + acode;   				
  			}
		});
		
	});
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div align="center">
		<h2>문의사항</h2>
	</div>
	<div align="center" class="search">
		<form action="${path}/ask/list">
			<select name="findkey" id="findkey">
				<option value="gubun" ${page.findkey =='gubun'?'selected':''}>구분</option>
				<option value="subject" ${page.findkey =='subject'?'selected':''}>제목</option>
				<option value="userid" ${page.findkey =='userid'?'selected':''}>작성자</option>
			</select>
			<input type="text" name="findvalue" id="findvalue" value="${page.findvalue}">
			<button id="search"><i class="fas fa-search"></i></button>
			<a href="" id="write2" class="new"><i class="fas fa-edit"></i>작성하기</a>	
		</form>
	</div>
	<div align="center">
		<table border="1" class="table">
			<tr>
				<th>순번</th>
				<th>구분</th>
				<th>제목</th>
				<th>작성자</th>
				<th id="passwdName" class="passwdName">비밀번호</th>
			</tr>
			<c:forEach var="askList" items="${alist}">
			<tr>
				<td style="padding: 5px 50px;">${askList.RN}</td>
				<td style="padding: 5px 50px;">${askList.GUBUN}</td>
				<td style="padding: 5px 50px;">
				<a href="${askList.ACODE}" class="listSubject">${askList.SUBJECT}</a>
				</td>
				<td style="padding: 5px 50px;">${askList.USERID}</td>
				<td id="passwd${askList.ACODE}" class="passwd">${askList.PASSWD}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<!-- 페이징처리 -->
	<div align="center">
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