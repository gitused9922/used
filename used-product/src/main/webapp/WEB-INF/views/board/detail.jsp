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

</head>

<body>

  <!-- Navigation -->
  <jsp:include page="/WEB-INF/views/modules/topbar.jsp" /> 
  <!-- Page Content -->
  <div class="container">

    <div class="row">
	
	<!-- sidebar -->
	<%-- <jsp:include page="/WEB-INF/views/modules/sidebar.jsp" /> --%>

	<!-- Page Content -->
	<div class="container">

		<!-- write -->
		<h1 class="my-4">중고서울 상품 보기 게시판</h1>
		<br>
		<div class="">
			<div class="">
					<div class="form-group">
						<label>번호</label> <input class="form-control" id='no' name='no' value='${ board.no }')>
					</div>
				   <div class="form-row">
				     <div class="form-group col-md-6">
				       <label for="inputEmail4">상품명</label>
				       <input class="form-control" id="name" name='name' value='${ board.name }'>
				   </div>
				   <div class="form-group col-md-6">
				      <label for="inputPassword4">카테고리</label>
				      <input class="form-control" id="name" name='cgName' value='${ board.cgName }'>

					  <!-- 넘어갈때 name의 값은 cgname + n1  방식으로 넘어감-->
				   </div>
				   </div>
					
					<div class="form-group">
						<label>가격</label> <input class="form-control" id='price' name='price' value='${board.price}'>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1" >판매내용</label>
						<div id="content" style="width:100%; height:100%;">${board.content }</div>
					</div>

					<div class="form-group">

					</td>
						<label>작성자</label> <input class="form-control" id='userId' name='userId' value="${board.userId }">
						<!-- ${board.userId } -->
					</div>
					

		          <%-- <c:if test="${ asd.userId == board.userId }"> --%>
		          <button id="edit-button" type="button" class="btn btn-success">수정</button>
		          <button id="delete-button" type="button" class="btn btn-success">삭제</button>
		          <%-- </c:if> --%>
		          <button id="tolist-button" type="button" class="btn btn-success">목록</button>
		       
				</form>
			</div>
		</div>
	</div>
	<!-- /.container -->
  </div></div>
	<!-- Footer -->
  	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />

	<!-- Bootstrap core JavaScript -->
	<script src="/used-product/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/used-product/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){

		$('input, textarea').attr({'readonly': 'readonly'})

		$('#content img').css({
				'width': '500px'
			})
		
	})
	
	
	</script>


</body>

</html>