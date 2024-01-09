<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>King Of The Hill</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  
  
  	.container-fluid{
	background-color: #2b2b2b;
	}

	.container{
	color: #fff;
		padding-top: 10px;
	    font-size: 40px;
	    width: 100px;
	  text-align: center;
	 
	
	}
	
	.container button {
	  border-radius: 60px;
	  background-color: #919191; 
	    font-family: 'fantasy';
	  font-weight: bold; 
	   margin-right: 20px;
	}
	
	.headerMenu .btn {
  width: 180px; 
  height: 50px;
  box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3); 
/*text-shadow: 2px 2px 4px #ffffff;*/ 

}

	.all {
		background-color: #3c3c3c;
		border-radius: 80px;
		padding: 30px;
		  margin-bottom: 100px; 
	  margin-left: 100px; 
	  margin-right: 100px;
	}
  
  	.myPage_title{
  		text-align:center;
  		margin-top:70px;
  		margin-bottom:70px;
  		color:#fff;
  	}
  	
  	.myPageContainers{
  		width:100%;
  		display:flex;
  		justify-content:center;
  		align-items:center;
  	}
  	
  	.media{
  		width:100%;
  	}
  	
  	
  	.p_info{
  		/*text-indent: 2em;*/
  		font-size:15px;
  		color:#F5D0A9;
  	}
  	
  	.p_info_largeFont{
  		font-size:50px;
  	}
  	
  	.glyphicon{
  		font-size:50px;
  		color:#F5D0A9;
  	}
  	
  	.media-body{
  		text-align:center;
  	}
  	
  	body, html {
	background-color: #2b2b2b !important;
}
  	
  	
  </style>
</head>
<body>
<div class="container-fluid" style="width:1850px;">
<div class="container">
<jsp:include page="../common/headerMenu.jsp"/>
</div>
<div class="all">
<div class="title_div">
	<h1 class="myPage_title">마이페이지</h1>
