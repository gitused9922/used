<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Message</title>

  <!-- Bootstrap core CSS -->
  <link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">
  <style type="text/css">
	#message-list ul li {
		list-style : none;
		margin:0px;
		padding:0px;
	}
	
	#message-div {
		display: none;
	}
  </style>
</head>

<body>

  <jsp:include page="/WEB-INF/views/modules/topbar.jsp" />

  <!-- Page Content -->
  <div class="container">

    <div class="row">

	  <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

      <div class="col-lg-9">

        <div class="row">
			<div class="col-md-5" id="sender-list">
				<c:forEach items="${memberList }" var="member">
					<div class="alert alert-success" data-sender="${member.MSender }">${member.MSender }<span class="badge">${member.unConfirmCnt }</span></div>
				</c:forEach>
			</div>
			<div class="col-md-7" id="message-div">
				<div class="alert alert-warning" id="message-list">
				</div>
				<textarea class="form-control col-md-7" rows="3" id="msContent" name="msContent"></textarea>
				<input type="hidden" name="mReceiver" id="mReceiver">
				<button class="btn btn-success btn-lg" id="send-button">전송</button>
			</div>
        </div> <!-- /.row -->
        
      </div> <!-- /.col-lg-9 --> 
      
    </div> <!-- /.row -->
    
  </div> <!-- /.container -->
  

  <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

  <!-- Bootstrap core JavaScript -->
  <script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
	$(function() {

		$('#sender-list div').on('click', function() {
			$('#message-div').show();
			
			var sender = $(this).attr('data-sender'); 
			$('#mReceiver').val(sender);
			
			$.ajax({
				"url": "listMessage",
				"method": "get",
				"async": true,
				"data": { "sender": sender },
				"contentType" : "application/json; charset=UTF-8",
				"success": function(resp, status, xhr) {
					var message = '';
					$.each(resp, function(index) {
						message += '<ul><li>' + resp[index].msender + '</li>';
						message += '<li>' + resp[index].msContent + '</li></ul><br>';
						
						/* console.log(resp[index].msNo);						
						console.log(resp[index].msDate);
						console.log(resp[index].mreceiver);
						console.log(resp[index].tno); */
		            });
					$('#message-list').html(message);
				},
				"error": function(xhr, status, err) {
					alert("오류 발생 : " + err);
				}
			});
			
			console.log('리스트 작업 완료');
			$.ajax({
				"url": "updateUnConfirmCnt",
				"method": "put",
				"data": JSON.stringify({ "sender": sender }),
				"contentType" : "application/json; charset=UTF-8",
				"success": function(result, status, xhr) {
					console.log('성공');
				},
				"error": function(xhr, status, err) {
					alert('수정 실패');
				}
			});
			
		});

		$('#send-button').on('click', function() {
			var receiver = $('#mReceiver').val();
			if(!receiver) {
				alert('메세지 보낼 ID를 선택하세요.');
				return;
			}

			var $content = $('#msContent');
			var data = {
				"msContent" : $content.val(),
				"mSender" : "test1",
				"mReceiver" : receiver
			}

			$.ajax({
				"url": "insertMessage",
				"method": "post",
				"data": JSON.stringify(data),
				"contentType" : "application/json; charset=UTF-8",
				"success": function(resp, status, xhr) {
					var message = '';
					message += '<ul><li>' + resp.msender + '</li>';
					message += '<li>' + resp.msContent + '</li></ul><br>';

					$('#message-list').append(message);
					$content.val('');
				},
				"error": function(xhr, status, err) {
					alert("오류 발생 : " + err);
				}
			});
		});
	});
  </script>
</body>

</html>