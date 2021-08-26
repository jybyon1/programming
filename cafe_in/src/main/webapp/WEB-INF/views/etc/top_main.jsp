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

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/top_main.css">

<script type="text/javascript">

	function find(){
		
		var search_text	= $("#search_text").val().trim();
		
		if(search_text==''){

			swal.fire('검색어를 입력하세요');
			$("#search_text").val("");
			$("#search_text").focus;
			
			return;
		}
		
		location.href = "recommend_search_list.do?search_text=" + encodeURIComponent(search_text,"utf-8");
	}// end-find


</script>

</head>
<body>
	
	<div class="top_main">
      <table>
         <tr>
            <td>
            	<img class="img_logo" src="${ pageContext.request.contextPath }/resources/_img/img_logo.png" onclick="location.href='../etc/list.do'">
            </td>
            <td></td>
            <td>
            	<div class="top_board"><input type="button" class="btn btn-warning" value="게시판" onclick="location.href='../board/board_list.do'"></div>
            </td>
            <td>
            	<div class="top_search_cafe"><input type="button" class="btn btn-warning" value="추천카페" onclick="location.href='../etc/recommend_list.do'"></div>
            </td>
            <td></td>
         </tr>
         
         <tr>
         	<td class="grade_style">
         		<div class="top_register">
	            	<c:if test="${ user.i_grade eq '관리자' }">
		            	<input id="cafe_upload" class="btn btn-warning upload"  value="카페등록" onclick="location.href='../detail/cafe_upload_form.do'" >  
		            </c:if>
	            </div>
         	</td>
         </tr>
      </table>
   </div>
   
   <div class="top_search_bar">
         <div class="ui icon input">
              <input id="search_text" class="search" type="text" placeholder="검색어를 입력하세요" value="${ param.search_text }">
              <i class="inverted circular search link icon" onclick="find()"></i>
         </div>
   </div>
	
</body>
</html>