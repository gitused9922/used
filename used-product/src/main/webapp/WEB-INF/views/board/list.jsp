<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상품게시판</title>

<!-- Bootstrap core CSS -->
<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/used-product/resources/css/sb-admin-2"	rel="stylesheet">
<link href="/used-product/resources/css/shop-homepage.css"	rel="stylesheet">


</head>
<style>
.carousel-inner>.carousel-item>img {
	width: 300px;
	height: 300px;
}

.card-header py-3 {
	width: 1110px;
}
#span-name {
		    width: 20%;
			display: inline-block;
}
</style>

<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<!-- Page Content -->
	<div class="container">

		<br>
		<!-- Page Content -->
		<div class="container">

			<div id="demo" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<!-- 슬라이드 쇼 -->
					<div class="carousel-item active">
						<!--가로-->
						<img class="d-block w-100"
							src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
							alt="First slide">
						<div class="carousel-caption d-none d-md-block">
							<h5>TEST</h5>
							<p>testtesttest</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
							alt="Third slide">
					</div>
					<!-- / 슬라이드 쇼 끝 -->
					<!-- 왼쪽 오른쪽 화살표 버튼 -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<!-- <span>Previous</span> -->
					</a> <a class="carousel-control-next" href="#demo" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<!-- <span>Next</span> -->
					</a>
					<!-- / 화살표 버튼 끝 -->
					<!-- 인디케이터 -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<!--0번부터시작-->
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					<!-- 인디케이터 끝 -->
				</div>
			</div>
			<br>
			<div class="col-sm-12 col-md-6">
				<div class="dataTables_length" id="dataTable_length"
					style="margin-bottom: 15px">
					<form action="list.action" method="get">
						<select name="searchType" aria-controls="dataTable"
							class=" form-control-sm">
							<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>상품</option>
							<option value="C" ${ param.searchType == 'C' ? 'selected' : '' }>가격</option>
							<option value="TC"
								${ param.searchType == 'TC' ? 'selected' : '' }>상품+가격</option>
							<option value="W" ${ param.searchType == 'W' ? 'selected' : '' }>작성자</option>
						</select> <input type="search" name="searchKey" class=" form-control-sm"
							placeholder="" aria-controls="dataTable"
							value="${ param.searchKey }"> <input type="submit"
							class="btn btn-success btn-sm" value="검색">

					</form>
				</div>
			</div>

			<div class="row">
				<div class="">
					<div class="card-header py-3" style="width: 1110px;">
						<span class="m-0 font-weight-bold text-primary">상품 목록</span> 
						<a href="write.action" class="btn btn-success btn-sm" style="float: right"> 
							<span class="text">상품 등록</span>
						</a>
					</div>
					<div class="row">
						<c:forEach items="${ boards }" var="board">
							<div class="col-lg-4 col-md-6 mb-4">
								<div class="card h-100" id="board-${ board.no }" data-no="${ board.no }">
									<a class="product-detail" href="javascript:" data-no="${ board.no}"> 
										<img class="card-img-top m-img1" src=""alt="">
									</a>

									<div class="card-body" style="line-height:30px">
										<span style="font-size:20px"><b>${ board.name }</b></span><br>
										<span id="span-name">판매자</span>
										<span>${ board.userId }</span><br>
										<span id="span-name">가격 </span>
										<span><fmt:formatNumber value="${ board.price }" pattern="#,###,###,###원" /></span><br />
										<span id="span-name">판매시작일 </span>
										<span><fmt:formatDate value="${ board.rdate }" pattern="yyyy.MM.dd"/></span>
									</div>
									<div style="width:0;height:0;display:none" class="board-content">${ board.content }</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<!-- /.row -->

				</div>
				<!-- /.col-lg-9 -->

			</div>
			<!-- /.row -->

			<tfoot>
				<tr>
					<td colspan="6" style="text-align: center;">${ pager }</td>
				</tr>
			</tfoot>
		</div>
	</div>

  <form id="product-detail-form" action="detail.action" method="get">
  	<input type="hidden" id="no" name="no">
  	<input type="hidden" id="pageNo" name="pageNo" value="${ pager.pageNo }">
  	<input type="hidden" id="searchType" name="searchType" value="${ param.searchType }">
  	<input type="hidden" id="searchKey" name="searchKey" value="${ param.searchKey }">
  </form>
	<br>
	<br>

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		
 		$('.m-img1').css({ 'border-radius': '8px'
 	 						,'width': '348px'
 	 	 					,'height': '300px'})

 		$("div[id^=board-]").each(function(idx, item) {
 	 		var no = $(this).attr('data-no');
 	 		var html = $(this).find(".board-content").html();
 	 		if (html) {
 	 			var img = $(html).find('img:first');
 	 			$(this).find('a img').attr({ "src": img.attr("src") });
 	 		}
 	 		var img = $(html).find('img:first');
 	 		if(!img){
 	 			var img = $(html).find('img:first');
 	 			$(this).find('a img').attr({ "alt": "이미지가없습니다" });
 	 	 		}
 	 		console.log(img);
 	 	});

		
		$('.product-detail').on('click', function(event){
			var no = $(this).attr('data-no');
			$('#product-detail-form #no').val(no);
		
			$('#product-detail-form').submit();
		});

		//$('.carousel slide').carousel({ interval: 5}); 
	});
	</script>
</body>

</html>