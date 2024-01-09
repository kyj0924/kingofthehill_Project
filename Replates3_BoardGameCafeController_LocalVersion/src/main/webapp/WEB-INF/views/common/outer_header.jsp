<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>

  
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>King Of The Hill</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  
  
  <style type="text/css">
	.navbar {
    font-family: Montserrat, sans-serif;
    margin-bottom: 0;
    background-color: #2d2d30;
    border: 0;
    font-size: 11px !important;
    letter-spacing: 4px;
    opacity: 0.9;
  }
  .navbar li a, .navbar .navbar-brand { 
    color: #d5d5d5 !important;
  }
  .navbar-nav li a:hover {
    color: #fff !important;
  }
  .navbar-nav li.active a {
    color: #fff !important;
    background-color: #29292c !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
  }
  .open .dropdown-toggle {
    color: #fff;
    background-color: #555 !important;
  }
  .dropdown-menu li a {
    color: #000 !important;
  }
  .dropdown-menu li a:hover {
    background-color: red !important;
  }
  </style>
</head>

<body>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${contextPath}/outer/outerHome">KING OF THE HILL</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
			<li><a href="${contextPath}/outer/outerNotice">공지사항</a></li>
            <li><a href="${contextPath}/outer/outerFriend">친구찾기</a></li>
            <li><a href="${contextPath}/outer/outerRequest">요청사항</a></li> 
            <li><a href="${contextPath}/outer/outerRealtime">실시간테이블정보</a></li> 


     <c:if test="${!empty login_Player.player_ID}">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더보기
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            
            <li><a href="${contextPath}/outer/outerMyPage">마이페이지</a></li> 
            <li><a href="${contextPath}/outer/outerLogout">로그아웃</a></li> 

          </ul>
        </li>
 	</c:if>
 	
     <c:if test="${empty login_Player.player_ID}">
       <li class="dropdown1">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">더보기
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${contextPath}/outer/outerLogin">로그인</a></li>
            <li><a href="${contextPath}/outer/outerJoin">회원가입</a></li>
          </ul>
        </li>
   </c:if>


      </ul>
    </div>
  </div>
</nav>

</body>
</html>