<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
<!--
.bg-dark {
    background-color: #ffffff !important;
    border-bottom: 1px solid #343a40;
}

.navbar-dark .navbar-brand {
    color: #007bff;
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
    color: #007bff;
}



.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover {
    color: #002a56;
    font-weight: 500;
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active, .navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link {
    color: #007bff;
    font-weight: 500;
}
#id{
	display: inline-block;
	width: 450px; height: 40px;
	border: 3px solid black;
	background: white;

}
-->
</style>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="/used-product" style="width: 25%;">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
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
            <a class="nav-link" href="/used-product/board/list.action">중고상품보기</a>
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
	            <a class="nav-link" href="#">마이페이지</a>
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
  
  