<%@ page import="com.usedproduct.vo.MemberVO"%>
<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% 
	MemberVO loginUser = (MemberVO) session.getAttribute("loginuser");
	String id = "";
	
	if(loginUser != null) {
		id = loginUser.getMemberId();
	}else {
		response.sendRedirect("/used-product");
	}
%>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	
	<title>중고 서울 채팅</title>
	
	<!-- Bootstrap core CSS -->
	<link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom styles for this template -->
	<link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">
	<style>
		#chatArea {
			width: 1000px;
			height: 500px;
			overflow-y: auto;
			border: 1px solid black;
			border-radius: 10px;
			background-color: gray;
			font-size: 20px;
			color: white;
		}		
	</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/modules/topbar.jsp" />
	<div class="container">
		<div class="row" style="margin:35px; 0px; 35px; 0px;">
			<div class="col-lg-12">
				<div class="row">
				    <h3 style="margin-bottom: 20px;">중고 서울 채팅</h3>

				    <div id="chatArea"><div id="chatMessageArea"></div></div><br>
			    </div>	    
			</div>
		</div>
		
    	<div class="row" style="margin:35px; 0px; 35px; 0px;">
    		<div class="col-lg-10">
				<input type="text" class="form-control" id="message" readonly="readonly">    
			</div>
			<div class="col-lg-2">
				<button type="button" class="btn btn-success" id="enterBtn">입장</button>
				<button type="button" class="btn btn-success" id="exitBtn" style="display: none;">나가기</button>
			</div>
    	</div>
	</div> <!-- /.container -->
	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />
    
    <script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
		var wsocket;
		var id = '<%=id %>';

		function today() {
			var date = new Date();
			var MM = date.getMonth() + 1;
			if(MM < 10) {
				MM = '0' + MM;
			}
			
			var dd = date.getDate();
			if(dd < 10) {
			    dd = '0' + dd;
			}

			date = date.getFullYear() + '-' + MM + '-' + dd + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
			return date;
		}

		function connect() {
			wsocket = new WebSocket("ws://localhost:8088/used-product/message/chattingRoom");  
			
			wsocket.onopen = function onOpen(e) {
				appendMessage("[ " + id + " ]" + "님 채팅방 입장하셨습니다.");
			}
			
			wsocket.onmessage = function onMessage(e) {
				appendMessage(e.data);
			};

			wsocket.onclose = function onClose(e) {
				appendMessage("[ " + id + " ]" + "님 채팅방 나가셨습니다.");
			}
		}
		
		function appendMessage(msg) {
			$("#chatMessageArea").append("[ " + today() + " ] "+ msg + "<br>");
			
			var chatAreaHeight = $("#chatArea").height();
			var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
			$("#chatArea").scrollTop(maxScroll);
		}
		
		function disconnect() {
			wsocket.close();
		}

		$(function() {
			$('#enterBtn').on('click', function() {
				$(this).hide();
				$('#exitBtn').show();
				$('#message').prop('readonly', false);
				
				connect();
			});

			$('#message').keypress(function(event){
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if(keycode == '13'){
					if($("#message").val() == "") {
						alert('메세지를 입력하세요.');
						return;
					}else {
						wsocket.send($("#message").val());
						$("#message").val("");
					}	
				}
				
				event.stopPropagation();
			});
			
			$('#exitBtn').on('click', function() {
				$(this).hide();
				$('#enterBtn').show();
				$('#message').val('');
				$('#message').prop('readonly', true);
				
				disconnect();
			});

	});
	</script>
</body>
</html>