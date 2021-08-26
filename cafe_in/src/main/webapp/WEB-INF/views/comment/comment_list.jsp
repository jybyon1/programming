<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
    
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

<!-- sweetalert2  -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- google fonts -->    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&display=swap" rel="stylesheet">

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/comment_list.css">

<script type="text/javascript">

	function comment_del(c_idx){

		Swal.fire({
			   title: '댓글삭제',
			   html: "<h4>정말 삭제 하시겠습니까?</h4>",
			   icon: 'question',
			   showCancelButton: true,
			   confirmButtonColor: '#3085d6',
			   cancelButtonColor: '#d33',
			   confirmButtonText: '예',
			   cancelButtonText : "아니오"
			 }).then((result) => {
			   
				 //예 버튼클릭
				 if (result.isConfirmed) {
			      //location.href="../comment/delete.do?c_idx=" + c_idx;
			      //Ajax로 삭제처리
			      $.ajax({
			    	  
			    	  url      : "../comment/delete.do",
			    	  data     : {'c_idx' : c_idx},
			    	  datatype : 'json',
			    	  success  : function(result_data){
			    		  //result_data = {"result":"success"} or {"result":"fail"}
			    		  if(result_data.result == 'success') {
			    			//댓글목록 읽어오기
							comment_list(1);
			    		  }else{
			    			  alert('삭제실패!!')
			    		  }
			    	  },
			    	  error    : function(err){
			    		  alert(err.responseText);
			    	  }
			    	  
			      }); //end ajax
			   
				}
		});
		
	}
	
</script>

</head>
<body>

	<div>
		<!-- for(CommentVo comment_vo : list ) -->
		<c:forEach var="comment_vo"  items="${ map.list }">
		
			<div class="com_title">
				<c:if test="${ user.i_idx eq comment_vo.i_idx }">
					<div style="text-align: right;">
					     <input class="btn btn-warning cancle" type="button"  value="x  " onclick="comment_del(${ comment_vo.c_idx });">
					</div>
				</c:if>
			
				<div>${ comment_vo.i_name }님 작성글:</div>
				
				<div>작성일자:${ fn:substring( comment_vo.c_regdate,0,16 ) }</div>
				
				<div class="com_content">${ comment_vo.c_content }</div>
			</div>
			
			<div class="tp_space"></div>
			
		</c:forEach>
	</div>
	
	<!-- Page메뉴 넣기 -->
	<div class="page_style">
		${ map.pageMenu }
	</div>

</body>
</html>