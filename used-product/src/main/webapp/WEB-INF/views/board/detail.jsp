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

  <%@include file="/WEB-INF/views/modules/common-css.jsp" %>

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="/WEB-INF/views/modules/topbar.jsp" /> 
  <!-- Page Content -->
  <div class="container">

    <div class="row" style="margin-top:50px">
	
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
			<section id="article-images" id="board-${ board.no }" data-no="${ board.no }">
			    <img id="m-img1" alt="대표이미지" src="">
			</section>
			<section style="padding-top: 10px; padding-bottom: 5px; width: 677px; margin: 0 auto; border-bottom: 1px solid #e9ecef;">
				<span class="float-right" style="margin-top: 4px; font-size: 18px; font-weight: bold; line-height: 1.76; letter-spacing: -0.6px;">${ board.price }원</span>
				<h2>${ board.name }</h2><small class="float-right">${ board.rdate }</small>
				<p style="margin-top: 4px; font-size: 15px; line-height: 1.46; letter-spacing: -0.6px;">판매자 ${ board.userId }</p>
				<p style="margin-top: 4px; font-size: 15px; line-height: 1.46; letter-spacing: -0.6px; color: #868e96;">${ board.cgName }</p>
			</section>
			<section style="padding: 32px 0; width: 677px; margin: 0 auto; border-bottom: 1px solid #e9ecef;">
				<div id="content">${ board.content }</div>
			</section>
			<div style="height: 100px; width: 677px; margin: 0 auto; padding-top: 32px; position: relative;">
	          <c:if test="${ loginuser.memberId == board.userId }">
	          
	          <button id="delete-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px; background-color: #6b6b6b; border-color: #8a8a8a;">삭제</button>
	          <button id="edit-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px;">수정</button>
	          
	          </c:if>
	          <button id="tolist-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px;">목록</button>

	          <button id='addReplyBtn' data-toggle="modal" data-target="#reply-modal" class='btn btn-success btn-sm' style="float: right; margin-right: 10px;">댓글</button>

	          <button id="message-button" type="button" class="btn btn-success btn-sm" style="float: right; margin-right: 10px;">쪽지</button>

	        </div>

			</div>
			<!-- /.container -->
		  </div></div></div>
  
		  <!-- reply -->

		<div class='rowx'>
			<div class="col-lg-9" style="width: 1160px;  margin: 0 auto">

		<div class='rowx' style="padding: 32px 0; width: 1000px; margin: 0 auto; border-bottom: 1px solid #e9ecef;">
			<div class="col-lg-9" style="width: 1200px;  margin: 0 auto">

				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>
					
						
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
	<div class="modal fade" id="reply-modal" role="dialog">
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
        	<button id="modalRegisterBtn" type="button" class="btn btn-success" >등록</button>
        	<button id="modalModBtn" type="button" class="btn btn-success" >수정</button>
           	<button id="modalCloseBtn" type="button" class="btn btn-success" >닫기</button>
        </div>
      </div>
      
    </div>
  </div>
  
  		<!-- 쪽지 모달 -->
		<div class="modal fade" id="sendModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">쪽지 보내기</h4>
					</div>
					
					<div class="modal-body">
						<form id="send-form" method="post">
							<div class="form-group">
								<label for="mReceiver">받는 ID</label>
								<input type="text" class="form-control" id="mReceiver" name="mReceiver" value="${board.userId }" readonly="readonly">
								<input type="hidden" id="tNo" name="tNo" value="${ board.no }">
							</div>
							
							<div class="form-group">
								<label for="msTitle">제목</label>
								<input type="text" class="form-control" id="msTitle" name="msTitle" placeholder="제목을 입력하세요">
							</div>
							
							<div class="form-group">
								<label for="msContent">내용</label>
								<textarea class="form-control" rows="3" id="msContent" name="msContent" placeholder="내용을 입력하세요" style="resize: none;"></textarea>
							</div>
						</form>
					</div>
				
					<div class="modal-footer">
						<button type="button" class="btn btn-info btn-sm" id="send">보내기</button>
						<button type="button" class="btn btn-success btn-sm" id="send-cancel" data-dismiss="modal">취소</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal --></div></div>

	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){


		$('#content img').css({'width': '500px'});
		$('#m-img1').css({'width' : '100%'})
		var html = $('#content').html();
		console.log(html);
		var img = $(html).find('img:first').attr('src');
		console.log(img);
		$('#m-img1').attr({'src' : img});

		

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
			location.href = "delete.action?no=${board.no}&pageNo=${ param.pageNo }&searchType=${ param.searchType }&searchKey=${ param.searchKey }";

		});

		
		
	});
	
	// 댓글관련구현	
	$(function(){
		$('#reply-list-container').load("/used-product/reply/list-by/${ board.no }");

		$('#addReplyBtn').on('click',function(event){
			$('#reply-form input[name!=no]').attr({"readonly" : false});
			$('#modal-replyer').attr({"readonly" : "readonly"});
			$('#modalRegisterBtn').css({"display" : "inline" });
			$('#modalModBtn').css({ "display": "none" });

			$('#reply-form input[name=rno]').val('0');
			$('#reply-form input[name=action]').val('reply');

			$('#reply-modal').modal('show');
			});

		$('#modalCloseBtn').on('click', function(event) {
			$('#reply-modal').modal('hide');
			window.location.reload();
			
			}); 


		$('#modalRegisterBtn').on('click', function(event){

			if($('#modal-reply').val().length == 0) {
				alert("댓글 내용을 입력하세요")
				return;
				}

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

			$('#reply-modal').modal('hide');
			window.location.reload();
			
			});

			$('#reply-list-container').on('click', '.reply-update', function(event) {
				var rno = $(this).attr("data-rno"); 
				var li = $("li[data-rno=" + rno + "]"); 
				var p = li.find('p'); 
				
				$('#reply-form input[name!=no]').attr({ "readonly": false }).val("");
				$('#modal-replyer').attr({ "readonly": true }).val("");
				$('#modal-reply').val( $.trim(p.text()) );			
	
				$('#modalRegisterBtn, #modalRemoveBtn').css({ "display": "none" });
				$('#modalModBtn').css({ "display": "inline" });
	
				$('#reply-form input[name=rno]').val(rno);
				//console.log('test2');
				$('#reply-modal').modal('show');
	
			});

				$('#modalModBtn').on('click', function(event){
				var data = {
				"rno" : $("#reply-form input[name=rno]").val(),
				"reply": $("#reply-form input[name=reply]").val()
				};
				$.ajax({
					"url": "/used-product/reply/update",
					"method": "put",
					"data": JSON.stringify(data),
					"contentType" : "application/json",
					"processData" : false,
					"success" : function(result, status, xhr) {
						$('#reply-modal').modal('hide');
						$('#reply-list-container').load("/used-product/reply/list-by/${ board.no }");
						},
					"error" : function(xhr, status, err) {
						alert('수정 실패');
						}

					});
					


					});


				$('#reply-list-container').on('click', '.reply-delete', function(event){
					var rno = $(this).attr('data-rno');

					var yes = confirm(rno + "번 댓글을  삭제할까요?")
					if (!yes) return;
					
					$.ajax({
						"url" : "/used-product/reply/delete/" + rno,
						"method" : "delete",
						"success" : function(data, status, xhr) {

							$('#reply-list-container').load("/used-product/reply/list-by/${ board.no }");
							},
						"error" : function(xhr, status, err) {

							}

						});

					
					
					});
			



				
		});

		//쪽지
		$(function() {
			$('#message-button').on('click', function() {
				$('#msTitle, #msContent').prop('readonly', false);
				$('#sendModal').modal('show');
			});

			$('#send-cancel').on('click', function() {
				$('#msTitle').val('');
	            $('#msContent').val('');
				$('#sendModal').modal('hide');
			});

			$('#send').on('click', function() {
				if($('#msTitle').val() == "") {
					alert('제목을 입력하세요.');
					return;
				}
				
				if($('#msContent').val() == "") {
					alert('내용을 입력하세요.');
					return;
				}

				$.ajax({
					"url": "/used-product/message/sendMessage",
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
		});

	</script>


</body>

</html>