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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/only_menu.css">

<script type="text/javascript">

	var exist_list = false;
	
	function filter_view() {
		
		//브라우저 크기구하기
		var w = $(window).width();
		var h = $(window).height();
		
		//모다창의 중앙위치 구하기
		var pop_left = (w / 2) - (400/2);
		var pop_top = (h / 2) - (500/2);
		
		if(exist_list==false){
				$.ajax({
					url : "${ pageContext.request.contextPath}/filter_list.do",
					dataType: 'json',
					success: function(res_data){
						// res_data = {"mood_list":[{"m_idx":1,"m_name":"date"},{},...], "dessert_list":[]} // name= idx, value = idx , 가운데는 display되는 이름
						
						//mood목록 추가
						for(var i=0; i< res_data.mood_list.length;i++){
							var m_idx    =  res_data.mood_list[i].m_idx;
							var mood_name = res_data.mood_list[i].m_name;
							
							$("#mood_box").append("<label><input type='checkbox' style='margin-left:5px' name='m_idx' value='"+ m_idx +"'>"+ mood_name +"</label>&nbsp;");
						}
						
						//dessert목록 추가
						for(var i=0; i< res_data.dessert_list.length;i++){
							
							var d_idx = res_data.dessert_list[i].d_idx;
							var dessert_name = res_data.dessert_list[i].d_name;
							$("#dessert_box").append("<label><input type='checkbox' style='margin-left:4px' name='d_idx' value='"+ d_idx +"'>"+ dessert_name +"</label>&nbsp;");
						}
						
						exist_list=true;
					},
					error: function(err){
						alert(err.responseText);
					}
					
				});
		
		}

		$("#filter_popup").css({left:pop_left, top:pop_top});
		$("#filter_popup").show();
		
	} 
	
	window.onload = function() {
		 
	    function onClick() {
	        document.getElementById('filter_popup').style.display ='block';
	        document.querySelector('.black_bg').style.display ='block';
	    }   
	    function offClick() {
	        document.getElementById('filter_popup').style.display ='none';
	        document.querySelector('.black_bg').style.display ='none';
	    }
	 
	    document.getElementById('filter').addEventListener('click', onClick);
	    document.getElementById('bt_x').addEventListener('click', offClick);
	 
	};

</script>

</head>
<body>
	
	<%@ include file="filter_pop.jsp"  %>
	
	<div class="only_menu">
	    <div>
	       <table>
	             <tr>
	                <td>
	                	<img class="img_logo_only_menu" src="${pageContext.request.contextPath}/resources/_img/img_logo.png" onclick="location.href='${ pageContext.request.contextPath }/etc/list.do'">
	                </td>
	             	<td></td>
	             </tr>
	       </table>
	    </div>
	    
	    <div class="only_menu2">
	       <div class="ui inverted menu">
	          <a class="item" id="filter" style="margin-left: 28%;" onclick="filter_view()">필터</a> 
	          <a class="item" onclick="location.href='${pageContext.request.contextPath}/etc/recommend_list.do'">추천카페</a> 
	          <a class="item" onclick="location.href='${pageContext.request.contextPath}/board/board_list.do'">게시판</a>
	       </div>
	    </div>   
	</div>

</body>
</html>