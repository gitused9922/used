<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>쪽지함</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
</head>

<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<div class="container">

		<div class="row" style="margin:35px; 0px; 35px; 0px;">
			<jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />
			
			<div class="col-lg-9">
				<h2>쪽지함</h2>

				<div style="margin:10px; 0px; 10px; 0px;">					
					<form id="search-form" action="messagePage" method="get">
						<select name="messageType" class=" form-control-sm">
							<option value="S" ${ param.messageType == 'S' ? 'selected' : '' }>보낸 쪽지</option>
							<option value="R" ${ param.messageType == 'R' ? 'selected' : '' } <c:if test="${ empty messageType}">selected</c:if>>받은 쪽지</option>
						</select>
						<br>
						
						<div class="text-right" style="margin-bottom: 5px">
							<select name="searchType" class=" form-control-sm" >
								<option value="P" ${ param.searchType == 'P' ? 'selected' : '' }>상품명</option>
								<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>제목</option>
								<c:choose>
									<c:when test="${empty messageType || messageType == 'R'}">
										<option value="S" ${ param.searchType == 'S' ? 'selected' : '' }>보낸 사람</option>	
									</c:when>
									<c:otherwise>
										<option value="R" ${ param.searchType == 'R' ? 'selected' : '' }>받는 사람</option>	
									</c:otherwise>
								</c:choose>
							</select>
							
							<input type="search" name="searchKey" class=" form-control-sm" value="${ param.searchKey }">
							<input type="submit" id="search-button" class="btn btn-success btn-sm" value="검색" >
						</div>

						<div class="text-right">
							날짜 : <input type="text" id="sDate" name="sDate" class=" form-control-sm" value="${ param.sDate }" autocomplete="off" readonly="readonly"> 
							     ~ <input type="text" id="eDate" name="eDate" class=" form-control-sm" value="${ param.eDate }" autocomplete="off" readonly="readonly">
						</div>
					</form>
				</div>
	
				<table class="table table-hover text-center">
					<thead>
						<tr>
							<th><input type="checkbox" id="all-check"></th>
							<th>읽음</th>
							<th>상품명</th>
							<th>제목</th>
							<c:choose>
								<c:when test="${empty messageType || messageType == 'R'}">
									<th>보낸 사람</th>			
								</c:when>
								<c:otherwise>
									<th>받는 사람</th>			
								</c:otherwise>
							</c:choose>
							<th>날짜</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messages }" var="message">
						<tr>
							<td>
								<input type="checkbox" name="msNo" value="${message.msNo }">
							</td>
							<td>
								<c:choose>
									<c:when test="${message.msConfirm eq false }">
										<img id="mail-img" src="/used-product/resources/img/message.png">
									</c:when>
									<c:otherwise>
										<img src="/used-product/resources/img/check_message.png">
									</c:otherwise>
								</c:choose>
								
							</td>
							<td>${message.PName }</td>
							<td class="message-detail" data-no="${message.msNo }">${message.msTitle }</td>
							<c:choose>
								<c:when test="${empty messageType || messageType == 'R'}">
									<td>${message.MSender }</td>					
								</c:when>
								<c:otherwise>
									<td>${message.MReceiver }</td>					
								</c:otherwise>
							</c:choose>
							<td>${message.msDate }</td>
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

		<div class="modal fade" id="messageModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">쪽지</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					</div>
					
					<div class="modal-body">
						<form id="send-form" method="post" action="">							
							<div class="form-group">
								<c:choose>
									<c:when test="${empty messageType || messageType == 'R'}">
										<label for="mReceiver">보낸 사람</label>			
									</c:when>
									<c:otherwise>
										<label for="mReceiver">받는 사람</label>			
									</c:otherwise>
								</c:choose>
								<input type="text" class="form-control" id="msNo"readonly="readonly">
							</div>
							
							<div class="form-group">
								<label for="msTitle">제목</label>
								<input type="text" class="form-control" id="msTitle" readonly="readonly">
							</div>
							
							<div class="form-group">
								<label for="msContent">내용</label>
								<textarea class="form-control" rows="3" id="msContent" readonly="readonly" style="resize: none;"></textarea>
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
	<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
	
	<script type="text/javascript">
		$(function() {
			jQuery.browser = {};
			(function () {
			    jQuery.browser.msie = false;
			    jQuery.browser.version = 0;
			    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
			        jQuery.browser.msie = true;
			        jQuery.browser.version = RegExp.$1;
			    }
			})();

		  /*var messageType = '${messageType}';
			if(messageType == "") {
				$('#search-button').trigger('click');
			} */

			$('#sDate').datepicker({
				dateFormat: 'yy-mm-dd'
			});
			$('#eDate').datepicker({
				dateFormat: 'yy-mm-dd'
			});
			
			$('#all-check').on('click', function() {
				if($('#all-check').prop('checked')) {
					$('input[type=checkbox]').prop('checked', true);
				}else {
					$('input[type=checkbox]').prop('checked', false);
				}
			});

			$('.message-detail').on('click', function() {
				var no = $(this).attr('data-no');
				
				$.ajax({
					"url": "showMessage",
					"method": "get",
					"data": { "no" : no },
					"success": function(resp, status, xhr) {
						$('#msNo').val(resp.msender);
						$('#msTitle').val(resp.msTitle);
						$('#msContent').val(resp.msContent);
						
						//console.log(resp.msender);
						//console.log(resp.mreceiver);
					},
					"error": function(xhr, status, err) {
						alert("오류 발생 : " + err);
					}
				});

				if(messageType == "" || messageType == 'R') {
					$.ajax({
						"url": "updateMessage",
						"method": "post",
						"data": { "no" : no },
						"success": function(resp, status, xhr) {
							$('#mail-img').attr('src', '/used-product/resources/img/check_message.png');				
						},
						"error": function(xhr, status, err) {
							alert("오류 발생 : " + err);
						}
					});
				}
				
				$('#messageModal').modal('show');
				
			});
				
		});
	</script>
</body>

</html>