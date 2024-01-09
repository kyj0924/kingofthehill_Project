<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
  <title>King Of The Hill</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  	body{
  		text-align:center;
  		background-color:#1D1D2A;
  	}
  	
  	.popup_img{
  		margin-top:60px;  
  		margin-bottom:30px;	
  	}
  	
  	.popup_info{
  		color:white;
  		font-size:20px;
  	}
  </style>
</head>

<body>
	<div id="startNotice" onclick="self.close();">
		<div class="logo_img_div">
			<img src="../resources/image/logonuggi.png" class="popup_img" alt="cafe_logo" style="width:400px; height:400px;">
		</div>
		<p class="popup_info">
			안녕하세요. 보드게임카페 King Of The Hill 입니다.<br>
			전국 최초 실시간 테이블 확인, 같이 즐길 친구 탐색 등<br>
			저희의 다양한 서비스와 함께 보드게임카페 이용에 있어<br>
			최고의 만족을 경험해보시길 바랍니다. 환영합니다.		
		</p> 
	</div>
	

</body>
</html>