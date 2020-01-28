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
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
</head>

<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<div class="container">

		<div class="row" style="margin:35px; 0px; 35px; 0px;">
			<%-- <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" /> --%>
			
			<div class="col-lg-12">
				<h2>쪽지</h2>

				<div style="margin:10px; 0px; 10px; 0px;">					
					<form id="search-form" action="messagePage" method="get">
						<select name="messageType" id="messageType" class=" form-control-sm">
							<option value="S" ${ param.messageType == 'S' ? 'selected' : '' }>보낸 쪽지</option>
							<option value="R" ${ param.messageType == 'R' ? 'selected' : '' }>받은 쪽지</option>
						</select>
						<br>
						
						<div class="text-right" style="margin-bottom: 5px">
							<select name="searchType" class=" form-control-sm" >
								<option value="P" ${ param.searchType == 'P' ? 'selected' : '' }>상품명</option>
								<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>제목</option>
								<c:choose>
									<c:when test="${ param.messageType == 'R'}">
										<option value="S" ${ param.searchType == 'S' ? 'selected' : '' }>보낸 ID</option>	
									</c:when>
									<c:otherwise>
										<option value="R" ${ param.searchType == 'R' ? 'selected' : '' }>받는 ID</option>	
									</c:otherwise>
								</c:choose>
							</select>
							
							<input type="search" name="searchKey" id="searchKey" class=" form-control-sm" value="${ param.searchKey }">
							<button type="button" class="btn btn-success btn-sm" id="search-button">검색</button>
						</div>
					
						<div class="text-right">
							<button type="button" class="btn btn-danger btn-sm text-left" id="list-delete" style="float: left;">삭제</button>
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
								<c:when test="${ param.messageType == 'R' }">
									<th>보낸 ID</th>			
								</c:when>
								<c:otherwise>
									<th>받는 ID</th>			
								</c:otherwise>
							</c:choose>
							<th>날짜</th>							
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${messages }" var="message">
						<tr>
							<td>
								<input type="checkbox" class="checkbox-del" name="msNo" value="${message.msNo }">
							</td>
							<td>
								<c:choose>
									<c:when test="${message.msConfirm eq false }">
										<img src="/used-product/resources/img/message.png">
									</c:when>
									<c:otherwise>
										<img src="/used-product/resources/img/check_message.png">
									</c:otherwise>
								</c:choose>
								
							</td>
							<td>${message.PName }</td>
							<td class="message-detail" data-no="${message.msNo }">${message.msTitle }</td>
							<c:choose>
								<c:when test="${ param.messageType == 'R' }">
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
						<c:choose>
							<c:when test="${ param.messageType == 'R' }">
								<h4 class="modal-title">받은 쪽지</h4>			
							</c:when>
							<c:otherwise>
								<h4 class="modal-title">보낸 쪽지</h4>			
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="modal-body">							
						<div class="form-group">
							<c:choose>
								<c:when test="${ param.messageType == 'R' }">
									<label for="mId">보낸 ID</label>			
								</c:when>
								<c:otherwise>
									<label for="mId">받는 ID</label>			
								</c:otherwise>
							</c:choose>
							<input type="hidden" id="msNo">
							<input type="text" class="form-control" id="mId" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="sMsTitle">제목</label>
							<input type="text" class="form-control" id="sMsTitle" readonly="readonly">
						</div>
						
						<div class="form-group">
							<label for="sMsContent">내용</label>
							<textarea class="form-control" rows="3" id="sMsContent" readonly="readonly" style="resize: none;"></textarea>
						</div>
					</div>
				
					<div class="modal-footer">
						<button type="button" class="btn btn-danger btn-sm" id="delete-button">삭제</button>
						<c:if test="${ param.messageType == 'R' }">
							<button type="button" class="btn btn-success btn-sm" id="send-button">답장</button>
						</c:if>
						<button type="button" class="btn btn-success btn-sm" id="cancel" data-dismiss="modal">취소</button>
					</div>
				</div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
		
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
								<input type="text" class="form-control" id="mReceiver" name="mReceiver" readonly="readonly">
								<input type="hidden" id="tNo" name="tNo">
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
		
			$('#sDate, #eDate').datepicker({
				dateFormat: 'yy-mm-dd'
			});

			$('#messageType').on('change', function() {
				$('#searchKey, #sDate, #eDate').val('');
				$('#search-button').click();
			});

			$('#search-button').on('click', function() {
				var sDate = $('#sDate').val();
				var eDate = $('#eDate').val();
				if(sDate != "" && eDate == "") {
					alert('종료 기간을 지정해주세요.');
					return;
				}else if(sDate == "" && eDate != "") {
					alert('시작 기간을 지정해주세요.');
					return;
				}else if(sDate > eDate) {
					alert('시작 기간이 종료기간보다 큽니다.');
					return;
				}

				$('#search-form').submit();
			});

			$('.message-detail').on('click', function() {
				var no = $(this).attr('data-no');
				var img = $(this).prev().prev().children();
				
				$.ajax({
					"url": "showMessage",
					"method": "get",
					"data": { "no" : no },
					"success": function(resp, status, xhr) {
						$('#msNo').val(resp.msNo);
						if(${param.messageType == "R" }) {
							$('#mId').val(resp.msender);							
						}else {
							$('#mId').val(resp.mreceiver);
						}
						$('#sMsTitle').val(resp.msTitle);
						$('#sMsContent').val(resp.msContent);
						
						$('#tNo').val(resp.tno);
						$('#mReceiver').val(resp.msender);
					},
					"error": function(xhr, status, err) {
						alert("오류 발생 : " + err);
					}
				});

				if(${param.messageType == "R" }) {
					$.ajax({
						"url": "confirmMessage",
						"method": "post",
						"data": { "no" : no },
						"success": function(resp, status, xhr) {
							img.attr('src', '/used-product/resources/img/check_message.png');
						},
						"error": function(xhr, status, err) {
							alert("오류 발생 : " + err);
						}
					});
				}
				
				$('#messageModal').modal('show');
				
			});

			$('#cancel').on('click', function() {
				$('#messageModal').modal('hide');
			});
			
			$('#send-button').on('click', function() {
				$('#messageModal').modal('hide');
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
					"url": "sendMessage",
					"method": "post",
					"data": $('#send-form').serialize(),
					"success": function(resp, status, xhr) {
						location.reload(true);
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

			$('#delete-button').on('click', function() {
				if(confirm('쪽지 삭제하시겠습니까?')) {
					deleteMessage($('#msNo').val());
				}
			});
			
			$('#all-check').on('click', function() {
				if($('#all-check').prop('checked')) {
					$('input[type=checkbox]').prop('checked', true);
				}else {
					$('input[type=checkbox]').prop('checked', false);
				}
			});

			$('#list-delete').on('click', function() {
				var $checkbox = $('.checkbox-del:checked');
				if($checkbox.length == 0) {
					alert('삭제할 쪽지를 선택해주세요');
					return;
				} else {
					if(confirm($checkbox.length + '건 쪽지 삭제하시겠습니까?')) {
						$checkbox.each(function(idx, item) {
							deleteMessage($(this).val());
						});
					}
				} 
			});

			function deleteMessage(no) {
				$.ajax({
					"url": "deleteMessage",
					"method": "post",
					"data": { "no" : no },
					"success": function(resp, status, xhr) {
						location.reload(true);
					},
					"error": function(xhr, status, err) {
						alert("오류 발생 : " + err);
					}
				});
			}
		});
	</script>
</body>

</html>