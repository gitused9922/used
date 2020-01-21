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
<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css"	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/used-product/resources/css/shop-homepage.css"	rel="stylesheet">

</head>
<style> .carousel-inner > .carousel-item > img{  width: 300px; height: 300px;  }
.card-header py-3{ width: 1110px;}
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
	 <div class="carousel-inner"> <!-- 슬라이드 쇼 --> 
	 <div class="carousel-item active"> <!--가로--> 
	 <img class="d-block w-100" src="https://images.pexels.com/photos/213399/pexels-photo-213399.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="First slide"> 
	 <div class="carousel-caption d-none d-md-block">
	  <h5>TEST</h5>
	   <p>testtesttest</p>
	    </div>
	     </div>
	      <div class="carousel-item">
	       <img class="d-block w-100" src="https://images.pexels.com/photos/2355519/pexels-photo-2355519.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260" alt="Second slide">
	        </div> 
	        <div class="carousel-item"> 
	        <img class="d-block w-100" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide"> 
	        </div>
	        <!-- / 슬라이드 쇼 끝 --> <!-- 왼쪽 오른쪽 화살표 버튼 --> 
	        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	         <span class="carousel-control-prev-icon" aria-hidden="true"></span> 
	         <!-- <span>Previous</span> --> </a> 
	         <a class="carousel-control-next" href="#demo" data-slide="next"> 
	         <span class="carousel-control-next-icon" aria-hidden="true"></span> 
	         <!-- <span>Next</span> --> </a> 
	         <!-- / 화살표 버튼 끝 --> <!-- 인디케이터 --> <ul class="carousel-indicators">
	          <li data-target="#demo" data-slide-to="0" class="active"></li>
	           <!--0번부터시작--> <li data-target="#demo" data-slide-to="1">
	           </li> 
	           <li data-target="#demo" data-slide-to="2"></li>
	            </ul> <!-- 인디케이터 끝 --> 
	            </div>
	            </div>
		<br>
		<div class="text-right">
						<div class="dataTables_length" id="dataTable_length" style="margin-bottom: 15px">
						<form action="list.action" method="get">
							<select name="searchType" aria-controls="dataTable" class=" form-control-sm">
								<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>상품</option>
								<option value="C" ${ param.searchType == 'C' ? 'selected' : '' }>가격</option>
								<option value="TC" ${ param.searchType == 'TC' ? 'selected' : '' }>상품+가격</option>
								<option value="W" ${ param.searchType == 'W' ? 'selected' : '' }>작성자</option>
							</select>
							<input type="search" name="searchKey" class=" form-control-sm" placeholder="" aria-controls="dataTable"
							       value="${ param.searchKey }">
							 <input type="submit" class="btn btn-success btn-sm" value="검색" >
                             
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
							<div class="card h-100">
								<div>상품: ${ board.name }</div> 
								<a class="product-detail" href="javascript:" data-no="${board.no}">
									<img class="card-img-top m-img1" src="http://placehold.it/700x400" alt="">
								</a>
								<div class="card-body">
									<div>작성자 : ${ board.userId }</div>
									<div>가격 : ${ board.price }원</div>
									<div>판매시작일 : ${ board.rdate }</div>
									<c:if test="${not empty loginuser && board.userId != loginuser.memberId }">
										<td><a href="javascript:void(0)" data-tNo="${board.no }" data-receiver="${ board.userId }" class="btn btn-success btn-sm message-button" style="float: right">쪽지</a></td>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->
		
		<div class="text-center">${ pager }</div>
	</div>
	</div>

	<form id="product-detail-form" action="detail.action" method="get">
		<input type="hidden" id="no" name="no" />
	</form>
	<br><br>
	
	<div class="modal fade" id="sendModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">쪽지 보내기</h4>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
				</div>
				
				<div class="modal-body">
					<form id="send-form" method="post" action="">
						<div class="form-group">
							<label for="mReceiver">받는 ID</label>
							<input type="text" class="form-control" id="mReceiver" name="mReceiver" readonly="readonly">
							<input type="hidden" id="tNo" name="tNo">
						</div>
						
						<div class="form-group">
							<label for="mReceiver">제목</label>
							<input type="text" class="form-control" id="msTitle" name="msTitle" placeholder="제목을 입력하세요">
						</div>
						
						<div class="form-group">
							<label for="msContent">내용</label>
							<textarea class="form-control" rows="3" id="msContent" name="msContent" placeholder="내용을 입력하세요" style="resize: none;"></textarea>
						</div>
					</form>
				</div>
			
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="send">보내기</button>
					<button type="button" class="btn btn-default" id="send-cancel" data-dismiss="modal">취소</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

	<!-- Footer -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
		
/* 		$('.m-img1').css({'width' : '358px', 'height': '204px'})
		var content = $('.content2').find('img:first').attr('src'); 
		alert(content);
		var firstimg = content2.find('img:first').attr('src');
		alert(firstimg);
		$('.m-img1').css({'width' : '500px'}) */
		//$('#display-none-content').css({'display': 'none'})
		//var firstimg = $('#content').find('img:first').attr('src');
		//alert(firstimg);
		//$('.m-img1').attr({'src' : firstimg});

		
		$('.product-detail').on('click', function(event){
			var no = $(this).attr('data-no');
			$('#product-detail-form #no').val(no);
		
			$('#product-detail-form').submit();
		});

		$('.carousel slide').carousel({ interval});

/* 		$('.message-button').on('click', function() {
			console.log(1);
			var index = $(this).attr('data-index');
			var values = $('#message-form-'+index).serialize();
		
			$('#message-form-'+index).submit();
		});  */

		//쪽지
		$('.message-button').on('click', function() {
			var tNo = $(this).attr('data-tNo');
			var mReceiver = $(this).attr('data-receiver');
			$('#sendModal input[name=tNo]').val(tNo);
			$('#sendModal input[name=mReceiver]').val(mReceiver);
			
			$('#sendModal').modal('show');
		});

		$('#send').on('click', function() {
			if($('#msTitle').val() == "") {
				alert('제목을 입력하세요.');
				$(this).focus();
				return;
			}
		
			if($('#msContent').val() == "") {
				alert('내용을 입력하세요.');
				$(this).focus();
				return;
			}

			$.ajax({
				"url": "../message/sendMessage",
				"method": "post",
				"data": $('#send-form').serialize(),
				"success": function(resp, status, xhr) {
				},
				"error": function(xhr, status, err) {
					alert("오류 발생 : " + err);
				},
	            "complete" : function(){
	            	$('#msTitle').val('');
	                $('#msContent').val('');
	            	$('#sendModal').modal('hide');
		        }
			});
		});

		$('.close, #send-cancel').on('click', function() {
			$('#msTitle').val('');
            $('#msContent').val('');
		});
	});
	</script>
</body>

</html>