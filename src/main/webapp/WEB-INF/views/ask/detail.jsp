<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/includeFile.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ask detail</title>

<style type="text/css">
/*디테일 폼*/
.askdetail{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin : 20px 10px;
}

/*제목*/
.askdetail tr{
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
.askdetail td{
	width: 100px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
}
.askdetail th{
	width: 100px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

/*구분 */
.gubun{
	background: #F5F5F5;
}

/*작성자*/
.writer{
	border-bottom: 1px solid #ccc;
	background: #F5F5F5;
}

/*작성일*/
.date{
	position : absolute;
	right: 500;
}
.title{
	background: #F5F5F5;
}
/*버튼 모음*/
/*리턴버튼*/
.return{
	height: 30px;
	width: 100px;
	position: absolute;
	left:500;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}
.return:hover{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}

/*삭제버튼*/
.delete{
	height: 30px;
	width: 100px;
	position: absolute;
	left:1100;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.delete:hover{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}
/*답글 버튼*/
.answer{
	height: 30px;
	width: 100px;
	position: absolute;
	right: 600;
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}
.answer:hover{
	color: rgba(30, 22, 54, 0.6);
	box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
	
}
/*댓글 폼*/
.answerdetail{
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin : 20px 10px;
}
/*작성일*/
.rdate{
	border-bottom: 1px solid #ccc;
	background: #F5F5F5;
}
/*내용*/
.naeyoung{
	border-bottom: 1px solid #ccc;
	background: #F5F5F5;
}
input{
	border:0 solid black;
}
</style>
<!-- 핸들바 탬플릿 cdn추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.js"></script>
<!-- 답글조회 템플릿소스 -->
<script id="answerSelect_template" type="text/x-handlebars-template">
{{#each .}}
   <div align="center">
      <table class = "answerdetail">
         <tr>
            <th class = "writer">작성자</th>
            <td class="ansUserid"><input type="text" name="ansUserid" value="{{userid}}" readonly size="35px"></td>
            <th class = "rdate">작성일</th>
            <td><input  type="text" class="ansRegdate" name="ansRegdate" value="{{regdate}}" readonly size="35px"></td>
         </tr>
         <tr>
            <th class ="naeyoung">내용</th>
            <td colspan="3"><textarea rows="8" cols="90" id="ansContent" name="ansContent" readonly>{{content}}</textarea></td>
         </tr>
         <tr hidden>
            <td>
               <input class ="line" type="text" id="reStep" class="reStep" value="{{reStep}}" hidden>
               <input class ="line" type="text" id="reLevel" class="reLevel" value="{{reLevel}}" hidden>
            </td>
         </tr>
      </table>
   </div>
{{/each}}
</script>
<script type="text/javascript">
   //폼 로딩이 완료되었을 때
   $(function() {
      
      //로그인 아이디가 root가 아니라면
      if('${sessionScope.userid}' == 'root'){
         $('#btnAnswer').show();
      }else{
         $('#btnAnswer').hide();
      }
      
      //로그인 아이디와 작성자 아이디가 일치하지 않는다면
      if('${sessionScope.userid}' == '${aMap.ask.userid}'){
         $('#btnDelete').show();
      }else{
         $('#btnDelete').hide();
      }
      
      //목록으로 버튼을 클릭했을 때
      $('#btn1').click(function() {
         location.href="${path}/ask/list";
      });
   
      //답글 버튼을 클릭했을 때
      $('#btnAnswer').click(function() {
         $('#answerAdd').show();
      });
      
      //답글의 등록 버튼을 클릭했을 때
      $('#btnAdd').click(function() {
         var acode = ${aMap.ask.acode};
         var content = $('#ansContent').val();
         var restep = $('#reStep').val();
         var relevel = $('#reLevel').val();
         $.ajax({
            url:'${path}/answer/add/',
            type:'post', //method
            contentType:'application/json', //보내는 데이터 타입
            data:JSON.stringify({acode,content,restep,relevel}), //보낼 데이터
            dataType:'text', //server에서 받는 데이터 타입
            success:function(data){ //data : 받는 값 
               console.log(data);
               answerSelect();//답글 조회
            },
            error:function(err){
               console.log(err);
               alert('실패');
            }
         });
      });
      
      //답글 조회
       function answerSelect() {
         var acode = ${aMap.ask.acode};
         $.ajax({
            url:'${path}/answer/list/' + acode,
            type:'get', //method
            dataType:'json', //server에서 받는 데이터 타입
            
            //성공 시 실행
            success:function(data){
               console.log(data);
               //댓글 리스트 템플릿으로 뿌려주기
               var source = $('#answerSelect_template').html();
               var template = Handlebars.compile(source);
               $('#answerSelect').html(template(data));
               $('#answerAdd').hide();
            },
            //실패 시 실행
            error:function(err){
               console.log(err);
               alert('실패');
            }
         });
      };
      
      //댓글리스트 조회
      answerSelect();
      
      //원본의 삭제하기 버튼을 클릭했을 때
      $('#btnDelete').click(function() {
         var acode = ${aMap.ask.acode};
         location.href='${path}/ask/delete?acode=' + acode;
      });
      
      //파일다운로드 아이콘을 클릭했을 때
      $('.FileDownload').click(function(e) {
         e.preventDefault(); //form 안에 있다면 기본 이벤트 제거하기
         var filename = $(this).val(); //파일 이름
         location.href='${path}/ask/filedownload?filename=' + filename;
      });
   });
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
	<div align="center">
	</div>
	<div align="center">
		<table class="askdetail">
			<tr>
				<td class="writer">작성자</td>
				<td class="writer_chiled"> ${aMap.ask.userid} </td>
				<td colspan="2" class="date"><fmt:formatDate value="${aMap.ask.regdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<th class="title">문의내용</th>
				<th align="left" class="title_chiled">${aMap.ask.subject}</th>
				<th class="gubun">문의종류</th>
				<th class="gubun_chiled">${aMap.ask.gubun}</th>
			</tr>
			<tr>
				<td colspan="4"> <textarea rows="20" cols="100">${aMap.ask.content}</textarea> </td>
			</tr>

			<tr>
				<td>첨부파일</td>
				<td colspan="3">
					<c:forEach var="askfile" items="${aMap.aflist}">
						${askfile.fname}
						<button id="FileDownload" class="FileDownload" value="${askfile.fname}"><i class="fas fa-download"></i></button><br>
					</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<div align="center" style="margin-top: 10px;">
		<button id="btn1" class="return">목록으로</button>
		<button id="btnDelete" class="delete">삭제하기</button>
		<button id="btnAnswer" class="answer">답글</button>	
	</div>
   <div align="center">
      <h2>답글</h2>   
   </div>
   <div id="answerAdd" hidden="" align="center" >
      <input type="hidden" id="reStep" value="0">
      <input type="hidden" id="reLevel" value="0">
      <table class = "answerdetail">
         <tr>
            <th class = "writer">작성자</th>
            <td><input type="text" id="ansUserid" name="ansUserid" value="${sessionScope.userid}" readonly size="35px"></td>
            <th class="rdate">등록일자</th>
            <td>
            <input type="text" id="ansRegdate" name="ansRegdate" value="<fmt:formatDate value="${aMap.ask.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly size="35px">
            </td>
         </tr>
         <tr>
            <th class ="naeyoung">내용</th>
            <td colspan="3"><textarea rows="8" cols="90" id="ansContent" name="ansContent"></textarea></td>
         </tr>
      </table>
      <button id="btnAdd" style="margin-left: 620px;margin-top: 10px;">등록</button>
   </div>
	<!-- 답글 -->
	<div id="answerSelect">
			
	</div>
	
<%@ include file="../footer.jsp" %>
</body>
</html>