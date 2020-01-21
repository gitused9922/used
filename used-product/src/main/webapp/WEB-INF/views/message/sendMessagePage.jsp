<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>쪽지</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<div class="container">

		<div class="row" style="margin:35px; 0px; 35px; 0px;">
			<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
			
			<div class="col-lg-9">
				<h2>쪽지 보내기</h2>
				
				<div class="text-right" style="margin:10px; 0px; 10px; 0px;">
					<form action="sendMessagePage" method="get">
						<select name="searchType" class=" form-control-sm">
							<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>아이디</option>
							<option value="C" ${ param.searchType == 'C' ? 'selected' : '' }>상품명</option>
						</select>
						<input type="search" name="searchKey" class=" form-control-sm" value="${ param.searchKey }">
						<input type="submit" class="btn btn-success btn-sm" value="검색" >
					</form>
				</div>
	
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th>아이디</th>
							<th>상품명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Senders }" var="sender">
						<tr>
							<td>${sender.MSender }</td>
							<td class="pname-list" data-tNo="${sender.TNo }" data-receiver="${sender.MSender }">
								${sender.PName }
							</td>
						</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
	                    	<td colspan="6" style="text-align: center;">${ pager }</td>
	                  	</tr>
					</tfoot>
				</table>
			</div>
		</div>

		<div class="modal fade" id="sendModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">쪽지 보내기</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
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

	</div> <!-- /.container -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
	
	<!-- Bootstrap core JavaScript -->
	<script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$('.pname-list').on('click', function() {
				$('#mReceiver').val($(this).attr('data-receiver'));
				$('#tNo').val($(this).attr('data-tNo'));
				
				$('#sendModal').modal('show');
			});

			$('#send').on('click', function() {
				$.ajax({
					"url": "sendMessage",
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