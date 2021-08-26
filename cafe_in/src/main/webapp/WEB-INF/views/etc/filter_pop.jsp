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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources//Semantic-UI-CSS-master/semantic.css">
<script src="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.js"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/filter_pop.css">

</head>
<body>
	<%@ include file="modal_popup.jsp"%>
	
	<div class="filter_box">
		<div id="filter_popup">
		
			<form method="get" action="${ pageContext.request.contextPath }/filter_register.do" class="filter_f">
				<input id="bt_x" class="btn btn-warning cancle" type="button"  value="x">
				<p class="f_name">필터</p>
				<h1></h1>
				
				<p>분위기</p>
					<div class="mood_box" id="mood_box"></div>
				<h1></h1>
				
				<p>디저트</p>
					<div class="dessert_box" id="dessert_box"></div>
				<h1></h1>
				
				<p>노키즈존</p>
					<div class="nokidz_box" id="nokidz_box">
						<input type="radio" name="c_nokidz" value="1">있음
						<input type="radio" name="c_nokidz" value="0">없음
					</div>	
				<h1></h1>
				
				<p>주차공간</p>
					<div class="parking_box" id="parking_box">
						<input type="radio" name="c_parking" value="1">있음
						<input type="radio" name="c_parking" value="0">없음
					</div>
				<h1></h1>
				
				<p>알코올판매여부</p>
					<div class="alcohol_box" id="alcohol_box">
						<input type="radio" name="c_alcohol" value="1">있음
						<input type="radio" name="c_alcohol" value="0">없음
					</div>

				<p class="send_reset">
					<input class="btn btn-warning fil_btn left" type="submit" value="검색"> 
					<input class="btn btn-warning fil_btn" type="reset" value="초기화">
				</p>
			</form>
			
		</div>
	</div>
</body>
</html>