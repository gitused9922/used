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
<!-- Custom styles for this template -->
  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>


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
		    width: 40%;
			display: inline-block;
}

.img-fluid {
	width: 350px;
    height: 262px;
    border: 1px solid #c5c5c5;
    border-radius: 10px;
}
header.masthead {
	background-color: #e6622c;
    text-align: center;
    color: #fff;
    /*background-image: url(https://p4.wallpaperbetter.com/wallpaper/575/50/369/simple-background-gradient-abstract-blurred-wallpaper-preview.jpg);*/
    background-repeat: no-repeat;
    background-attachment: scroll;
    background-position: center center;
    background-size: cover;
}
@media (min-width: 768px)
header.masthead .intro-text {
    padding-top: 150px;
    padding-bottom: 200px;
}
header.masthead .intro-text {
    padding-top: 200px;
    padding-bottom: 200px;
}

.btn-primary {
	background-color: #ffffff;
    border-color: #9c2d00;
    color: #2f2f2f;
}
a {
    color: #333333;
}

a:hover {
    color: #FF5722;
}

.btn-primary:active, .btn-primary:focus, .btn-primary:hover {
    background-color: #ffffff!important;
    border-color: #ffffff!important;
    color: #1f1f1f;
}
</style>

<body>

	<!-- Navigation -->
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<c:choose>
		<c:when test="${empty param.searchKey }">
			<header class="masthead" style=" width: 100%;  height: 600px;">
			    <div class="container">
			      <div class="intro-text">
			        <div class="intro-lead-in">동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</div>
			        <div class="intro-heading text-uppercase">우리 동네 중고 직거래 마켓</div>
			        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/used-product/board/list.action">중고서울 인기 매물</a>
			      </div>
			    </div>
			</header>
		</c:when>
		<c:otherwise>
			<header class="masthead" style=" width: 100%;  height: 600px; background-color: #2f2f2f;">
			    <div class="container">
			      <div class="intro-text">
			        <div class="intro-lead-in">동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</div>
			        <div class="intro-heading text-uppercase">검색된 매물이 없습니다.</div>
			        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/used-product/board/list.action">중고서울 최근상품</a>
			      </div>
			    </div>
			</header>
		</c:otherwise>
	</c:choose>

	
	<!-- Page Content -->
	<div class="container" >


			<div class="row" style="width: 1110px; margin-top: 20px;">
				<div class="">
				<c:choose>
					<c:when test="${ empty loginuser }">
					</c:when>
					<c:otherwise>
					<div class="card-header py-3" style="width: 1110px; margin-bottom: 20px;">
						<span class="m-0 font-weight-bold">상품 목록</span> 
						<a href="write.action" class="btn btn-success btn-sm" style="float: right"> 
							<span class="text">상품 등록</span>
						</a>
					</div>
					</c:otherwise>	
				</c:choose>
				
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
										<span id="span-name">거래지역</span>
										<span>${ board.siteName }</span><br>
										<span id="span-name">카테고리</span>
										<span>${ board.cgName }</span><br>										
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
			<div>
				<p style="text-align: center;">${ pager }</p>
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
    <%@include file="/WEB-INF/views/modules/common-js.jsp" %>
	<script type="text/javascript">
	$(function(){
		
 		$('.m-img1').css({ 'border-radius': '8px'
 	 						,'width': '100%'
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