</div>
<div class="myPageContainers">
	<div class="container">
		<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
		  		<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
		  		<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">아이디</h4>
		      <p id="player_ID_Info" class="p_info p_info_largeFont">${login_Player.player_ID }</p>
		    </div>
	  	</div>
	  	<hr>
	  	
	  	<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
  				<path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"/>
  				<path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96c.026-.163.04-.33.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1.006 1.006 0 0 1 1 12z"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">이름</h4>
		      <p id="player_Name_Info" class="p_info p_info_largeFont">${login_Player.player_Name }</p>
		    </div>
	  	</div>
	  	<hr>
	  	
	  	<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-phone-vibrate" viewBox="0 0 16 16">
  				<path d="M10 3a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H6a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1zM6 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h4a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2z"/>
  				<path d="M8 12a1 1 0 1 0 0-2 1 1 0 0 0 0 2M1.599 4.058a.5.5 0 0 1 .208.676A6.967 6.967 0 0 0 1 8c0 1.18.292 2.292.807 3.266a.5.5 0 0 1-.884.468A7.968 7.968 0 0 1 0 8c0-1.347.334-2.619.923-3.734a.5.5 0 0 1 .676-.208m12.802 0a.5.5 0 0 1 .676.208A7.967 7.967 0 0 1 16 8a7.967 7.967 0 0 1-.923 3.734.5.5 0 0 1-.884-.468A6.967 6.967 0 0 0 15 8c0-1.18-.292-2.292-.807-3.266a.5.5 0 0 1 .208-.676M3.057 5.534a.5.5 0 0 1 .284.648A4.986 4.986 0 0 0 3 8c0 .642.12 1.255.34 1.818a.5.5 0 1 1-.93.364A5.986 5.986 0 0 1 2 8c0-.769.145-1.505.41-2.182a.5.5 0 0 1 .647-.284m9.886 0a.5.5 0 0 1 .648.284C13.855 6.495 14 7.231 14 8c0 .769-.145 1.505-.41 2.182a.5.5 0 0 1-.93-.364C12.88 9.255 13 8.642 13 8c0-.642-.12-1.255-.34-1.818a.5.5 0 0 1 .283-.648z"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">연락처</h4>
		      <p id="player_Tel_Info" class="p_info p_info_largeFont">${login_Player.player_Tel }</p>
		    </div>
	  	</div>
	  	<hr>
	  	
	  	<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-award" viewBox="0 0 16 16">
  				<path d="M9.669.864 8 0 6.331.864l-1.858.282-.842 1.68-1.337 1.32L2.6 6l-.306 1.854 1.337 1.32.842 1.68 1.858.282L8 12l1.669-.864 1.858-.282.842-1.68 1.337-1.32L13.4 6l.306-1.854-1.337-1.32-.842-1.68zm1.196 1.193.684 1.365 1.086 1.072L12.387 6l.248 1.506-1.086 1.072-.684 1.365-1.51.229L8 10.874l-1.355-.702-1.51-.229-.684-1.365-1.086-1.072L3.614 6l-.25-1.506 1.087-1.072.684-1.365 1.51-.229L8 1.126l1.356.702z"/>
  				<path d="M4 11.794V16l4-1 4 1v-4.206l-2.018.306L8 13.126 6.018 12.1z"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">등급</h4>
		      <c:choose>
		      	<c:when test="${login_Player.player_Rating eq '폰' }">
		      		<span class='glyphicon glyphicon-pawn'></span>
		      	</c:when>
		      	<c:when test="${login_Player.player_Rating eq '나이트' }">
		      		<span class='glyphicon glyphicon-knight'></span>
		      	</c:when>
		      	<c:when test="${login_Player.player_Rating eq '비숍' }">
		      		<span class='glyphicon glyphicon-bishop'></span>
		      	</c:when>
		      	<c:when test="${login_Player.player_Rating eq '퀸' }">
		      		<span class='glyphicon glyphicon-queen'></span>
		      	</c:when>
		      	<c:when test="${login_Player.player_Rating eq '킹' }">
		      		<span class='glyphicon glyphicon-king'></span>
		      	</c:when>
		      </c:choose>
		      <p id="player_Rating_Info" class="p_info">${login_Player.player_Rating } 등급</p>
		    </div>
	  	</div>
	  	<hr>
	  
	</div>

	<!-- 등급 설명이 들어갈 div -->
	<div class="container">
		<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-patch-check-fill" viewBox="0 0 16 16">
  				<path d="M10.067.87a2.89 2.89 0 0 0-4.134 0l-.622.638-.89-.011a2.89 2.89 0 0 0-2.924 2.924l.01.89-.636.622a2.89 2.89 0 0 0 0 4.134l.637.622-.011.89a2.89 2.89 0 0 0 2.924 2.924l.89-.01.622.636a2.89 2.89 0 0 0 4.134 0l.622-.637.89.011a2.89 2.89 0 0 0 2.924-2.924l-.01-.89.636-.622a2.89 2.89 0 0 0 0-4.134l-.637-.622.011-.89a2.89 2.89 0 0 0-2.924-2.924l-.89.01-.622-.636zm.287 5.984-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7 8.793l2.646-2.647a.5.5 0 0 1 .708.708z"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">등급 기준</h4>
		      <p id="player_Rating_Standard" class="p_info">폰 등급 : 월 결제액 5만원 미만인 회원</p>
		      <p id="player_Rating_Standard" class="p_info">나이트 등급 : 월 결제액 5만원 이상 10만원 미만인 회원</p>
		      <p id="player_Rating_Standard" class="p_info">비숍 등급 : 월 결제액 10만원 이상 15만원 미만인 회원</p>
		      <p id="player_Rating_Standard" class="p_info">퀸 등급 : 월 결제액 15만원 이상 20만원 미만인 회원</p>
		      <p id="player_Rating_Standard" class="p_info">킹 등급 : 월 결제액 20만원 이상인 회원</p>
		    </div>
	  	</div>
	  	<hr>
	  	
	  	<div class="media">
		    <div class="media-left">
		    	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-stars" viewBox="0 0 16 16">
  				<path d="M7.657 6.247c.11-.33.576-.33.686 0l.645 1.937a2.89 2.89 0 0 0 1.829 1.828l1.936.645c.33.11.33.576 0 .686l-1.937.645a2.89 2.89 0 0 0-1.828 1.829l-.645 1.936a.361.361 0 0 1-.686 0l-.645-1.937a2.89 2.89 0 0 0-1.828-1.828l-1.937-.645a.361.361 0 0 1 0-.686l1.937-.645a2.89 2.89 0 0 0 1.828-1.828l.645-1.937zM3.794 1.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387A1.734 1.734 0 0 0 4.593 5.69l-.387 1.162a.217.217 0 0 1-.412 0L3.407 5.69A1.734 1.734 0 0 0 2.31 4.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387A1.734 1.734 0 0 0 3.407 2.31l.387-1.162zM10.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732L9.1 2.137a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L10.863.1z"/>
				</svg>
				<!-- 
		      <img src="img_avatar1.png" class="media-object" style="width:60px">
		       -->
		    </div>
		    <div class="media-body">
		      <h4 class="media-heading">등급별 혜택</h4>
		      <p id="player_Rating_Benefits" class="p_info">폰 등급 : 매월 첫 방문 시 체스 폰 모양 키링 1개 지급</p>
		      <p id="player_Rating_Benefits" class="p_info">나이트 등급 : 매월 첫 방문 시 체스 나이트 모양 키링 1개 지급</p>
		      <p id="player_Rating_Benefits" class="p_info">비숍 등급 : 매월 첫 방문 시 체스 비숍 모양 키링 1개 지급</p>
		      <p id="player_Rating_Benefits" class="p_info">퀸 등급 : 매월 첫 방문 시 체스 퀸 모양 키링 1개 지급</p>
		      <p id="player_Rating_Benefits" class="p_info">킹 등급 : 매월 첫 방문 시 체스 킹 모양 키링 1개 지급</p>
		    </div>
	  	</div>
	  	<hr>
	</div>
</div>
</div>
</div>
</body>
</html>