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
		<h1 class="my-4">중고를새것처럼</h1>
		<div class="">
			<div class="">
				<span class="">글 쓰기</span>
			</div>
			<div class="">
				<form id="write-form" role="form" action="write.action" method="post">
					<div class="form-group">
						<label>상품명</label> <input class="form-control" id='title' name='title'>
					</div>
					<div class="form-group">
						<label>카테고리</label> 
						<select name="cgname" style="height: 30px;">
                            <option value="">선택하세요</option>
                            <option value="전자제품">전자제품</option>
                            <option value="가구">가구</option>
                            <option value="의류">의류</option>
                            <option value="장난감">장난감</option>
                            <option value="기타">기타</option>
                        </select>
                    </td>
                    <!-- 넘어갈때 name의 값은 cgname + n1  방식으로 넘어감-->

					</div>
					<div class="form-group">
						<label>가격</label> <input class="form-control" id='price' name='price'>
					</div>
					<div class="form-group">
						<label>판매내용</label>
						<textarea class="" rows="3" id='content' name='content'></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="" id='writer' name='writer' value="">
						<!-- ${ loginuser.id } -->
					</div>
					
					<div>
						<label>파일업로드</label> <input class="" id='' name='' value="">
					</div>
					<button id="write-button" type="button" class="btn btn-success nav-link">등록</button>
					<!-- <button type="reset" class="btn btn-success">다시쓰기</button> -->
					<button id="tolist-button" type="button" class="btn btn-success nav-link">목록</button>
				</form>
			</div>
		</div>
	</div>
	<!-- /.container -->

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