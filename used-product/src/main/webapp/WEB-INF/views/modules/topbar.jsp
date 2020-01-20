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
	    <form class="form-inline my-2 my-lg-0" style="width: 60%;">
	      <input class="form-control mr-sm-2" type="search" placeholder="지역, 상품명을 검색하세요" aria-label="Search" style="  width: 100%;">
	      <button class="my-2 my-sm-0" type="submit" style="display: none;">검색</button>
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
  
  