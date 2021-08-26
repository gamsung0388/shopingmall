<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'IM_Hyemin-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Regular.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}

/*주문자 정보*/
.ordertale{
	margin-top : 30;
	width: 800;
	border-top: 2px solid gray;
	border-right: 2px solid gray;
	border-left: 2px solid gray;
	border-bottom: 2px solid gray;
}
.ordertale td{
	font-size: 15pt;
}
.ordertale input{
	font-size: 15pt;
	border-left-width:0;
	border-right-width:0;
	border-top-width:0;
	border-bottom-width:1;
}
/*주문자 input창*/
.order{
	margin-left: 130;
}
/*받는사람 input창*/
.receiver{
	margin-left: 110;
}
/*전화번호 input창*/
.tel{
	margin-left: 110;
}
/*이메일 input창*/
.email{
	margin-left: 130;
}
/*우편번호 input창*/
.zip{
	margin-left: 110;
}
/*도로명 주소 input창*/
.addr1{
	margin-left: 90;
	width: 450;
}
/*상세주소 input창*/
.addr2{
	margin-left: 110;
}
/*버튼 모음*/
/* button{
	margin-top : 20;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

button:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7);
} */
/*pay 버튼*/
.paybtn1{
	width: 120;
	height: 50;
	border: none;
	background: white;
}
.paybtn2{
	width: 120;
	height: 50;
	margin-left: 100;
	margin-top: 30;
	border: none;
	background: white;
}
.paybtn3{
	width: 120;
	height: 50;
	margin-left: 100;
	border: none;
	background: white;
}
.paybtn4{
	width: 120;
	height: 50;
	margin-left: 100;
	border: none;
	background: white;

}
/*동의 폼*/
.orderform{
    font-family: 'IM_Hyemin-Regular';
}
.orderform .agree{
	margin-top : 30;
	width: 800;
	border-top: 2px solid gray;
	border-right: 2px solid gray;
	border-left: 2px solid gray;
	border-bottom: 2px solid gray;
}
/*현금영수증 폼*/
.bill{
	margin-top : 30;
	border-top: 2px solid gray;
	border-right: 2px solid gray;
	border-left: 2px solid gray;
	border-bottom: 2px solid gray;
	width: 800;
}

/*상품 상세 테이블*/
.proorder{
	width: 800;
}
/*배송비/ 가격 div 폼*/
.fsa{
	margin-top : 10;
	margin-left: 610;
}
/*쇼핑div*/
.shipping{
	margin-left: 100;
}
/*합계 div*/
.amt{
	margin-left: 65;
}
</style>

<script type="text/javascript">
function jusoCallBack(roadAddrPart1,addrDetail,zipNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		//frmmemberAdd은  form의 name 
		document.frmOrderAdd.addr1.value = roadAddrPart1;
		document.frmOrderAdd.addr2.value = addrDetail;
		document.frmOrderAdd.zip.value = zipNo;
	}
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	//controller를 호출해서 주소팝업 띄우기
	var pop = window.open("${path}/guest/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	 
}
//현금영수증 처리
function cashyesno() {
	if($('input:radio[id=cashyes]').is(':checked')){
		$('#cashimpo').show();
	}else{
		$('#cashimpo').hide();
	}
}
	$(function () {
		//메시지 
		if ('${msg}' != ''){
			alert('${msg}');
		}		
		//주소찾기 버튼을 클릭했을때
		$('#findAddr').click(function(e) {
			e.preventDefault();
			goPopup(); //주소 팝업 띄우기
		})
		//현금영수증 체크시 번호칸 나오게 
	})
