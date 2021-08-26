<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>        
    
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

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/board_list.css">

<script type="text/javascript">
 
  //jQuery초기화
  $(document).ready(function(){
	 
	  if('${ not empty param.search }'=='true'){
	  	$("#search").val('${param.search}');
	  	
	  	//전체보기면 검색어 지워라
	  	if("${param.search eq 'all'}"=="true"){
	  		$("#search_text").val("");
	  	}
	  	
	  }

  });
  
  
  //검색버튼 클릭시
  function find(){
	  
	  var search      = $("#search").val();
	  var search_text = $("#search_text").val().trim();
	  
	  //전체검색이면 검색창내용 지워라
	  if(search=='all'){
		  $("#search_text").val("");
	  }
	  
	  if(search!='all' && search_text==''){
		  
		  alert('검색어를 입력하세요');
		  $("#search_text").val("");//값 지우기
		  $("#search_text").focus();
		  return;
	  }
	  
	  
	  //자바스크립트 이용 요청
	  //encodeURIComponent(search_text,"utf-8") 
	  //  : search_text 한글또는 특수문자인경우 인코딩해서 넘겨야 서버가 제대로 인식한다
	  location.href = "board_list.do?search=" + search + "&search_text=" + encodeURIComponent(search_text,"utf-8") ;

  }//end-find

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
		
			<div class="table_location">
				<div class="board_button">
					<!-- 관리자일때만 작성가능 -->
					<c:if test="${ user.i_grade eq '관리자' }">
							<div>
								<input class="btn btn-warning" type="button"  value="작성하기" 
							       			onclick="location.href='insert_form.do'">
							</div>   
					</c:if>
				</div>
				
				<div class="board_list">
					<table class="table">
						<!-- 제목 -->
						<tr class="success">
							<th>번호</th>
							<th width="50%">제목</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>조회수</th>
						</tr>
						
						<!-- Data없는 경우 -->
						<c:if test="${ empty map.list }">
						   <tr>
						      <td colspan="5">
						         <div id="empty_message">게시물이 존재하지 않습니다</div>
						      </td>
						   </tr>
						</c:if>
						
						<!-- Data있는 경우 -->
						<!-- for(BoardVo vo : list)         -->
						<c:forEach var="vo"  items="${ map.list }">
						   <tr class="td_style">
						      <td>${ vo.no }</td>
						      
						      <!-- 제목 -->
						      <td style="text-align: left;">
						          <!--사용가능한 게시글일때  -->
						          <c:if test="${ vo.b_use_yn eq 'y' }">
						          	<a href="board_view.do?b_idx=${ vo.b_idx }&page=${ (empty param.page) ? 1 :  param.page }&search=${ (empty param.search) ? 'all' : param.search }&search_text=${ param.search_text }">${ vo.b_subject }</a>
						          </c:if>
						             
						          <!-- 삭제된 게시글일때 -->
						          <c:if test="${ vo.b_use_yn eq 'n' }">
						          	<span style="color:red;">이벤트기간이 지나 삭제된 게시글입니다&nbsp;(${ vo.b_subject })</span>
						          </c:if>         
						      </td>
						      <td>${ vo.i_name }</td>
						      <td>${ fn:substring(vo.b_regdate,0,16) }</td>
						      <td>${ vo.b_readhit }</td>
						   </tr>
						</c:forEach>
						
					</table>
				</div>
				
				<!-- 검색메뉴  -->
				<div class="search_style">
				
				    <select id="search">
				        <option value="all">전체보기</option>
				        <option value="name">이름</option>
				        <option value="subject">제목</option>
				        <option value="content">내용</option>
				        <option value="subject_content">제목+내용</option>
				    </select>
				    <input id="search_text" class="input_lgn" value="${ param.search_text }">
				    <input class="btn btn-warning"  style="width:60px;" type="button"  value="검색" onclick="find();">
				    
				</div>
				
				<!-- Page메뉴 넣기 -->
				<div class="page_style">	
				      ${ map.pageMenu }
				</div>
			</div>
			
		</div>		
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>
	
</body>
</html>