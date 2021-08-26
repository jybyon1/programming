<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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

<!-- daum 주소찾기 라이브러리  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 

<!-- common -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/common.css">

<!-- this page -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/_css/detail_list.css">

<script type="text/javascript">
	
	// 관심목록추가
	function add_favorites(){
		
		//로그인 여부 체크
		if('${ empty user }'=='true'){	//로그인 안된상태
			
			Swal.fire({
                 title: '로그인',
                 html: "찜목록 담기는 로그인이 필요합니다<br> 로그인 하시겠습니까?",
                 icon: 'warning',
                 showCancelButton: true,
                 confirmButtonColor: '#3085d6',
                 cancelButtonColor: '#d33',
                 confirmButtonText: '예',
                 cancelButtonText: '아니오'
				}).then((result) => {
				  if (result.isConfirmed) {
				  	location.href='${ pageContext.request.contextPath }/member/login_form.do?url=' + location.href 
				    
				  }
				});

		}else{	
			//로그인이 된상태
			//찜목록 담기
			//location.href='favorites_insert.do?c_idx=${ vo.c_idx }&i_idx=${ user.i_idx }';
			
			//Ajax처리
			$.ajax({
				url		: '../favorites/favorites_insert.do',	//FavoritesInsertAction
				data	: {'c_idx' : '${vo.c_idx}', 'i_idx' : '${user.i_idx}'},
				dataType: 'json',	//결과 json으로 받겠다(수신 DataType)
				success : function(result_data){
					//result_data = {"result" : "success"}
					//result_data = {"result" : "fail"}

					if(result_data.result == 'success'){
									
						Swal.fire(
								
							   '가고싶다 등록 성공',
							   '가고싶다에 저장되었습니다',
							   'warning'
						);
						return;
						
					}else if(result_data.result == 'exists'){
									
						Swal.fire(
							   '...',
							   '이미등록되었습니다',
							   'warning'
						);
						return;
					}
								
					else if(result_data.result == 'fail'){
						
						Swal.fire(
									  '가고싶다 등록 실패',
									  '이미 가고싶다에 저장되어 있습니다',
									  'warning'
						);
						return;
					}
		
				},
				error	: function(err){
					alert("여기는 그냥 에러" + err.responseText);
				}
			});

		}
		
	}// end-add_favorites
		
	function add_review() {
		
		//로그인여부 체크
		if('${ empty user }'=='true'){
			
			Swal.fire({
				  title: '리뷰작성',
				  html: "<h5>리뷰작성은 로그인후 이용가능합니다<br>로그인 하시겠습니까?</h5>",
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
			//로그인된 상태면...
			
			//입력값 읽어오기
			var r_content = $("#r_content").val().trim();
			var r_star    = $("input[name='r_star']:checked").val(); 
			
			if($("input:radio[name='r_star']").is(":checked")==false){	       
		        swal.fire('별점을 입력하세요');
		        return;
		     }
			
			if(r_content==''){
				swal.fire('리뷰내용을 입력하세요');
				$("#r_content").val('');
				$("#r_content").focus();
				return;
			}
			
			//Ajax로 전송
			$.ajax({
				url   : '../review/insert.do',
				data  : {'r_content' : r_content, 
						 'r_star' : r_star,
						 'c_idx'  : '${ param.c_idx }',
					     'i_id'   : '${ user.i_id }'
					     },
				dataType : 'json',
				success  : function(result_data){
					//result_data = { "result" : "success" }
					//result_data = { "result" : "fail" }
					
					//이전 댓글 내용 지우기
					$("#r_content").val('');
					
					if(result_data.result == "success"){
						
						//리뷰목록 읽어오기 
						review_list(1);
						
					}else{
						swal.fire("리뷰작성 실패");
					}
				},
				error    : function(err){
					swal.fire("댓글은 300자 이내로 작성해주세요");
				}
			}); //end-ajax

		}
		
	}// end add_review


	function review_list(page) {
			
		//Ajax로 요청
		$.ajax({
			url  : "../review/list.do",
			data : { 'c_idx' : '${ param.c_idx }','page' : page },
			success  : function(result_data){
				//수신된 결과 데이터(댓글목록) disp에 출력
				$("#disp").html(result_data);
				
			},
			error    : function(err){
				alert(err.responseText);
			}
		});
	}
	
	//jQuery초기화
	$(document).ready(function(){
		//리뷰목록 출력 
		review_list(1);
		
         $("#review_btn").click(function(){
             $("input[name='r_star']").prop("checked",false);
          });
	});
		

	function del(c_idx){
		
		Swal.fire({
			  title: '삭제',
			  text: "정말 삭제하시겠습니까?",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '예',
			  cancelButtonText: '아니오'
			}).then((result) => {
			  if (result.isConfirmed) {
					//delete.do =>
					location.href = "../detail/delete.do?c_idx="+c_idx;
			  }
			  //lamda code
			  //function(result){} => (result) => {}
			});
	}//end del()

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
			
				<div class="cafe_name">
					
					<span>${ vo.c_name }</span>
					
					<c:if test="${vo.r_star_avg ge 4.5 }">
						<img src="${ pageContext.request.contextPath }/resources/_img/img_hot.png" class="hot_size">
					</c:if>
					
					<button class="ui yellow button" onclick="add_favorites();">가고싶다</button>
				
					<!-- 로그인 상태에서만 -->
					<c:if test="${ not empty user }">
						<button class="ui purple button" onclick="location.href='../favorites/favorites_list.do'">가고싶다list</button>
					</c:if>
					
				</div>
		
				<div class="img_cafe_info">
	
					<div class="cafe_img">
	               		<img class="index_image" src="${pageContext.request.contextPath }/resources/upload/${vo.c_photo}">
	                </div>
	
					<table class="cafe_info">
						<tr class="tb_h">
		                     <td class="title_align">카페주소</td>
		                     <td class="review_content">
		                          <form>
		                     	  	  <input  value="${ vo.c_addr }" type="text" id="in_id" class="input_lgn" readonly>
		                     	  	  <input  value="${ vo.c_addr_detail }" type="text" id="in_id" class="input_lgn" readonly>
		                         </form>
		                     </td>
		                     <td class="link_button">
		                       <form> 
									<button class="btn btn-warning"  onclick="window.open('https://map.naver.com/v5/directions/'); return false;">길찾기</button>	                       
							   </form>         
		                     </td>
		                </tr>
		                   
						<tr class="tb_h">
							<td class="title_align">전화번호</td>
							<td class="review_content">
							     <form>
								  	  <input value="${ vo.c_tel }" type="text" id="in_id" class="input_lgn" readonly>
							    </form>
							</td>
							<td class="link_button"></td>
						</tr>              
		                   
						<tr class="tb_h">
							<td class="title_align">주차</td>
							<td class="review_content">
								<form>
								 	  <c:if test="${vo.c_parking eq 1}">
								 	 <input value="있음" type="text" id="in_id" class="input_lgn" readonly>
								  </c:if>
								  
								  <c:if test="${vo.c_parking eq 0}">
								  	<input value="없음" type="text" id="in_id" class="input_lgn" readonly>
								  </c:if>
								</form>
							</td>
						</tr>
		                   
						<tr class="tb_h">
							<td class="title_align">주류</td>
							<td class="review_content">
								<form>
									<c:if test="${vo.c_alcohol eq 1}">
										<input value="있음" type="text" id="in_id" class="input_lgn" readonly>
								 	</c:if>
								 
									 <c:if test="${vo.c_alcohol eq 0}">
									 	<input value="없음" type="text" id="in_id" class="input_lgn" readonly>
									 </c:if>
								</form>
							</td>
						</tr>
		                   
						<tr class="tb_h">
							<td class="title_align">노키즈존</td>
							<td class="review_content">
							    <form>
									<c:if test="${vo.c_nokidz eq 1}">
										<input value="있음" type="text" id="in_id" class="input_lgn" readonly>
									</c:if>
									
									<c:if test="${vo.c_nokidz eq 0}">
										<input value="없음" type="text" id="in_id" class="input_lgn" readonly>
									</c:if>
							    </form>
							</td>
						</tr>
		                   
						<tr class="tb_h">
						  <td class="title_align">분위기</td>
						  <td class="review_content">
								<form>
									<c:forEach var="mood" items="${ vo.mood_list }">
									 	<input  value="${mood.m_name }" type="text" id="in_id" class="input_lgn" readonly>
									 </c:forEach>
						  		</form>
						  </td>
						  <td class="link_button"></td>
						</tr>
		                   
						<tr>
							<td colspan="3">
								<div class="tp_space"></div>
								<div class="tp_space"></div>
							</td>
						</tr>
		                   
						<tr class="tb_h">
							<td class="title_align">디저트</td>
							<td class="review_content">
							    <form>
							 		 <c:forEach var="dessert" items="${ vo.dessert_list }">
								  	 	<input value="${ dessert.d_name }" type="text" id="in_id" class="input_lgn" readonly>
								  	 </c:forEach>
							    </form>
							</td>
							<td class="link_button"></td>
						</tr>
	
						<tr class="tb_h">
							<td class="title_align"></td>
						                 
						    <td class="review_content">
								<c:if test="${  user.i_grade eq '관리자' }">
									<input type="button" class="btn btn-warning"  id="bt_write_review" value="수정하기" onclick="location.href='detail_modify_form.do?c_idx=${vo.c_idx}'">
								</c:if>
						    </td>
						 
							<td class="link_button">
								<c:if test="${  user.i_grade eq '관리자' }">
								  	<input type="button" class="btn btn-warning"  id="bt_write_review" value="삭제하기" onclick="del('${ vo.c_idx }');">
								</c:if>
							</td>  
						</tr>
					</table>
				</div>
	     
	         <div class ="reviews1">
	         
		         <div class="tp_space"></div>
		     	 <div class="tp_space"></div>
		
		         <!-- 댓글 입력창 -->
		         <div>
					 <div>
						 <c:if test="${ empty user }">
						   리뷰는 로그인 하신 후 작성가능 합니다.
						 </c:if>
					   
					    <c:if test="${ not empty user }">
					       작성자 : ${ user.i_id }
					    </c:if>
					 </div>   
					
					 <div class="star-rating">
						<input type="radio" id="5-stars" class="r_star" name="r_star" value=5 />
						<label for="5-stars" class="star">&#9733;</label>
						<input type="radio" id="4-stars" class="r_star" name="r_star" value=4 />
						<label for="4-stars" class="star">&#9733;</label>
						<input type="radio" id="3-stars" class="r_star" name="r_star" value=3 />
						<label for="3-stars" class="star">&#9733;</label>
						<input type="radio" id="2-stars" class="r_star" name="r_star" value=2 />
						<label for="2-stars" class="star">&#9733;</label>
						<input type="radio" id="1-star" class="r_star" name="r_star" value= 1 />
						<label for="1-star" class="star">&#9733;</label>
					 </div>
					            
					<div>
					    <textarea id="r_content" rows="4" cols="110"></textarea>
					    <input class="btn btn-warning review" style="float:right;" type="button" value="리뷰작성" onclick="add_review();">
					</div>
		        </div>
			         
		        <div class="tp_space"></div>
		        <div class="tp_space"></div>
		         	
		        <div id="disp"></div>
	         	
	        </div>
	        
			<div class="tp_bottom_layout">
				<%@ include file="../etc/bottom.jsp" %>
			</div>
			
		</div>
	</div>

</body>
</html>