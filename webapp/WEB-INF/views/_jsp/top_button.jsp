<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/common.css">
<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/top_button.css">

</head>
<body>
	<div>
		<div>
		<a href="${ pageContext.request.contextPath }/main/index.do"><img class="main_logo" alt="" src="${ pageContext.request.contextPath }/resources/img/logo.png"></a>
		</div>
		<ul class="main_top_button">
			<c:if test="${ user.m_grade eq '관리자' }">
			<li><a href="../member/list.do">회원관리</a></li>
			</c:if>
			<li><a href="../board/list.do">게시판</a></li>
			<c:if test="${ empty user }">
			<li><a href="../member/insert_form.do">회원가입</a></li>
			</c:if>
		    <li><a href="../seller/list.do">고수찾기</a></li>
		    <c:if test="${ empty user }">
		    	<li><a href="../member/login_form.do">로그인</a></li>
		    </c:if>
		    <c:if test="${ not empty user }">
		    	<li><a href="../member/logout.do">로그아웃</a></li>
		    	<div>
					<b>[${ user.m_id }]</b>님 로그인 하셨습니다
					<%-- <input type="button" class="btn btn-warning" value="정보수정" onclick="location.href='${ pageContext.request.contextPath }/member/modify_form.do?m_idx=${ user.m_idx }'"> --%>
					<a href="${ pageContext.request.contextPath }/member/member_info_form.do?m_idx=${ user.m_idx }">[마이정보]</a>
				</div>
		    </c:if> 
		</ul>
		
	</div>

</body>
</html>