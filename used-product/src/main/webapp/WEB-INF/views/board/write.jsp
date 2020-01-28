<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<h1 class="my-4">중고서울 상품 등록 게시판</h1>
		<br>
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
				       <input class="form-control" id="name" name='name'>
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
						<label>가격</label> 
						<input class="form-control" id='price' name='price'>
					</div>
					<div class="form-group">
						<label for="exampleFormControlTextarea1" >판매내용</label>
						<!-- <textarea name="smarteditor" id="smarteditor" rows="10" cols="100" style="width:100%; height:600px;"></textarea>  -->
						<textarea name='content' id="smarteditor" rows="10" cols="100" style="width:100%; height:600px;"></textarea> 
						<!-- <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name='content'></textarea> -->
					</div>

					<div class="form-group">

					</td>
						<label>작성자</label> <input class="form-control"  id='userId' name='userId' value="${ loginuser.memberId }" readonly >
						<!-- ${board.userId } -->
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
	<script type="text/javascript" src="//code.jquery.com/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="/used-product/resources/navereditor/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript">
	$(function(){
	    //전역변수선언
	    var editor_object = [];
	    
	    $('#smarteditor').val(''); // 수정일경우 데이터 이안에 넣어서 처리
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        elPlaceHolder: "smarteditor", // textarea의 id
	        
	        sSkinURI: "/used-product/resources/navereditor/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        }
	    });
	
	    //전송버튼 클릭이벤트
	    $("#write-button").on('click', function(event){
	        //id가 smarteditor인 textarea에 에디터에서 대입
	        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
	         
	        // 이부분에 에디터 validation 검증
	
	        //폼 submit
	        $("#write-form").submit();
	    })
	})
	

			/*$('#').on('click', function(event){
				loaction.href = "list.action"
			}); 
			$('#write-button').on('click', function(event){
				$('#write-form').submit();
			});*/

	
	</script>


</body>

</html>