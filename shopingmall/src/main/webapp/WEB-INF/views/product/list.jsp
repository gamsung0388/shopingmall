<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 조회</title>

<style type="text/css">
/*폰트*/
/*폰트*/
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
#plist{
    font-family: 'EliceDigitalBaeum_Bold';
}
.float {
	float: left;
}
#plist_page{
	overflow: auto;
	clear: both;
	margin: auto;
	width: 100;
}

/*상품 리스트 검색*/
#divProductList{
    position: absolute;	
    top : 250;
    left: 80;
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
input{
	width: 200px; /* 원하는 너비설정 */ 
	padding: .8em .5em; /* 여백으로 높이 설정 */ 
	font-family: inherit; /* 폰트 상속 */ 
	border-left: none;
	border-top: none;
	border-right: none;	
	font-size : 10pt;
}
</style>
<script type="text/javascript">
$(function() {
		$('.aList').click(function(e) {
			e.preventDefault();
			var curPage = $(this).attr('href');
			var findkey = $('#findkey').val();
			var findvalue = $('#findvalue').val();
			location.href = '${path}/product/list?curPage='+curPage+'&findkey='+findkey+'&findvalue='+findvalue ;
		});
		$('.aPname').click(function(e) {
			e.preventDefault();
			var pcode = $(this).attr('href');
			location.href = '${path}/product/detail?pcode='+pcode;
		});
	});
</script>
</head>
<%@ include file="../header.jsp" %>
<body>
<div>
	<div id="divProductList">
		<h2>상품 검색</h2>
		<form action="${path}/product/list">
			<select name="findkey" id="findkey">
				<option value="pname" ${page.findkey=='pname'?'selected':''}>상품명</option>
				<option value="pcode" ${page.findkey=='pcode'?'selected':''}>상품코드</option>
				<option value="pmaker" ${page.findkey=='pmaker'?'selected':''}>제조사</option>
				<option value="bname" ${page.findkey=='bname'?'selected':''}>대분류</option>
				<option value="lname" ${page.findkey=='lname'?'selected':''}>소분류</option>
			</select>
			<input type="text" name = "findvalue"  id="findvalue" maxlength="10"  value="${page.findvalue}">
			<input type="hidden" name="curPage" value="1">
			<button>조회</button> 
		</form>
	</div>
	
	
		<c:forEach var="product" items="${plist}">
			<div id="plist">
				<ol class="icons"> 
					<li> 
						<div class="float"> 
							<a href="${path}/product/detail?pcode=${product.PCODE}"><img src="${path}/uploadimg/${product.FNAME}" alt=""height="250px" width="290px"></a>          
						</div> 
						<div class="contents1_bold"><a href="${path}/product/detail?pcode = ${product.PCODE}" class="aPname">${product.PNAME}</a></div>
						<div class="price">  ${product.PRICE}₩    </div>
		 			</li>
				</ol>
			</div>
			</c:forEach>
	<div id="plist_page">
		<div class="float">
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
		</div>
	</div>	
		
	</div>

<%-- 	${page}  --%>
	
<%@ include file="../footer.jsp" %>	
</body>
</html>