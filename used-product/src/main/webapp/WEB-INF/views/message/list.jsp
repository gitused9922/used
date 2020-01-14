<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="/used-product/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/used-product/resources/css/shop-homepage.css" rel="stylesheet">
</head>

<body>

  <jsp:include page="/WEB-INF/views/modules/topbar.jsp" />

  <!-- Page Content -->
  <div class="container">

    <div class="row">

	  <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" />

      <div class="col-lg-9">

        <div class="row">
			<div class="col-md-5">
				<c:forEach items="${messageList }" var="message">
					${message.MSender }
				</c:forEach>
			</div>
			<div class="col-md-7">
				메세지 내용 및 채팅
			</div>
        </div> <!-- /.row -->
        
      </div> <!-- /.col-lg-9 --> 
      
    </div> <!-- /.row -->
    
  </div> <!-- /.container -->
  

  <jsp:include page="/WEB-INF/views/modules/footer.jsp" />

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>