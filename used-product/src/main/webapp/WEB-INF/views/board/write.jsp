<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>중고를 새것처럼 판매상품 등록하기</title>

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
		<h1 class="my-4">중고를새것처럼 상품 등록 게시판</h1>
		<div class="">
			<div class="">
				<span class=""></span>
			</div>
			<div class="">
				<form id="write-form" role="form" action="write.action" method="post">
					<!-- <input class="form-control" id='no' name='no'> -->
				   <div class="form-row">
				     <div class="form-group col-md-6">
				       <label for="inputEmail4">상품명</label>
				       <input type="email" class="form-control" id="name" name='name'>
				   </div>
				   <div class="form-group col-md-6">
				      <label for="inputPassword4">카테고리</label>
				      <select class="form-control" name="cgName" >
							<option value="">선택하세요</option>
							<c:forEach items="${ category }" var="category">
								<option value="${ category.cgName }">${ category.cgName }</option>
							</c:forEach>
					  </select>
					  <!-- 넘어갈때 name의 값은 cgname + n1  방식으로 넘어감-->
				   </div>
				   </div>
					
					<div class="form-group">
						<label>가격</label> <input class="form-control" id='price' name='price'>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1">판매내용</label>
						<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" id='userId' name='userId' value="test1">
						<!-- ${board.userId } -->
					</div>
					

					<div class="form-group">
    					<label for="exampleFormControlFile1" style="margin-right: 20px;" >Example file input</label>
    					<input type="file" class="" id="wFile1">
    					<input type="file" class="" id="wFile2">
  					</div>

					<button id="write-button" type="button"  class="btn btn-outline-secondary">등록</button>
					<!-- <button type="reset" class="btn btn-success">다시쓰기</button> -->
					<button id="tolist-button" type="button" class="btn btn-outline-secondary">목록</button>
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
	<script type="text/javascript">
		$(function() {
/* 			$('#').on('click', function(event){
				loaction.href = "list.action"
			}); */
			$('#write-button').on('click', function(event){
				$('#write-form').submit();
			});
		})
	
	</script>

</body>

</html>