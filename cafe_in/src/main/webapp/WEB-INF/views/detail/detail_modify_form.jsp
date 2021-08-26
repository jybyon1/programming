<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
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

<!-- daum 주소찾기 라이브러리  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/detail_modify_form.css">

<script type="text/javascript">
	function send(f){
		
		var c_name        = f.c_name.value.trim();
		var c_zipcode     = f.c_zipcode.value.trim();
		var c_addr        = f.c_addr.value.trim();
		var c_addr_detail = f.c_addr_detail.value.trim();
		var c_tel         = f.c_tel.value.trim();

		
		if(c_name==''){
			swal.fire('제목을 입력하세요');
			f.c_name.value='';
			f.c_name.focus();
			return;
		}
		
		if(c_zipcode==''){
			swal.fire('우편번호를 입력하세요');
			f.c_zipcode.value='';
			return;
		}
		
		if(c_addr==''){
			swal.fire('주소를 입력하세요');
			f.c_addr.value='';
			return;
		}
		
		
		if(c_addr_detail==''){
			swal.fire('상세주소를 입력하세요!!');
			f.c_addr_detail.value='';
			return;
			
		}
	
		
		if(c_tel==''){
			swal.fire('카페전화번호을 입력하세요');
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
					f.action = '../detail/modify.do';
					f.submit();
			  }
		});
	
	}


	$(document).ready(function(){
	
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
		$(document).on("keyup", "#c_tel", function() { 
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	
	});// end  jQuery초기화 

</script>

</head>
<body>

	<div class="tp_layer">
		<div class="tp_button_layout">
			<%@ include file="../etc/top_button.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_menu_layout">
			<%@ include file="../etc/only_menu.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_main_layout">
			
			<div class="form_style">
				<form  method="POST" enctype="multipart/form-data">
					<input type="hidden"   name="c_idx"  value="${ vo.c_idx }">
					
					<div id="box" class="insert_box">
	
						<div  class="panel panel-primary">
			     		<div class="panel-heading"> <h3>카페수정</h3> </div>
				      		<div class="panel-body">	
				      			<table class="table">
					      			 <tr>
					      			 	<th class="tb_title">카페명</th>
					      			 	<td><input class="title_input" name="c_name" size="60" value="${ vo.c_name }"></td>
					      			 </tr>
					      			 <tr>
				                         <th class="tb_title">우편번호</th>
				                         <td>
				                         	<input id="i_zipcode" type="text" name="c_zipcode" value="${ vo.c_zipcode }" class="title_input_short" placeholder="zipcode" readonly="readonly">
				                         	<input id="addr_button" type="button" class="btn btn-warning" value="주소찾기">
				                         </td>
				                     </tr>
				                     <tr>
				                         <th class="tb_title">주소</th>
				                         <td><input id="i_addr" name="c_addr"  class="title_input" value="${ vo.c_addr }"  placeholder="Adress" readonly="readonly"></td>
				                     </tr>
				                     <tr>
				                         <th class="tb_title">상세주소</th>
				                         <td><input id="i_addr_detail" name="c_addr_detail"  value="${ vo.c_addr_detail }"  class="title_input" placeholder="Adress-detail"></td>
				                     </tr>
					      			 
					      			 <tr>
					      			 	<th class="tb_title"> 전화번호</th>
					      			 	<td><input class="title_input" id="c_tel" value="${ vo.c_tel }"  name="c_tel" size="60"></td>
					      			 </tr>
					      			 
					      			 <tr>
					      			 	<th class="tb_title"> 주차장</th>
					      			 	<td>
					      			 		<input type="radio" name="c_parking" value="1" <c:if test="${ vo.c_parking eq '1'}">checked</c:if>>예
					      			 		<input type="radio" name="c_parking" value="0" <c:if test="${ vo.c_parking eq '0'}">checked</c:if>>아니오
					      			 	</td>
					      			 </tr>
					      			 
					      			 <tr>
					      			 	<th class="tb_title"> 노키즈존</th>
					      			 	<td>
					      			 		<input type="radio" name="c_nokidz" value="1" <c:if test="${ vo.c_nokidz eq '1'}">checked</c:if>>예
					      			 		<input type="radio" name="c_nokidz" value="0" <c:if test="${ vo.c_nokidz eq '0'}">checked</c:if>>아니오
					      			 	</td>
					      			 </tr>
					      			 
					      			 <tr>
					      			 	<th class="tb_title"> 주류판매</th>
					      			 	<td>
					      			 		<input type="radio" name="c_alcohol" value="1" <c:if test="${ vo.c_alcohol eq '1'}">checked</c:if>>예
					      			 		<input type="radio" name="c_alcohol" value="0" <c:if test="${ vo.c_alcohol eq '0'}">checked</c:if>>아니오
					      			 	</td>
					      			 </tr>
						      			 
						      		 <tr>
						      		 	<th class="tb_title">분위기</th>
					      				<td>
					      			 		<c:forEach var="mood" items="${ mood_list }">
					      			 			<input type="checkbox"  name="m_idx" value="${ mood.m_idx }"
					      			 				<c:forEach var="mood1" items="${ vo.mood_list }">
					      			 					<c:if test="${ mood.m_name eq mood1.m_name }">
					      			 						checked
					      			 					</c:if>
					      			 				</c:forEach>
					      			 			>${ mood.m_name }
					      			 		</c:forEach>
					      			 	</td>
						      		 </tr>

						      		 <tr>
						      		 	<th class="tb_title">디저트</th>
					      				<td>
					      			 		<c:forEach var="dessert" items="${ dessert_list }">
					      			 			<input type="checkbox"  name="d_idx" value="${ dessert.d_idx }"
					      			 				<c:forEach var="dessert1" items="${ vo.dessert_list }">
					      			 					<c:if test="${ dessert.d_name eq dessert1.d_name }">
					      			 						checked
					      			 					</c:if>
					      			 				</c:forEach>
					      			 			>${ dessert.d_name }
					      			 		</c:forEach>
					      			 	</td>
						      		 </tr>	 	
					      			 
					      			 <tr>
					      			 	<td colspan="2" align= "center"> 
						      			 		<input  class="btn btn-warning" type="button" value="카페수정" onclick="send(this.form);" > 
						      			 		<input id="main_list" class="btn btn-warning" type="button" value="메인화면" 
						      			 				onclick="location.href='../etc/list.do'"> 
					      			 	</td>
					      			 </tr>
				      			</table>
				      		</div>
			   			</div>
			   			
			   		</div>
			   		
				</form>
			</div>
			
		</div>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>
	
</body>
</html>