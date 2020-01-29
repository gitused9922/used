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
	
	<header class="masthead" style=" width: 100%;  height: 600px;">
	    <div class="container">
	      <div class="intro-text">
	        <div class="intro-lead-in">동네 주민들과 가깝고 따뜻한 거래를 지금 경험해보세요.</div>
	        <div class="intro-heading text-uppercase">우리 동네 중고 직거래 마켓</div>
	        <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="/used-product/board/list.action">중고서울 인기 매물</a>
	      </div>
	    </div>
	</header>

<!-- Page Content -->
<div class="container" style="clear: both;">
	
	  <!-- Portfolio Grid -->
	  <section class="bg-light page-section" id="portfolio">
	    <div class="container">
	      <div class="row">
	        <div class="col-lg-12 text-center">
	          <h2 class="section-heading text-uppercase">카테고리보기</h2>
	          <!-- <h3 class="section-subheading text-muted">카테고리별 중고제품 구매하기</h3> -->
	        </div>
	      </div>
	      <br><br>
	      <div class="row">
	        <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" href="/used-product/board/list.action?searchType=T&searchKey=전자제품">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="http://www.newsworks.co.kr/news/photo/201702/113036_23243_3953.jpg" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>전자제품</h4>
	            <!-- <p class="text-muted">Illustration</p> -->
	          </div>
	        </div>
	        <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" href="/used-product/board/list.action?searchType=T&searchKey=가구">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="http://www.paroma.co.kr/default/img/images/main_brand.jpg" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>가구/침구/인테리어</h4>
	            <!-- <p class="text-muted">Graphic Design</p> -->
	          </div>
	        </div>
	        <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" href="/used-product/board/list.action?searchType=T&searchKey=의류">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="http://image.auction.co.kr/itemimage/1a/a1/44/1aa144fa56.jpg" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>의류</h4>
	            <!-- <p class="text-muted">Identity</p> -->
	          </div>
	        </div>
	        <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" href="/used-product/board/list.action?searchType=T&searchKey=장난감">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="https://post-phinf.pstatic.net/MjAxOTA2MTdfMjEw/MDAxNTYwNzU1MzMyNzg1.RndBbE-TCXifCrlc0jadihS05gdbYmk_HaitSKt0MJ4g.p-xFuboAllxiHm1Z1nipdHJ6EcGah2oHjeBOlggdXXog.JPEG/1.jpg?type=w1200" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>장난감</h4>
	            <!-- <p class="text-muted">Branding</p> -->
	          </div>
	        </div>
	        <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" href="list.action">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="https://m.ssamplus.com/images/common/icon_more.png" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>최근 등록 상품 보기</h4>
	            <!-- <p class="text-muted">Website Design</p> -->
	          </div>
	        </div>
	<!--         <div class="col-md-4 col-sm-6 portfolio-item">
	          <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
	            <div class="portfolio-hover">
	              <div class="portfolio-hover-content">
	                <i class="fas fa-plus fa-3x"></i>
	              </div>
	            </div>
	            <img class="img-fluid" src="img/portfolio/06-thumbnail.jpg" alt="">
	          </a>
	          <div class="portfolio-caption">
	            <h4>Window</h4>
	            <p class="text-muted">Photography</p>
	          </div>
	        </div> -->
	      </div>
	    </div>
	  </section>
	
	<div>
		<p style="text-align: center;">${ pager }</p>
	</div>
	

	<!-- chart -->
	<section class="bg-light page-section" id="portfolio" style=" padding-left: 50px; padding-right: 50px; height: 800px;">
		<div class="row">
	       <div class="col-lg-12 text-center">
	         <h2 class="section-heading text-uppercase">중고 서울 현황보기</h2>
	         <!-- <h3 class="section-subheading text-muted">카테고리별 중고제품 구매하기</h3> -->
	       </div>
	     </div>
	     <br><br>
		<div id="memberChart" style="width: 500px;   height: 500px;   float: left;   margin: 0 auto;   cursor: pointer;   position: relative;"></div>
		<div id="productChart" style="width: 500px;   height: 500px;   float: right;   margin: 0 auto;   cursor: pointer;   position: relative;"></div>
	</section>
		
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

		//chart
		var memberData = ${memberData };
		var productData = ${productData };

		var memberArrData = new Array();
		for(var i = 0; i < memberData.length; i++) {			
			memberArrData.push([memberData[i].sName, Number(memberData[i].cnt)]);
		}
		memberArrData.unshift(['Task', 'Hours per Day']);
		
		var productArrData = new Array();
		for(var i = 0; i < productData.length; i++) {			
			productArrData.push([productData[i].sName, Number(productData[i].cnt)]);
		}
		productArrData.unshift(['Task', 'Hours per Day']);
		
		google.charts.load("current", {packages:["corechart"]});
	    google.charts.setOnLoadCallback(drawMemberChart);
	    google.charts.setOnLoadCallback(drawProductChart);

		function drawMemberChart() {
			var data = google.visualization.arrayToDataTable(memberArrData);

	        var chart = new google.visualization.PieChart(document.getElementById('memberChart'));
	        chart.draw(data, {title: '회원수 : ${totalMember } 명'});

		}

		function drawProductChart() {
			console.log(productArrData);
			var data = google.visualization.arrayToDataTable(productArrData);

	        var chart = new google.visualization.PieChart(document.getElementById('productChart'));
	        chart.draw(data, {title: '거래수 : ${totalProduct } 건'});
		}
	});
	</script>
</body>

</html>