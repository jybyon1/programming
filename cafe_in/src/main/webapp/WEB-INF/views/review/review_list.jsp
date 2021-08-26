<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
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

<!-- SweetAlert사용설정 : 알림박스 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">
<script src='${ pageContext.request.contextPath }/resources/_js/common.js'></script>

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/review_list.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

   function review_del(r_idx) {
      
      Swal.fire({
           title: '리뷰삭제',
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
            //현재경로 : /board/list.do
               //location.href="../review/delete.do?r_idx=" + r_idx;
               //Ajax로 삭제처리
               $.ajax({
                  
                  url     : "../review/delete.do",
                  data    : { 'r_idx' : r_idx },
                  dataType : 'json',
                  success  : function(result_data){
                     // result_data = { "result" : "success" } or { "result" : "fail" }
                     if(result_data.result == 'success'){
                        
                        //댓글목록 읽어오기 
                        review_list(1);
               
                     }else{
                    	 swal.fire("삭제실패");
                     }
                  },
                  error    : function(err){
                     alert(err.responseText);
                  }
                  
               });//end-ajax
           }
      });
   }//review_del
   
   function thumb_insert(r_idx) {
      
      //로그인여부 체크
      if('${ empty user }'=='true'){
         
         Swal.fire({
              title: '좋아요',
              html: "<h5>좋아요는 로그인후 클릭이가능합니다<br>로그인 하시겠습니까?</h5>",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '예',
              cancelButtonText : "아니오"
            }).then((result) => {
              if (result.isConfirmed) {
               //현재경로 : /review/list.do
                  location.href='${ pageContext.request.contextPath }/member/login_form.do?url=' + location.href ; //돌아올 경로
              }
            });

      }else{
         
         //Ajax로 전송
         $.ajax({
            url   : '../review/thumb_insert.do',
            data  : {'r_idx' :  r_idx, 
                   'i_id' :  "${ user.i_id }"
                    },
            dataType : 'json',
            success  : function(result_data){
               //result_data = { "result" : "success" }
               //result_data = { "result" : "fail" }
               
               if(result_data.result == "cancle_success"){
                  swal.fire("좋아요를 취소하셨습니다");
                  $("#thumb_count_"+ r_idx).html(result_data.count);
               }
               else if(result_data.result == "success"){   
                  //좋아요 증가
                  $("#thumb_count_"+ r_idx).html(result_data.count);
                  
               }else{
            	   swal.fire("좋아요 실패");
               }
            },
            error    : function(err){
               alert(err.responseText);
            }
         }); //end-ajax

      }
      
   }// end thumb_insert

</script>

</head>
<body>

	<c:forEach var="review_vo" items="${ map.list }">
	
	   <input type="hidden" name="r_idx" value="${ review_vo.r_idx }">
	   <table class="review_write">
	      <tr>
	         <td>작성자 : ${ review_vo.i_id }</td>
	      </tr>
	
	      <tr>
	         <td>
	            <c:if test="${ review_vo.r_star eq 1 }">
	               ★
	            </c:if>
	            
	            <c:if test="${ review_vo.r_star eq 2 }">
	               ★★
	            </c:if>
	            
	            <c:if test="${ review_vo.r_star eq 3 }">
	               ★★★
	            </c:if>
	            
	            <c:if test="${ review_vo.r_star eq 4 }">
	               ★★★★
	            </c:if>
	            
	            <c:if test="${ review_vo.r_star eq 5 }">
	               ★★★★★
	            </c:if>
	         </td>
	      </tr>
	
	      <tr>
	         <td class ='text_review'>리뷰 내용:</td>
	      </tr>
	      
	      <tr>   
	         <td class ='text_review1'>${ review_vo.r_content }</td>
	      </tr>   
	      
	      <tr>
	         <td class = 'text_review1'>작성일자:${ fn:substring( review_vo.r_regdate,0,16 ) }</td>
	         <td class ='thumb_button'>
	            <button class ='ghost-button' type="button">
	               <img id="td_thumb" src="${pageContext.request.contextPath}/resources/_img/img_thumb.png" onclick="thumb_insert('${ review_vo.r_idx }');">
	            </button>
	            <span id="thumb_count_${ review_vo.r_idx }">${ review_vo.count }</span>
	         </td>
	      </tr>
	      
	      <c:if test="${ user.i_id eq review_vo.i_id }">
	       <div style="text-align: right;">
	          <input style="width:20px;" class="btn btn-warning cancle" type="button" value="x" onclick="review_del('${ review_vo.r_idx }');">
	       </div>
	      </c:if>
	   
	   </table>   
	   <hr>
	</c:forEach>
   
    <!-- Page메뉴 넣기 -->
	<div class="page_style">
		${ map.pageMenu }
	</div>
   
</body>
</html>