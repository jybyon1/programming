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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/recommend_list.css">

</head>
<body>

	<div class="tp_layer">
		<div class="tp_button_layout">
			<%@ include file="top_button.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_menu_layout">
			<%@ include file="only_menu.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_index_layout">

			<div class="c_layout" >	
				<c:forEach var="vo" items="${ list }" > 
	               <div class="cafe_list" onclick="location.href='${ pageContext.request.contextPath }/detail/detail_list.do?c_idx=${vo.c_idx}'">
		            	<div class="index_photo">
							<img   class="index_image" src="${pageContext.request.contextPath }/resources/upload/${vo.c_photo}" >
							<div class="c_title">
								<span class="c_name" >${ vo.c_name }</span> <span class="c_star" >${ vo.r_star_avg }</span>
							</div>
						</div>		
 					</div>   
		        </c:forEach>
			</div>
			
		</div>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>