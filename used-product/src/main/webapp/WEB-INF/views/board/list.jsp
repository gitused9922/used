<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" 
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상품게시판</title>

<!-- Bootstrap core CSS -->
<link
	href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/used-product/resources/css/shop-homepage.css"	rel="stylesheet">

</head>

<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<!-- Page Content -->
	<div class="container">


		<div id="carouselExampleCaptions" class="carousel slide  my-4" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
		    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="http://placehold.it/900x350" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>First slide label</h5>
		        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="http://placehold.it/900x350" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Second slide label</h5>
		        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
		      </div>
		    </div>
		    <div class="carousel-item">
		      <img src="http://placehold.it/900x350" class="d-block w-100" alt="...">
		      <div class="carousel-caption d-none d-md-block">
		        <h5>Third slide label</h5>
		        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
		      </div>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>

		<div class="row">

			<br>
			<br>
			<div class="">
				<div class="card-header py-3">
					<span class="m-0 font-weight-bold text-primary">상품 목록</span> 
					<a href="write.action" class="btn btn-success btn-sm" style="float: right"> 
						<span class="text">상품 등록</span>
					</a>
				</div>
				<div class="row">
					<c:forEach items="${ boards }" var="board" varStatus="idx">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-100">
								<td>상품: ${ board.name }</td> 
								<a class="product-detail" href="javascript:" data-no="${board.no}">
									<img class="card-img-top" src="http://placehold.it/700x400" alt="">
								</a>
								<div class="card-body">
									<td>작성자 : ${ board.userId }</td>
									<br>
									<td>가격 : ${ board.price }원</td>
									<br>
									<td>판매시작일: ${ board.rdate }</td>
									<br>
									<c:if test="${ not empty loginuser &&  board.userId != loginuser.memberId}">
										<td><a href="javascript:void(0)" data-index="${idx.index }" class="btn btn-success btn-sm message-button" style="float: right">메세지</a></td>
									</c:if>
								</div>
							</div>
						</div>

					<form id="message-form-${idx.index }" action="../message/listMember">
						<input type="hidden" name="tNo" value="${board.no }">
						<input type="hidden" name="mSender" value="${ board.userId }">
						<input type="hidden" name="msContent" value="${ board.name }">
					</form>
					</c:forEach>
					<!-- 리다이렉트 처리 : ../message/listMember -->
					
				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>

	<form id="product-detail-form" action="detail.action" method="get">
		<input type="hidden" id="no" name="no" />
	</form>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		$('.product-detail').on('click', function(event){
			var no = $(this).attr('data-no');
			$('#product-detail-form #no').val(no);
		
			$('#product-detail-form').submit();
		});

		$('.message-button').on('click', function() {
			var index = $(this).attr('data-index');
			var values = $('#message-form-'+index).serialize();

			$('#message-form-'+index).submit();
		});
	});
	</script>
</body>

</html>