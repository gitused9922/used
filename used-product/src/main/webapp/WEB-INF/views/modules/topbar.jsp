<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 
<style>
.container {
	margin-top: 20px;
}
.bg-dark {
    background-color: #ffffff !important;
    border-bottom: 2px solid #c1c1c152;
}

.navbar {
padding : 1.0rem 2rem
}
.navbar-dark .navbar-brand {
    color: #151521;
}

.navbar-dark .navbar-brand:focus, 
.navbar-dark .navbar-brand:hover {
    color: #006494;
    font-weight: 500;
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #007bff;
}

.navbar-dark .navbar-nav .nav-link {
    color: #151521;
}



.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover {
    color: #002a56;
    font-weight: 500;
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #151521;
    font-weight: 500;
}

#id{
	display: inline-block;
	width: 450px; height: 40px;
	border: 3px solid #e6622c;
	background: white;

}
-->

.navbar-dark .navbar-toggler {
    color: #03A9F4;
    border-color: rgba(255, 255, 255, 0.1);
}
.material-icons {
	font-size : 35px;
}

</style>
 
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/used-product" style="width: 25%;">중 고 서 울</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		<span><i class="material-icons">list</i></span>
        <!-- <span class="navbar-toggler-icon"></span> -->
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive" style="width: 75%;">
	   <form action="/used-product/board/list.action" method="get">
			<select style="display:none" name="searchType" aria-controls="dataTable" class=" form-control-sm" id="formid">
				<option value="T" ${ param.searchType == 'T' ? 'selected' : '' }>상품</option>
				
			</select>
			<span class='retrieval'>
			<input id="id" type="search" name="searchKey" class=" form-control-sm" placeholder="" aria-controls="dataTable"
			       value="${ param.searchKey }">
			     </span>  
			 <input type="hidden" class="btn btn-success btn-sm" value="검색" >              
           </form>
        <ul class="navbar-nav ml-auto" style="width: 40%;">
<!--           <li class="nav-item active">
            <a class="nav-link" href="#">Home</a>
          </li> -->
          
          <li class="nav-item">
            <a class="nav-link" href="/used-product/board/list.action">상품보기</a>
          </li>
          <c:choose>
          <c:when test="${ empty loginuser }">
	          <li class="nav-item">
	            <a class="nav-link" href="/used-product/resources/login.html">로그인</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="/used-product/resources/register.html">회원가입</a>
	          </li>
          </c:when>
          <c:otherwise>          
	          <li class="nav-item">
	            <a class="nav-link" href="/used-product/chatting/chattingRoom.jsp">채팅</a>
	            <!-- <a class="nav-link" href="/used-product/message/chattingRoom">채팅</a> -->
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="/used-product/message/sendMessagePage">마이페이지</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link" href="/used-product/account/logout.action">로그아웃</a>
	          </li>
          </c:otherwise>
          </c:choose>
        </ul>
      </div>
    </div>
  </nav>
  
  