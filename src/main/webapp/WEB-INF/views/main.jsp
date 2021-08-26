<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file="./include/includeFile.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>

<style type="text/css">
/*폰트*/
@font-face {
    font-family: 'EliceDigitalBaeum_Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/EliceDigitalBaeum_Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/*메인화면 슬라이드 위치 설정 */

.mainimg{
	display: block; 
    width: 1280px;
    height: 480px;
}
.slider{
    width: 1280px;
    height: 480px;
    position: relative;
   	margin : auto;
}

.slider input[type=radio]{
	 display: none;
}

.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
    background-color: #fff;
}
.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}
.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
    opacity: 1;
    transition: 1s;
    z-index: 1;
}

.bullets{
    position: absolute;
    left: 50%; /* 가로로 가운데 정렬 */
    transform: translateX(-50%);
    bottom: 20px; /* 슬라이드 밑에서 20px 간격 띄움 */
    z-index: 2; /* 슬라이드 위에 보이도록 레이어 순위를 높임 */
}
.bullets label{
    display: inline-block; /* 한 줄로 불릿 나열*/
    border-radius: 50%; /* 원형 불릿으로 처리 */
    background-color: rgba(0,0,0,0.55);
    width: 20px; /* 불릿 너비 */
    height: 20px; /* 불릿 높이 */
    cursor: pointer;
}

ul.imgs{
	
	position: relative;
    margin: 0 auto;
}
ul.imgs li{
    position: absolute; /* 슬라이드가 겹쳐서 모여야 하므로 absolute 속성으로 배치 */
    opacity: 0; /* 체크한 라디오박스 순서의 슬라이드만 표시되도록 기본 투명도 설정 */
    list-style: none;
    padding: 0;
    display: block;
    text-align : center;
    margin-left: auto;
    margin-right: auto 
    margin: 0px auto;
}

/*메인 화면 하단 상품 보여주기*/

.icons{
/*위 오른쪽 아래 왼쪽  */
		position : absolute;
		top : 550;
        height: 302px;
        width: 1280px;
		list-style: none; /*list 행으로 정렬*/
		font-family: 'EliceDigitalBaeum_Bold';

}
/*메인 화면 상품 첫줄*/
.icon_img{
		margin-left: 0;
		margin-top: 50;
}
/*메인 화면 상품 제목*/
.contents1_bold{
		margin-left: 100;
}
/*메인 화면 상품 가격*/
.price{
		margin-left: 100;
}

/*메인 화면 하단 상품  두번째 줄*/

.icons1{
/*위 오른쪽 아래 왼쪽  */
		position : absolute;
		top : 950;
        height: 302px;
        width: 1280px;
		list-style: none; /*list 행으로 정렬*/

}

/*메인 화면 하단 상품  세번째 줄*/

.icons2{
/*위 오른쪽 아래 왼쪽  */
		position : absolute;
		top : 1350;
        height: 302px;
        width: 1280px;
		list-style: none; /*list 행으로 정렬*/
		background: pink;
		background-color: blue;
		

}
</style>

</head>

<body>
	<%@ include file="header.jsp" %>
	<!--메인화면 사진 슬라이드 -->
	<div class="slider"> 
		<input type="radio" name = "slide" id="slide1" checked="checked">
		<input type="radio" name = "slide" id="slide2">
		<input type="radio" name = "slide" id="slide3">
 		<ul id = "imgholder" class ="imgs">
	 		<li>
				<img alt="" class="mainimg"src="${path}/resources/images/배너.jpg">  
			</li> 	
			<li>
				<img alt="" class="mainimg"src="${path}/resources/images/배너2.png">  
			</li>
			<li>
				<img alt="" class="mainimg" src="${path}/resources/images/배너3.png">  
			</li> 		
 		</ul>
 		<div class = "bullets">
 			<label for="slide1"> &nbsp; </label>
 			<label for="slide2"> &nbsp; </label>
 			<label for="slide3"> &nbsp; </label>
 		</div>
		<ul class="icons">
		<c:forEach var="plist" items="${plist}">
        	<li> 
        		<div class="icon_img"> 
					<a href="${path}/product/detail?pcode=${plist.PCODE}"><img src="${path}/uploadimg/${plist.FNAME}" alt="" height="250px" width="290px"></a>          
  				</div> 
				<div class="contents1_bold"> <a href="${path}/product/detail?pcode=${plist.PCODE}">${plist.PNAME}</a></div>
				<div class="price">  ${plist.PRICE}₩    </div>
				
    		</li>
		</c:forEach>
		</ul>
	</div>

 </body>
	<%@ include file="footer.jsp" %>
</html>
