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
<link rel="stylesheet" href="../resource/Semantic-UI-CSS-master/semantic.css">
<script src="../resource/Semantic-UI-CSS-master/semantic.js"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- SweetAlert-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<!-- common -->
<link rel="stylesheet" href="../_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/review_insert_form.css">

<!-- star rating -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
	
	<div class="tp_layer" id ="review_write">
		<form method="POST" enctype="multipart/form-data">
			<div class="tp_main_layout">
				
				<h1 id="title">리뷰</h1>
				
				<table class="table table-striped table-hover">
				
					<tr>
					   <th style="text-align:right">첨부파일</th>
					   <td>
					   		<input type="file" name="photo" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/> 
					   		<div id="image_container"></div>
					   </td>
					</tr>
				
					<tr>
					    <th style="text-align:right">별점</th>
						<td>
							<select name="r_star">
								<option value="1">★</option>
								<option value="2">★★</option>
								<option value="3">★★★</option>
								<option value="4">★★★★</option>
								<option value="5">★★★★★</option>
							</select>
						</td>
					</tr>
					<tr>	
						<td>
							<textarea name="r_content" style="margin-top:5px;" class="form-control" rows="3" id="comment" placeholder="Enter your review"></textarea>
						</td>
					</tr>
				</table>
	         
         		<table class="table table-striped table-hover">
		            <tr>
		               <td>
		                   <input style="float: right" type="button" class="btn btn-warning" value="저장">
		               </td>
		            </tr>
		        </table>

			</div>
		</form>
	</div>
	
	<div class="tp_bottom_layout">
		<%@ include file="../etc/bottom.jsp" %>
	</div>

</body>
</html>