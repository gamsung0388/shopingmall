<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세조회</title>
<style type="text/css">

/*상품 수정 폼*/
.productdetail{
	width: 1000;
	height: 600;
}


/*제품명 테이블*/
.productname{
	background: #F5F5F5;
	width : 200;
	height: 60;
}
/*제품가격 테이블*/
.productprice{
	background: #F5F5F5;
	height: 60;
}
/*제품색상 테이블*/
.productcolor{
	background: #F5F5F5;
	height: 60;
}
/*제품사이즈 테이블*/
.productsize{
	background: #F5F5F5;
	height: 60;
}
/*제품수량 테이블*/
.productcnt{
	background: #F5F5F5;
	height: 60;
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
.buybtn{
	margin-top : 50;
	margin-left : 50;
	height : 50;
	width : 100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.buybtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
.cartbtn{
	margin-top : 50;
	margin-left : 50;
	height : 50;
	width : 100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.cartbtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
.editbtn{
	margin-top : 50;
	margin-left : 50;
	height : 50;
	width : 100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.editbtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
.deletebtn{
	margin-top : 50;
	margin-left : 50;
	height : 50;
	width : 100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.deletebtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
.listbtn{
	margin-top : 50;
	margin-left : 50;
	height : 50;
	width : 100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.listbtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
</style>
<script type="text/javascript">

$(function() {
	//로그인 아이디가 관리자인 root라면
	if('${sessionScope.userid}' == 'root'){
			$('#btnUpdateForm').show();
			$('#btnDelete').show();
			$('#btnList').show();
	}else{
		$('#btnUpdateForm').hide();
		$('#btnDelete').hide();
		$('#btnList').hide();
	}
	
	//구매하기
	$('#btninsertSB').click(function(e) {
		e.preventDefault();
		var sellcnt = $('#sellcnt').val();
		if(sellcnt==''){
			alert("수량을 입력해주세요");
			$('#sellcnt').focus();
		}else{
			$('#productdetail').submit();
		}
		
	});
	//장바구니로
	$('#btnSellBox').click(function(e) {
		e.preventDefault();
		location.href = '${path}/sellbox/boxlist?pcode=${productMap.product.PCODE}';
	});
	//상품삭제
	$('#btnDelete').click(function(e) {
		e.preventDefault();
		location.href = '${path}/product/delete?pcode=${productMap.product.PCODE}';
	});
	//상품수정
	$('#btnUpdateForm').click(function(e){
		e.preventDefault();
		location.href = '${path}/product/modify?pcode=${productMap.product.PCODE}';
	});
	//상품리스트-상품 정보테이블로 보낸다.
	$('#btnList').click(function(e) {
		e.preventDefault();
		location.href ='${path}/product/list';
	});
	
});
</script>
</head>
<%@ include file="../header.jsp" %>
<body>
	<div align="center">
	<form action="${path}/sellbox/boxinsert" id="productdetail">
	<table  class="productdetail">
		<tr >
			<c:forEach var="productfile" items="${productMap.pflist}">
				<td rowspan="6">
					<img src="${path}/uploadimg/${productfile.fname}" width="100%" height="100%">
				</td>
			</c:forEach>	
			<th class="productname"> 제품명 </th>
			<td>
				<input type="hidden" name="pcode"  value="${productMap.product.PCODE}">
				${productMap.product.PNAME}
			</td>
		</tr>
		<tr>
			<th class="productprice">가격</th>
			<td>${productMap.product.PRICE}₩</td>			
		</tr>
		<tr>
			<th class="productcolor">색상</th>
			<td>
				<select>
					<c:forEach items="${productMap.product.PCOLOR}" var="pcolor">
						<option >${pcolor}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th class="productcolor">메이커</th>
			<td>
				${productMap.product.PMAKER}
			</td>
		</tr>
		<tr>
			<th class="productsize">사이즈</th>
			<td>
				<select>
					<c:forEach items="${productMap.product.PSIZE}" var="psize">
						<option>${psize}</option>
					</c:forEach>
				</select>
			</td>			
		</tr>
		<tr>
			<th class="productcnt">수량</th>
			<td>
				<input type="number" id="sellcnt" name="sellcnt" min="1" max="999">
			</td>
			
		</tr>
		
		<tr>
			<td colspan="4" align="center">
				<button id="btninsertSB" class="buybtn">구매하기</button>
				<button id="btnSellBox" class="cartbtn">장바구니</button>
				
				<!-- 관리자 아이디일경우에만 보임 -->
				<button id ="btnUpdateForm" class="editbtn">수정</button>
				<!-- <button id="btnDelete" class="deletebtn" hidden >삭제</button> -->
				<button id="btnList" class="listbtn" >조회</button>
			</td>
		</tr>
	</table>
	</form>
	
	<%-- <ol id="filelist">
		<c:forEach var="productfile" items="${productMap.pflist}">
			<li>${productfile.fname}</li><br>
			<th><img src="${path}/uploading/${productfile.fname}" width="100"></th>						
		</c:forEach>
	</ol> --%>
	</div>
<%@ include file="../footer.jsp" %>									
</body>
</html>