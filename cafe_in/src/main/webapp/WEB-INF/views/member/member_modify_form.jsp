<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe,in</title>

<!-- bootstrap -->
<link href="${ pageContext.request.contextPath }/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- semantic ui -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.css">
<script src="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.js"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- daum 주소찾기 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/my_modify.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/member_modify_form.css">

<script type="text/javascript">
	$(document).ready(function(){
		  
		  setDateBox();
		  //주소찾기 버튼 클릭시
		  $("#addr_button").click(function(){
			  
			  var width  = 500;  //팝업의 너비
			  var height = 600;  //팝업의 높이
			  
			  new daum.Postcode({
				    width: width, //생성자에 크기 값을 명시적으로 지정해야 합니다.
				    height: height,
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

			            $("#i_zipcode").val(data.zonecode);
			            $("#i_addr").val(data.roadAddress);
			        },
			        theme: {
			            searchBgColor:  "#0B65C8", //검색창 배경색
			            queryTextColor: "#FFFFFF"  //검색창 글자색
			        }     
			    }).open(
			    		{
			    		    left: (window.screen.width / 2) - (width / 2),
			    		    top: (window.screen.height / 2) - (height / 2)
			    		}	
			    );
			  
			  
		  });// end 찾기버튼 클릭
		  
		  //전화번호 입력시 번호 사이에 자동 - 붙여주는 코드
		  $(document).on("keyup", "#i_tel", function() { 
				$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		  });

	});// end  jQuery초기화 

	function setDateBox() {
	   var dt = new Date();
	   var year = "";
	   var com_year = dt.getFullYear();
	
	   
	   $("#year").append("<option value=''>년도</option>");
	
	   // 올해 기준으로 -100년부터 +1년을 보여준다.
	   for (var y = (com_year - 100); y <= (com_year + 1); y++) {
	     $("#year").append("<option value='" + y + "'>" + y + " 년" + "</option>");
	   }
	
	   // 월 (1월부터 12월)
	   var month;
	   $("#month").append("<option value=''>월</option>");
	   for (var i = 1; i <= 12; i++) {
	     $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
	   }
	
	   // 일 (1일부터 31일)
	   var day;
	   $("#day").append("<option value=''>일</option>");
	   for (var i = 1; i <= 31; i++) {
	     $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
	   }
	
	 }

	 function send(f){
	  
		  var i_id			= f.i_id.value.trim();
		  var i_name 		= f.i_name.value.trim();
		  var i_pwd  		= f.i_pwd.value.trim();
		  var i_pwd_check   = f.i_pwd_check.value.trim();
		  var i_zipcode     = f.i_zipcode.value.trim();
		  var i_addr        = f.i_addr.value.trim();
		  var i_email       = f.i_email.value.trim();
		  var i_addr_detail = f.i_addr_detail.value.trim();
		  var i_tel			= f.i_tel.value.trim();

		  if(i_pwd==''){
			  swal.fire('비밀번호를 입력하세요');
			  f.i_pwd.value='';
			  f.i_pwd.focus();
			  return;
		  }
		  
		  if(i_pwd!=i_pwd_check){
			  swal.fire('비밀번호를 똑같이 입력해주세요');
			  f.i_pwd.value='';
			  f.i_pwd_check.value='';
			  f.i_pwd.focus();
			  f.i_pwd_check.focus();
			  
			  return;
		  }
		  
		  if(i_email==''){
			  swal.fire('이메일 주소를 입력하세요');
			  f.i_email.value='';
			  f.i_email.focus();
			  return;
		  }	  
		  
		  if(i_tel==''){
			  swal.fire('전화번호를 입력하세요');
			  f.i_tel.value='';
			  f.i_tel.focus();
			  return;
		  }
		  
		  if(i_zipcode==''){
			  swal.fire('우편번호를 입력하세요');
			  f.i_zipcode.value='';
			  f.i_zipcode.focus();
			  return;
		  }
		  
		  if(i_addr==''){
			  swal.fire('주소를 입력하세요');
			  f.i_addr.value='';
			  f.i_addr.focus();
			  return;
		  }
		  
		  if(i_addr_detail==''){
			  swal.fire('상세주소를 입력하세요');
			  f.i_addr_detail.value='';
			  f.i_addr_detail.focus();
			  return;
		  }
		  
		  Swal.fire({
			  title: '정말 수정하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: '취소',
			  confirmButtonText: '수정'
			}).then((result) => {
			  if (result.isConfirmed) {
				  f.action = "modify.do?${i_idx}";
				  f.submit();
			  }
		  });
	  
	 }// end-send(f)
	
</script>
</head>
<body>

	<div class="tp_layer">
		<div class="tp_button_layout">
			<%@ include file="../etc/top_button.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_logo_layout">
			<%@ include file="../etc/logo.jsp" %>
		</div>
	</div>
	
	<form>
		<input type="hidden" name="i_idx" value="${vo.i_idx }">
		<div class="tp_layer">
			<div class="tp_main_layout">
		         <div class="join_page_form">        
		             <div class="new_title">Cafe, in 정보수정</div>
						<div class="join_page_div">
						   <div class="image_container"></div>
						   <table class="join_table">
						      <tr>
						         <td class="join_title">이름</td>
						         <td>
						         	<input id="i_name" type="text" class="input_new" name="i_name" value="${vo.i_name }" readonly="readonly">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">아이디</td>
						         <td>
						         	<input id="i_id" type="text" class="input_new" name="i_id" value="${vo.i_id }" readonly="readonly">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">비밀번호</td>
						         <td>
						         	<input type="password" id="i_pwd" name="i_pwd"  class="input_new" placeholder="Password">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">비밀번호 확인</td>
						         <td>
						         	<input type="password" id="i_pwd_check" name="i_pwd_check" class="input_new" placeholder="Password-check">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">이메일</td>
						         <td>
						         	<input id="i_email" class="input_new" type="text" name="i_email" value="${vo.i_email }" placeholder="E-mail">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">우편번호</td>
						         <td>
						         	<input id="i_zipcode" name="i_zipcode" class="input_new" type="text" value="${vo.i_zipcode }" placeholder="zipcode" readonly="readonly">
						         	<input id="addr_button" type="button" class="btn btn-warning" value="주소찾기">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">주소</td>
						         <td>
						         	<input id="i_addr" class="input_new" name="i_addr" value="${vo.i_addr }" placeholder="Adress" readonly="readonly">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">상세주소</td>
						         <td>
						         	<input id="i_addr_detail" class="input_new" name="i_addr_detail" value="${vo.i_addr_detail }" placeholder="Adress-detail">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">생년월일</td>
						         <td>
						         	<input id="i_birth" type="text" class="input_new" name="i_birth" value="${vo.i_birth }" readonly="readonly">
						         </td>
						      </tr>
						      
						      <tr>
						         <td class="join_title">휴대전화</td>
						         <td>
						         	<input id="i_tel" class="input_new" type="text" name="i_tel" value="${vo.i_tel }" placeholder="Phone-number">
						         </td>
						      </tr>
						      
						      <tr>
						         <td colspan="2" align="center">
						         	<input id="join_button" type="button" class="btn btn-warning btn-ok" value="수정하기" onclick="send(this.form)">
						         	<input id="cancle_button" type="button" class="btn btn-warning btn-ok" value="취소" onclick="location.href='../etc/list.do?${vo.i_idx}'">
						          </td>
						      </tr>
						    </table>
						</div>
		           </div>
				
			</div>
		</div>
	</form>

	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>