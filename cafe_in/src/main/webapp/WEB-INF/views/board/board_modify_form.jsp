<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/board_insert_form.css">

<script type="text/javascript">

	function send(f){
		
		var b_subject = f.b_subject.value.trim();
		var b_content = f.b_content.value.trim();
		
		if(b_subject==''){
			   swal.fire('제목을 입력하세요');
			   f.b_subject.value='';
			   f.b_subject.focus();
			   return;
		}
		
		if(b_content==''){
			   swal.fire('내용을 입력하세요');
			   f.b_content.value='';
			   f.b_content.focus();
			   return;
		}

		
		Swal.fire({
			  title: '정말 수정하시겠습니까?',
			  text: "",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  cancelButtonText: '취소',
			  confirmButtonText: '수정'
			}).then((result) => {
			  if (result.isConfirmed) {
				    f.action = 'board_modify.do';
					f.submit();
			  }
		});
			
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
		<div class="tp_menu_layout">
			<%@ include file="../etc/only_menu.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_main_layout">
		
			<form>
			    <input type="hidden"   name="b_idx"  value="${ vo.b_idx }">
				<div class="insert_box">
					<div class="panel panel-primary">
						<div class="panel-heading"><h3>게시판 수정</h3></div>
						<div class="panel-body">
						    <table class="table">
		                        <tr>
			                        <th class="tb_title">제목</th>
			                        <td><input name="b_subject" class="title_input" value="${ vo.b_subject }"></td>
		                        </tr>
		                        
		                        <tr>
		                            <th class="tb_title">내용</th>
		                            <td><textarea name="b_content" rows="8" cols="60">${ vo.b_content }</textarea></td>
		                        </tr>
		                        
		                        <tr class="send_button">
		                            <td colspan="2" align="center">
		                                <input class="btn btn-warning" type="button"  value="수정하기"
		                                       onclick="send(this.form);" >
		                                <input class="btn btn-warning" type="button"  value="목록보기"
		                                       onclick="location.href='board_list.do'"  >
		                            </td>
		                        </tr>				    
						    </table>
						</div>
					</div>
				</div>
			</form>
		
		</div>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>