<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/top_button.css">

</head>
<body>
	
	<div class="main_top_button">
	
		<table class="button_box">
			<tr>
				<td></td>
				<td align="right">
				
					<table>
						<tr align="right">
							<td>
								<c:if test="${ not empty sessionScope.user }">
									<b>[${ user.i_name }]님</b> 로그인하셨습니다
								</c:if>
							</td>
							
							<td>
								<!-- 로그인이 안된 상태 --> 
								<c:if test="${ empty sessionScope.user }">
									<input class="btn btn-warning login_btn" type="button" value="로그인" onclick="location.href='${ pageContext.request.contextPath }/member/login_form.do'">
								</c:if> 
								<!-- 로그인이 된 상태 --> 
								<c:if test="${ not empty sessionScope.user }">
									<%-- <b>[${ user.i_name }]님</b> 로그인하셨습니다 --%>
         	                        <input class="btn btn-warning login_btn" type="button" value="로그아웃" onclick="location.href='${ pageContext.request.contextPath }/member/logout.do'">
								</c:if>
							</td>
							
							<td>
								<!-- 로그인이 안된경우 로그인 폼으로 이동-->
								<c:if test="${empty user }">
									<div class="quick_item_login">
										<input type="button" class="btn btn-warning login_btn" value="정보수정" onclick="location.href='${ pageContext.request.contextPath }/member/login_form.do'">
									</div>
								</c:if>
								<!-- 로그인이 된경우 회원정보 수정폼으로 이동 -->
								<c:if test="${ not empty user}">
									<div class="quick_item_login">
										<input type="button" class="btn btn-warning login_btn"  value="정보수정" onclick="location.href='${ pageContext.request.contextPath }/member/modify_form.do?i_idx=${ user.i_idx }'">
									</div>
								</c:if>
							</td>
						</tr>
					</table>
					
				</td>
			</tr>		
		</table>
		
	</div>

</body>
</html>