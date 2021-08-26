<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>    
      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe,in</title>

<!-- bootstrap -->
<link href="${ pageContext.request.contextPath }/resources/bootstrap-3.3.2-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${ pageContext.request.contextPath }/resources/bootstrap-3.3.2-dist/js/bootstrap.min.js"></script>

<!-- semantic ui -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.css">
<script src="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.js"></script>

<!-- sweetalert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/board_view.css">

<script type="text/javascript">
	
	//삭제
    function del(b_idx){
   
    	Swal.fire({
			title: '게시물삭제',
			html: "<h4>정말 삭제 하시겠습니까?</h4>",
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '예',
			cancelButtonText : "아니오"
	    }).then((result) => {
	   
	    //예 버튼클릭
		if (result.isConfirmed) {
			location.href="board_delete.do?b_idx=" + b_idx + "&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }";
		}
	 });
  }//end-del

  function modify_form(b_idx){
	   
	  location.href="modify_form.do?b_idx=" + b_idx +"&page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }";
	   
  }//end-modify_form 
  
  function add_comment(){
	   
	   //로그인여부 체크
	   if('${ empty user }'=='true'){
		   
		   Swal.fire({
			   title: '댓글쓰기',
			   html: "<h5>댓글쓰기는 로그인후 이용가능합니다<br>로그인 하시겠습니까?</h5>",
			   icon: 'warning',
			   showCancelButton: true,
			   confirmButtonColor: '#3085d6',
			   cancelButtonColor: '#d33',
			   confirmButtonText: '예',
			   cancelButtonText : "아니오"
		   }).then((result) => {
			   if (result.isConfirmed) {
			     
				  location.href='${ pageContext.request.contextPath }/member/login_form.do?url=' + location.href;
			   }
			 });
		  
	   }else{
		   //로그인된 상태면
		   
		   //입력값 읽어오기
		   var c_content = $("#c_content").val().trim();
		   
		   if(c_content==''){
			   alert('댓글내용을 입력하세요!!');
			   $("#c_content").val("");
			   $("#c_content").focus();
			   return;
		   }
		   
		   //Ajax전송
		   $.ajax({
			   url	: '../comment/insert.do',
			   data	: {'c_content': c_content, 
				       'b_idx' : '${ vo.b_idx }',
				       'i_idx' : '${ user.i_idx }',
				       'i_name': '${ user.i_name }'
			           },
			   dataType: 'json',
			   success : function(result_data){
				   // result_data = {"result" : "success"}
				   // result_data = {"result" : "fail"}
				   
				   //이전작성내용 지우기
				    $("#c_content").val("");
				   
				   if(result_data.result == "success"){
					   
					   //댓글목록 읽어오기
					   comment_list(1);
					   
				   }else{
					   alert("댓글쓰기 실패!!");
				   }
				   
			   },
			   error   : function(err){
				   alert(err.responseText);
			   }
		   }); //end-ajax
	  }
	   
  }//end add_comment
  
  
  function comment_list(page){
	   
	   //Ajax로 요청
	   $.ajax({
		   url	: "../comment/list.do",
		   data	: { 'b_idx' : '${ vo.b_idx }', 'page':page },
		   success: function(result_data){
			   //수신된결과데이터(댓글목록) disp에 출력
			   $("#disp").html(result_data);
			   
		   },
		   err	  : function(err){
			   alert(err.responseText);
		   }
	   });
  }
  
  //jQuery초기화
  $(document).ready(function(){
	   //댓글목록 출력
	   comment_list(1);
  });
	
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
		
			<form method="post" enctype="multipart/form-data">
				<div class="insert_box">
					<div class="panel panel-primary">
						<div class="panel-heading"><h3>게시판</h3></div>
						<div class="panel-body">
						    <table class="table">
						    	<tr class="tr_align">
		                            <th class="tb_title">사진</th>
		                            <td colspan="2">
		                            	<img src="${ pageContext.request.contextPath }/resources/upload/${ vo.b_photo }">
		                            </td>
		                        </tr>
		                        
		                        <tr>
			                        <th class="tb_title">제목</th>
			                        <td>
			                        	<div class="title_input" id="subject">${ vo.b_subject }</div>
			                        </td>
		                        </tr>
		                        
		                        <tr>
						           <th class="tb_title">작성일자</th>
						           <td>
						           		<div class="title_input" id="regdate">${ fn:substring(vo.b_regdate,0,16) }</div>
						           </td>
					       		</tr>
					       		
		                        <tr>
		                            <th class="tb_title">내용</th>
		                            <td>
		                            	<div class="title_input" id="content">${ vo.b_content }</div>
		                            </td>
		                        </tr>
		                        
		                        <tr class="send_button">
		                            <td colspan="2" align="center">
		                                <input class="btn btn-warning" type="button"  value="목록보기" onclick="location.href='board_list.do?page=${ param.page }&search=${ param.search }&search_text=${ param.search_text }'">
		                            </td>
		                        </tr>
		                        
		                        <c:if test="${ user.i_grade eq '관리자' }">
			                        <tr class="send_button">
			                            <td colspan="2" align="center">
			                                <input class="btn btn-warning" type="button"  value="수정하기" onclick="modify_form('${ vo.b_idx }');" >
			                                <input class="btn btn-warning" type="button"  value="삭제하기" onclick="del('${ vo.b_idx }');">
			                            </td>
			                        </tr>
		                        </c:if>	
		                        			    
						    </table>
						</div>
					</div>
				</div>
			</form>
			
		</div>
		
		<div class="tp_space"></div>
		<div class="tp_space"></div>
		<div class="tp_space"></div>
		<div class="tp_space"></div>
		<div class="tp_space"></div>
		<div class="tp_space"></div>
		
		<div class="bottom_style">
			<!-- 댓글 입력창  -->
			<div class="comment_style">
			      <div class="nickname">
			          <c:if test="${ empty user }">
			             댓글은 로그인 하신후 작성가능합니다
			          </c:if>
			       
			          <c:if test="${ not empty user }">
			             작성자:${ user.i_name }
			          </c:if>
			          
			          <input class="btn btn-warning" type="button"  value="댓글쓰기" onclick="add_comment();">  
			       </div>
			            
			       <div class="tp_space"></div>
			            
		           <div>
		           	   <textarea id="c_content" rows="3" cols=""></textarea>
		           </div> 
			</div>
			      
			<div class="tp_space"></div>
			
			<div class="comment_view">
				<div id="disp"></div>
			</div>
			
		</div>	
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>