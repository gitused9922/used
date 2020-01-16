<%@ page language="java" 
		 contentType="text/html; charset=utf-8"
    	 pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#" style="width: 25%;">Start Bootstrap</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <div class="collapse navbar-collapse" id="navbarResponsive" style="width: 75%;">
	    <form class="form-inline my-2 my-lg-0" style="width: 60%;">
	      <input class="form-control mr-sm-2" type="search" placeholder="지역, 상품명을 검색하세요" aria-label="Search" style="  width: 100%;">
	      <button class="my-2 my-sm-0" type="submit" style="display: none;">검색</button>
	    </form>
        <ul class="navbar-nav ml-auto" style="width: 40%;">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/used-product/board/list.action">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">회원가입</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/used-product/resources/login.html">Log in</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  