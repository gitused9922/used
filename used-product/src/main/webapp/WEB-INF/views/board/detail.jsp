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

		<!-- write -->
		<h1 class="my-4">중고서울 상품 보기 게시판</h1>
		<br>
		<div class="">
			<div class="">
					<%-- <div class="form-group">
						<label>번호</label> <input class="form-control" id='no' name='no' value='${ board.no }')>
					</div> --%>
				   <div class="form-row">
				   <div class="form-group col-md-6">
				       <label for="inputEmail4"></label>
				       <img id="m-img1" alt="대표이미지" src="">
				   </div>
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

					<div class="form-group">

					</div>
				<div style="width: 100%;height: 100px;">
		          <%-- <c:if test="${ asd.userId == board.userId }"> --%>
		          <button id="edit-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-top: 30px;">수정</button>
		          <button id="delete-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px; margin-top: 30px;">삭제</button>
		          <%-- </c:if> --%>
		          <button id="tolist-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px; margin-top: 30px;">목록</button>
		        </div>
				</form>
			</div>
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
						<h2 class="d-inline">댓글</h2>
						<button id='addReplyBtn' data-toggle="modal" data-target="#myModal" class='btn btn-primary btn-xs pull-right float-right'>댓글 작성하기</button>
					</div>
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
          <form id="reply-form">
					<div class="form-group">
						<label>Reply</label>
						<input class="form-control" name='reply' id='modal-reply' value=''>
					</div>
					<div class="form-group">
						<label>Replyer</label>
						<input class="form-control" name='replyer' id='modal-replyer' value=''>
					</div>
					<input type="hidden" name='bno' value='${ board.no }'>
					<input type="hidden" name='rno'>
					<input type="hidden" name='action'><!-- 댓글 or 댓글의 댓글 -->
				</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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

		$('.form-group > input, textarea').attr({'readonly': 'readonly'});

		$('#content').css({'text-align' : 'center'
							,'width' : '1140px'
							,'height' : '100%'})	
		$('#content img').css({'width': '500px'});
		$('#m-img1').css({'width' : '500px'})
		var firstimg = $('#content').find('img:first').attr('src');
		//alert(firstimg);
		$('#m-img1').attr({'src' : firstimg});
		
		
	})
	
	
	</script>


</body>

</html>