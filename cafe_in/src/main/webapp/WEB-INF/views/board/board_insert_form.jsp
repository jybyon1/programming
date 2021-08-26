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

<!-- sweetalert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/board_insert_form.css">

<script type="text/javascript">

	function send(f){
		
		var b_subject = f.b_subject.value.trim();
		var b_content = f.b_content.value.trim();
		var photo   = f.photo.value;
		
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
		
		if(photo==''){
			swal.fire('첨부할 사진을 선택하세요');
			return;
		}

		f.action = 'board_insert.do';
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
		<div class="tp_menu_layout">
			<%@ include file="../etc/only_menu.jsp" %>
		</div>
	</div>
	
	<div class="tp_layer">
		<div class="tp_main_layout">
		
			<form method="post" enctype="multipart/form-data">
				<div class="insert_box">
					<div class="panel panel-primary">
						<div class="panel-heading"><h3>게시판 작성</h3></div>
						<div class="panel-body">
						    <table class="table">
		                        <tr>
			                        <th class="tb_title">제목</th>
			                        <td>
			                        	<input name="b_subject" class="title_input">
			                        </td>
		                        </tr>
		                        
		                        <tr>
		                            <th class="tb_title">내용</th>
		                            <td>
		                            	<textarea name="b_content" rows="8" cols="60"></textarea>
		                            </td>
		                        </tr>
		                        
		                        <tr>
		                            <th class="tb_title">사진첨부</th>
		                            <td>
		                            	<input type="file" name="photo">
		                            </td>
		                        </tr>
		                        
		                        <tr class="send_button">
		                            <td colspan="2" align="center">
		                                <input class="btn btn-warning" type="button" value="저장하기" onclick="send(this.form);" >
		                                <input class="btn btn-warning" type="button"  value="목록보기" onclick="location.href='board_list.do'" >
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