</script>
<title>결제폼</title>
</head>
<%@ include file="../header.jsp" %> 
<body>
	<h2 align="center">구매확인</h2>
	<div align="center" class="orderform">
	<form action="${path}/order/add" name="frmOrderAdd" id="frmOrderAdd" method="post">
	<table class="proorder">
		<c:forEach items="${osmap.oslist}" var="item">
			<tr>
				<td class="line">
					<a href="${path}/product/detail?pcode=${item.PCODE}">
						<img src="${path}/uploadimg/${item.FNAME}" alt=""height="250px" width="100%">
					</a>
				</td>
				<td>
					<!-- sbcode나 pcode를 가져온다음 찍어줌 -->
					<input type="hidden" name="sbcode" id="sbcode" value="${item.SBCODE}">
					상품명:${item.PNAME}<br>색:${item.PCOLOR}<br>사이즈:${item.PSIZE}
				</td>
				<td>
					갯수:${item.SELLCNT}
				</td>
				<td>
					가격:${item.PRICE}
				</td>
			</tr>
		</c:forEach>
	</table>
		<div class="fsa">
			<div class="free"> ★ 5만원이상시 배송비무료 ★ </div>
			<div class="shipping">배송비:${osmap.fee}원</div>
			<div class="amt">총가격:${osmap.amount}원</div>
		</div>		
	
		<table class="ordertale">
		
			<tr>
				<td>주문자<input class="order" type="text" name="orderer" value="${guest.username}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>받는사람<input class="receiver" type="text" name="receiver" value="${guest.username}"></td>	
			</tr>	
			<tr>
				<td>전화번호<input class="tel" type="tel" name="phone" value="${guest.phone}"></td>
			</tr>
			<tr>
				<td>이메일<input class="email" type="email" name="email" value="${guest.email}"></td>	
			</tr>
			<tr>
				<td>우편번호<input class="zip" type="text" name="zip" value="${guest.zip}"><button id="findAddr">찾기</button></td>	
			</tr>
			<tr>
				<td>도로명주소<input class="addr1" type="text" name="addr1" value="${guest.addr1}"></td>
			</tr>
			<tr>
				<td>상세주소<input class="addr2" type="text" name="addr2" value="${guest.addr2}"></td>
			</tr>
		</table>

	<table class="agree" >
		<tr>
			<td class="agrre1">
				결제동의확인서
			</td>
		</tr>
		<tr>
			<td class="agrre2">
				<label style=" background-color : gray">
					상품이 배송과정에서 손상이나 파손이 될 시에는 반품을 할 수 있다. <br>
					환불은 약관약정에 따라 2년의 유효기간을 갖는다.
				</label>
			</td>
			
		</tr>
		<tr>
			<td class="agrre3">
				결제를 동의하십니까?
			</td>
		</tr>
		<tr >
			<td class="agrre4">
				<input type="checkbox" id="orderagree">동의합니다
			</td>
		</tr>
	</table>
	<table class="bill">
		<tr>
			<td>현금영수증 여부</td>
		</tr>
		<tr>
			<td><input type="radio" name="cashyn" id="cashyes" onchange="cashyesno()">한다 <input type="radio" name="cashyn" id="cashno" onchange="cashyesno()">안한다</td>
		</tr>
		<tr>			
			<td>
				<div id="cashimpo">
					<input type="radio" name="cash" id="buycash">사업자용 현금영수증<br>
					번호입력:<input type="text"><br>
					<input type="radio" name="cash" id="Onecash">개인 현금영수증<br>
					번호입력:<input type="text">
				</div>
			</td>
		</tr>
	</table>

	<button class="paybtn1"><img src="${path}/resources/images/삼성페이.png" alt="" width="120" height="50"></button>
	<button class="paybtn2"><img src="${path}/resources/images/카카오페이.png" alt=""width="120" height="50"></button>
	<button class="paybtn3"><img src="${path}/resources/images/네이버페이.jpg" alt=""width="120" height="50"></button>
	<button class="paybtn4"><img src="${path}/resources/images/제로페이.png" alt=""width="120" height="50"></button>
	</form>
	</div>
<%@ include file="../footer.jsp" %>	
</body>
</html>