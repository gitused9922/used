<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>중고서울 판매상품 등록하기</title>

<!-- Bootstrap core CSS -->
<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="/WEB-INF/views/modules/topbar.jsp" /> 
  <!-- Page Content -->
  <div class="container">

    <div class="row">
	
	<!-- sidebar -->
	<%-- <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" /> --%>

	<!-- Page Content -->
	<div class="container">
<style>
 #article-images {
    position: relative;
    width: 729px;
    margin: 0 auto;
        position: relative;
    width: 677px;
    margin: 0 auto;
    height: 500px;
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid #eee;
}
#m-img1 {
    width: 100%;
    height: auto;
    border-radius: 8px;
    position: relative;
    left: 50%;
    top: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    color: transparent;
}


</style>
		<!-- write -->
		<%-- <div class="form-group">
			<label>번호</label> <input class="form-control" id='no' name='no' value='${ board.no }')>
		</div> --%>
	   <div class="form-row">
				   <section id="article-images">
				       <img id="m-img1" alt="대표이미지" src="">
				   </section>
				   <div class="form-group col-md-6">
				      <label>번호</label>
				      <input class="form-control" id='no' name='no' value='${ board.no }'>
				      <label for="inputEmail4">상품명</label>
				      <input class="form-control" id="name" name='name' value='${ board.name }'>
				      <label for="inputPassword4">카테고리</label>
				      <input class="form-control" id="name" name='cgName' value='${ board.cgName }'>
				      <label>가격</label>
				      <input class="form-control" id='price' name='price' value='${board.price}'>
				      <label>작성자</label>
				      <input class="form-control" id='userId' name='userId' value="${board.userId }">
				   </div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1" ></label>
						<div id="content" class="form-control" style="width:1140px; height:100%;">${board.content }</div>
					</div>
				<div style="width: 100%;height: 100px;">
		          <c:if test="${ loginuser.memberId == board.userId }">
		          <button id="edit-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-top: 30px;">수정</button>
		          <button id="delete-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px; margin-top: 30px;">삭제</button>
		          </c:if>
		          <button id="tolist-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px; margin-top: 30px;">목록</button>
		        </div>

			</div>
			<!-- /.container -->
		  </div></div></div>
  
		  <!-- reply -->
		<div class='rowx'>
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
					
						<button id='addReplyBtn' data-toggle="modal" data-target="#myModal" class='btn btn-primary btn-xs pull-right float-right'>댓글 작성하기</button>
					</div>
					<br>
					<div id="reply-list-container" class="panel-body">
						<jsp:include page="reply-list.jsp"/>
					
					</div>
						<div class="panel-footer"></div>
					</div>	
				</div>	
			</div>


	 <!-- Modal -->				
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          
          <h4 class="modal-title">상품문의하기</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <div class="modal-body">
          <form id="reply-form" >
					
					<div class="form-group">
						<label>Replyer</label>
						<input type="text" class="form-control"  name='replyer' id='modal-replyer' value='${ loginuser.memberId }'>
					</div>
					
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name='reply' id='modal-reply' value=''>
					</div>
					<input type="hidden" name='no' value='${ board.no }'>
					<input type="hidden" name='rno'>
					<input type="hidden" name='action'><!-- 댓글 or 댓글의 댓글 -->
		</form>
        </div>
        <div class="modal-footer">
        	<button id="modalRegisterBtn" type="button" class="btn btn-success" data-dismiss="modal">Register</button>
        	<button id="modalModBtn" type="button" class="btn btn-success" data-dismiss="modal">Modify</button>
          	<button id="modalRemoveBtn" type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){


		$('#content').css({'text-align' : 'center'
							,'width' : '1140px'
							,'height' : '100%'})	
		$('#content img').css({'width': '500px'});
		//$('#m-img1').css({'width' : '100%'})
		var firstimg = $('#content').find('img:first').attr('src');
		//alert(firstimg);
		$('#m-img1').attr({'src' : firstimg});
		

		$('.form-group > input, textarea').attr({'readonly': 'readonly'});

		$('#tolist-button').on('click', function(event){
			location.href = "list.action?pageNo=${ param.pageNo }&searchType=${ param.searchType }&searchKey=${ param.searchKey }";
		});

		$('#edit-button').on('click', function(event){
			location.href = "update.action?no=${board.no}&pageNo=${ param.pageNo }&searchType=${ param.searchType }&searchKey=${ param.searchKey }";
		})


		$('#delete-button').on('click', function(event){
			var yes = confirm("${ board.name } 상품을 삭제할까요?");
			if (!yes) {
				return;
			}
			location.href = "update.action?no=${board.no}&pageNo=${ param.pageNo }&searchType=${ param.searchType }&searchKey=${ param.searchKey }";

		});

		
		
	});
	
	// 댓글관련구현	
	$(function(){
		$('#addReplyBtn').on('click',function(event){
			$('#reply-form input[name!=no]').attr({"readonly" : false});
			$('#modal-replyer').attr({"readonly" : "readonly"});
			$('#modalRegisterBtn').css({"display" : "inline" });

			$('#reply-form input[name=rno]').val('0');
			$('#reply-form input[name=action]').val('reply');
			});

		$(modalRegisterBtn).on('click', function(event){

			var values = $('#reply-form').serializeArray();

			$.ajax({
				"url": "/used-product/reply/write",
				"method": "post",
				"data"	: values,
				"success" : function(data, status, xhr) {
					
					$('#reply-list-container').load("/used-product/reply/list-by/${ board.no }");
					},
				"error" : function(xhr, status, err) {
						alert('댓글실패');
					}	
					

				});
				

			});

	});


	</script>


</body>

</html>