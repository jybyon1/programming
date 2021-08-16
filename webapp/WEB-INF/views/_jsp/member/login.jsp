<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/login.css">

<script type="text/javascript">

$(document).ready(function(){
	
	setTimeout(show_message, 100); //0.1초후에 show_message함수 호출
	
});

function show_message(){
	
	if("${ param.reason eq 'fail_id' }"=="true"){
		alert('아이디가 틀립니다');
	}
	
	if("${ param.reason eq 'fail_pwd' }"=="true"){
		alert('비밀번호가 틀립니다');
	}
	
	if("${ param.reason eq 'end_session' }"=="true"){
		alert('시간이 만료되어서\n로그아웃되었습니다');
	}
	
	
	
}
function send(f) {
    
    var m_id  = f.m_id.value.trim();
    var m_pwd = f.m_pwd.value.trim();
    
    if(m_id==''){
       alert('아이디를 입력하세요!!');
       f.m_id.value='';
       f.m_id.focus();
       return;
    }
    
    if(m_pwd==''){
       alert('비밀번호를 입력하세요!!');
       f.m_pwd.value='';
       f.m_pwd.focus();
       return;
    }
    
    f.action="login.do"; //MemberLoginAction
    f.submit(); //전송
    
 }
</script>

</head>
<body>

	<div class="tp_layers">
      <div class="tp_button_layout">
         <%@ include file="../top_button.jsp" %>
      </div>
   </div>

	<div id="login_box">
		<form>
			<input type="hidden" name="url" value="${ param.url }">
			<div class="panel panel-warning">
				<div class="panel-heading">로그인</div>
				<div class="panel-body">
					<table class="table">
						<tr>
							<th>아이디</th>
							<td><input name="m_id"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="m_pwd"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input class="btn btn-warning" type="button" value="로그인" onclick="send(this.form);">
								<input class="btn btn-warning" type="button" value="메인화면" onclick="location.href='../main/index.do'">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</div>
	
	<div class="tp_layers">
      <div class="tp_bottom_layout">
         <%@ include file="../bottom.jsp" %>
      </div>
   </div>

</body>
</html>