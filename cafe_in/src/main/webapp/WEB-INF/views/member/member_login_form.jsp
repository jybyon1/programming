<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>     
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/member_login_form.css">

<script type="text/javascript">
	$(document).ready(function(){		   
		   setTimeout(show_message,100);
	});
	
	function show_message(){
		   
			if("${ param.reason eq 'fail_id' }"=="true"){
			   //alert('아이디가 틀립니다');
			   swal.fire('아이디가 틀립니다');
		   }
		   
		   if("${ param.reason eq 'fail_pwd' }"=="true"){
			   //alert('비밀번호가 틀립니다');
			   swal.fire('비밀번호가 틀립니다');
		   }
		   
		   if("${ param.reason eq 'end_session' }"=="true"){
			   //alert('시간이 만료되어서\n로그아웃되었습니다');
			   swal.fire('시간이 만료되어서\n로그아웃되었습니다');
		   }
		   
	}   
	
	function  send(f){
		    
		   var i_id  = f.i_id.value.trim();
		   var i_pwd = f.i_pwd.value.trim();
		   
		   if(i_id==''){
			   //alert('아이디를 입력하세요!!');
			   swal.fire('아이디를 입력하세요!!');
			   f.i_id.value='';
			   f.i_id.focus();
			   return;
		   }
		   
		   if(i_pwd==''){
			   //alert('비밀번호를 입력하세요!!');
			   swal.fire('비밀번호를 입력하세요!!');
			   f.i_pwd.value='';
			   f.i_pwd.focus();
			   return;
		   }

		   f.action = "login.do"; 
		   f.submit();

	}

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
	
	<div class="tp_layer">
		<div class="tp_main_layout">
			
			<table class="login_title_box">
				<tr>
					<td>
						<div class="login_title">Cafe, in 로그인</div>
					</td>
				</tr>			
			</table>
			
			<div class="tp_space"></div>
			<div class="tp_space"></div>
			<div class="tp_space"></div>
			<div class="tp_space"></div>
			<div class="tp_space"></div>
			
			<form>
				<input type="hidden" name="url" value="${param.url }">
				<table class="login_box" >
					<tr>
						<td class="label_title">아이디</td>
						<td>
							<input type="text" id="i_id" class="input_lgn" name="i_id" placeholder="LoginID">
							<button class='clear_icon' type='reset'>x</button>
						</td>
					</tr>
					
					<tr>
						<td class="label_title">비밀번호</td>
						<td>
							<input type="password" id="i_pwd" class="input_lgn" name="i_pwd" placeholder="Password">
							<button class="clear_icon" type="reset">x</button>
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="tp_space"></div>
						</td>
					</tr>
					
					<tr>
						<td class="button_tot" colspan="2">
							<button type="button" class="btn btn-warning" onclick="send(this.form)">로그인</button>
							<button type="button" class="btn btn-warning" onclick="location.href='insert_form.do'">회원가입</button>
						</td>
						
					</tr>
				</table>
			</form>
			
		</div>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>