<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'IM_Hyemin-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Regular.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}

/* 장바구니 버튼 폼  */
.cartform{
	margin-right : 220;
}
/*장바구니 테이블 */
.cart{
}
/*적립/할인 td*/
.point{
	width: 80;
}
/*선택 td*/
.choose{
	width: 45;
}
/*장바구니 테이블*/
table{
	position: absolute;
	right : 200;
	top : 550;
	width: 900;
}
table td{
	height: 100;
}
table th{
	background: #F5F5F5;
	
}
.line{
	border-bottom: 1px solid #ccc;
    font-family: 'IM_Hyemin-Regular';
}
/*장바구니*/
.Jang{
	margin-right : 390;
	font-size: 25pt;
}
/*버튼 모음*/
/*주문 버튼*/
.btnOrder{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.btnOrder:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*삭제버튼*/
#deletebtn{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
#deletebtn:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*전체주문 버튼*/
#btnAllOrder{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
#btnAllOrder:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*장바구니 비우기*/
#btnEnough{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
#btnEnough:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
/*계속 쇼핑하기*/
#btnShoping{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
#btnShoping:hover{
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
}
</style>

<script type="text/javascript">
	//비어있는 경우 처리 함수
	function emptysellbox(cnt){
		if(cnt==0){
			$('#enptysellbox').show();//버튼
			$('#sellboxlist').hide();//
		}else{
			$('#enptysellbox').hide();
			$('#sellboxlist').show();			
		}	
	}
		
	$(function() {	
		//비어있는 경우 처리 if문
		if(${sellBoxmap.count==0}){
			$('#enptysellbox').show();
			$('#sellboxlist').hide();
		}else{
			$('#enptysellbox').hide();
			$('#sellboxlist').show();			
		}
		//쇼핑으로 이동		
		$('#btnShoping').click(function(e) {
			//리스트로 이동
			e.preventDefault();
 			location.href = "${path}/product/list";
		})
		//장바구니 전체 비우기//
		$('#btnEnough').click(function(e) {
			e.preventDefault();
			$.ajax({
				url:'${path}/sellbox/Alldelete',
				type:'delete',
				dataType:'text',
				success: function(data) {
					console.log('delete');
					alert('전체비우기');
					//값이 없으므로 바로 함수 실행
					emptysellbox(0);
				},
				error: function(err) {
					console.log(err);
					alert('실패');
					
				}
			})
		})
		//단일 삭제//tr 아이디를 달고 삭제
		$('.deletebtn').click(function(e) {
			e.preventDefault();
			var pcode = $('.pcode').val();
			$.ajax({
				url:'${path}/sellbox/delete/'+pcode,
				type:'delete',
				dataType:'text',
				success: function(data) {
					console.log('삭제');
					alert('삭제');
					$('tr').remove('#sellimpo'+pcode);
					//삭제 후 값이 없을 때 함수 실행
					if(${sellBoxmap.count==0}){
						emptysellbox();
					}					
				},
				error: function(err) {
					console.log(err);
					alert('실패');
				}
			})
		});
		//단일 주문
		$('.btnOrder').click(function(e) {
			//하나의 상품만 가지고 결제폼 이동
			e.preventDefault();
			var sbcode = $(this).val();
			location.href='${path}/sellbox/order?sbcode='+sbcode;
		});
		//모든 상품 주문
		$('#btnAllOrder').click(function(e) {
			//전체 정보를 가지고 결제창으로 이동
			e.preventDefault();
			location.href = '${path}/sellbox/orderList';
		})
		
	}); 
	
</script>
</head>
<%@ include file="../mypage.jsp" %>
<%@ include file="../header.jsp" %>
<body>	
	<h2 align="center" class="Jang">장바구니</h2>
		<div align="center" class="cartform">
			<div id="enptysellbox">장바구니가 비어있습니다.<button id ="btnShoping">계속쇼핑하기</button></div>
			<div id="sellboxlist">
				<table class="cart">
					<tr>
						<th>상품정보</th>
						<th>판매가</th>
						<th>수량</th>
						<th>합계</th>
						<th class="choose">선택</th>
					</tr>
					<c:forEach items="${sellBoxmap.slist}" var="item">
						<tr id="sellimpo${item.PCODE}">
							<td class="line">
								<a href="${path}/product/detail?pcode=${item.PCODE}">
									<img src="${path}/uploadimg/${item.FNAME}" alt=""height="250px" width="100%">
								</a>
							</td>
							<td class="line">상품명:${item.PNAME}<br>색:${item.PCOLOR}<br>사이즈:${item.PSIZE}</td>
							<td class="line">${item.PRICE}₩</td>
							<td class="line">${item.SELLCNT}</td>
							<td class="line">${item.AMOUNT}₩</td>
							<td class="line">
								<input type="hidden" class="pcode" name="pcode" value="${item.PCODE}">
								<button class ="btnOrder" value="${item.SBCODE}">주문</button><br>
								<button class ="deletebtn" id="deletebtn">삭제</button>
							</td>
						</tr>
					</c:forEach> 
				</table>
				<button id ="btnAllOrder">전체주문</button>
				<button id ="btnEnough">장바구니 비우기</button>
				<button id ="btnShoping">계속쇼핑하기</button>
			</div>
		
	</div>
<%@ include file="../footer.jsp" %>
</body>
</html>