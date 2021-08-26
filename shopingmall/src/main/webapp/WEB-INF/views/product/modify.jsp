<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<style type="text/css">
/*상품등록 글씨*/
.proadd{
	position: absolute;
	left : 500;
	width : 260;
	font-size: 25pt;
}
/*상품 등록 테이블 폼*/
.productadd{
	position: absolute;
	left : 500;
	top : 500;
	width: 800;
	border-bottom: 2px solid gray;
	border-top: 2px solid gray;
	border-right: 2px solid gray;
	border-left: 2px solid gray;
}
table th{
	background: #F5F5F5;
	width: 100;
	height: 50;
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
	font-size : 20pt;
	border-left: none;
	border-top: none;
	border-right: none;
}
button{

	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;

}
button:hover {

	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
#btnUpdate{
	position: absolute;
	top : 1030;
	left: 500;
	width: 100;
	height: 30;
}
</style>

<script type="text/javascript">
	$(function () {		
		//파일추가버튼
		$('#btnFileAdd').click(function(e) {
			e.preventDefault();
			$('#filelist').append('<li><input type="file" name="files" class="files"><button class="btnFileRemove">삭제</button></li>');
			
		});
		//파일삭제버튼
		$('#filelist').on('click','.btnFileRemove', function(e) {
			e.preventDefault();
			$(this).parent().remove();
		});
		
		
		$('#btnUpdate').click(function() {
	 		var pname = $('#pname').val();
			var pcode = $('#pcode').val();
			var pmaker = $('#pmaker').val();
			var price = $('#price').val();
			var psize = $('#psize').val();
			var bcode = $('#bcode').val();
			var lcode = $('#lcode').val();
			var pcolor = $('#pcolor').val();
			if (pname==''){
				alert('상품명을 입력해 주세요');
				$('#pname').focus();
			}else if (pcode==''){
				alert('상품코드를 입력해 주세요');
				$('#pcode').focus();
			}else if (pmaker==''){
				alert('제조사를 입력해 주세요');
				$('#pmaker').focus();
			}else if (price==''){
				alert('가격을 입력해 주세요');
				$('#price').focus();
			}else if ($(':input:radio[name="psize"]:checked').length<1){
				alert('사이즈를 선택해 주세요');
				$('#psize1').focus();
			}else if (bcode==''){
				alert('대분류를 선택해 주세요');
				$('#bcode').focus();
			}else if (lcode==''){
				alert('소분류를 선택해 주세요');
				$('#lcode').focus();
			}else if (pcolor==''){
				alert('색상을 입력해 주세요');
				$('#pcolor').focus();
			}else{
				$('#frmProductUpdate').submit();
			}
			
		});
		
	});
</script>
</head>
<%@ include file="../header.jsp" %>
<body>
	<h2 class="proadd">상품 수정</h2>
	<form id="frmProductUpdate" action="${path}/product/modify" method="post" enctype="multipart/form-data">
		<table class="productadd"> 
			<tr>
				<th>상품명</th>
				<td><input type="text" name="pname" id="pname" value="${productMap.product.PNAME}"> </td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><input type="text" name="pcode" id="pcode" value="${productMap.product.PCODE}"> </td>
			</tr>
			<tr>
				<th>제조사</th>
				<td><input type="text" name="pmaker" id="pmaker" value="${productMap.product.PMAKER}"> </td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="number" name="price" id="price" value="${productMap.product.PRICE}"></td>
			</tr>
			<tr>
				<th>사이즈</th>
				<td>
					<input type="radio" id= "psize1" name="psize" value="SS">SS
					<input type="radio" id= "psize2" name="psize" value="S">S
					<input type="radio" id= "psize3" name="psize" value="M">M
					<input type="radio" id= "psize4" name="psize" value="L">L
					<input type="radio" id= "psize5" name="psize" value="XL">XL
					<input type="radio" id= "psize6" name="psize" value="XXL">XXL
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td><input type="text" id="pcolor" name="pcolor" value="${productMap.product.PCOLOR}"></td>
			</tr>
			<tr>
				<th>대분류</th>
				<td>					
					<select id="bcode" name="bcode">
						<option value="">선택</option>
						<c:forEach var="big" items="${blist}">		
							<option value="${big.bcode}">${big.bname}</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
			<tr>
				<th>소분류</th>
				<td>					
					<select id="lcode" name="lcode">
						<option value="">선택</option>
						<c:forEach var="little" items="${llist}">						
							<option value="${little.LCODE}">${little.LNAME}</option>
						</c:forEach>
					</select>	
				</td>
			</tr>
			<tr>
				<th>사진</th>
					<td>
						<input type="file" name="files" class="files">
					</td>
			</tr>
<!-- 			<tr>
				<td colspan="4" align="center"><button type="button" id="btnUpdate">수정</button> </td>
			</tr> -->
			
		</table>
			<button type="button" id="btnUpdate">수정</button>
	</form>
<%@ include file="../footer.jsp" %>	
</body>
</html>