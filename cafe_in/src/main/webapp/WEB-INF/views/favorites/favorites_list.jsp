<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cafe,in</title>

<!-- bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<!-- semantic ui -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.css">
<script src="${ pageContext.request.contextPath }/resources/Semantic-UI-CSS-master/semantic.js"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- SweetAlert사용설정 : 알림박스 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/favorites_list.css">

<script type="text/javascript">

	function favorites_delete(f_idx) {
	    
		Swal.fire({
			  title: '관심목록 삭제',
			  html: "<h5>정말 삭제 하시겠습니까?</h5>",
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '예',
			  cancelButtonText : "아니오"
			}).then((result) => {
				  //예 버튼 클릭 	
				  if (result.isConfirmed) {
					//현재경로 : /favorites/favorites_list.do
						//location.href="../favorites/favorites_delete.do?f_idx=" + f_idx;
						//Ajax로 삭제처리
						$.ajax({
							
							url 	 : "../favorites/favorites_delete.do",
							data	 : { 'f_idx' : f_idx },
							dataType : 'json',
							success  : function(result_data){
								// result_data = { "result" : "success" } or { "result" : "fail" }
								if(result_data.result == 'success'){
									swal.fire('목록에서 삭제 되었습니다');
									location.href="favorites_list.do";
						
								}else{
									 swal.fire('삭제실패');
								}
							},
							error    : function(err){
								alert(err.responseText);
							}
							
						});//end-ajax
				  }
			});
	}//favorites-del

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
	
			<div class="go_list_box">
				
				<table id="g_tb"  class="panel panel-primary" >
					<tr>
						<td class="panel-heading"   colspan="6">가고싶다 List</td>
					</tr>
					
					<tr bgcolor="#dedede" class="go_s_itle">
						<th class="th_style">no.</th>
						<th class="cf_name" colspan="1">카페명</th>
						<th></th>
					</tr>
				
					<!-- for(FavoritesVo vo : list) -->
					<c:forEach var="vo" items="${ list }">
						<tr align="center" class="content_style">
							<td>${ vo.no }.</td>
							<td class="cf_name">${ vo.c_name }</td>
							<td class="del_btn" ><input type="button" class="btn btn-warning" value="삭제" style="border: 1 solid black; cursor: hand" onclick="favorites_delete('${ vo.f_idx }');"></td>
						</tr>
					</c:forEach>
				
					<!-- 장바구니가 비어있는 경우 -->
					<c:if test="${ empty list }">
						<tr>
							<td colspan="6" align="center"><b>찜목록이 비었습니다</b></td>
						</tr>
					</c:if>
				</table>
			</div>

		</div>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp"%>
	</div>

</body>
</html>