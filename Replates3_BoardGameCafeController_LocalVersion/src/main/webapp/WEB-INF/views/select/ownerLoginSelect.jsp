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
	body{
		width:100%;
		height:100vh;
		background-image:linear-gradient(to right, #1D1D2A 50%, white 50%);
	}
	
	.logo_img_div{
		width:100%;
		height:400px;
		text-align:center;
		align-items:center;
		justify-content:center;
		margin-top:100px;
	}
	
	.select_inout_type{
		width:100%;
		height:70vh;
		display:flex;
		text-align:center;
		align-items:center;
		justify-content:center;
	}
	
	.userPage_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-right:30px;
		color:#F5BC00;
		cursor:pointer;
	}
	
	.owner_logout_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-left:30px;
		color:#F5BC00;
		cursor:pointer;
	}
</style>
</head>
<body>
<div class="logo_img_div">
	<img src="../resources/image/logonuggi.png" alt="cafe_logo" style="width:400px; height:400px;">
</div>
<form id="select_Form">
	<div class="select_inout_type">
		<div class="userPage_div">
			<svg xmlns="http://www.w3.org/2000/svg" width="300" height="300" fill="currentColor" class="bi bi-door-open" viewBox="0 0 16 16">
  			<path d="M8.5 10c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z"/>
  			<path d="M10.828.122A.5.5 0 0 1 11 .5V1h.5A1.5 1.5 0 0 1 13 2.5V15h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V1.5a.5.5 0 0 1 .43-.495l7-1a.5.5 0 0 1 .398.117zM11.5 2H11v13h1V2.5a.5.5 0 0 0-.5-.5zM4 1.934V15h6V1.077l-6 .857z"/>
			</svg>
			<br>
			<label for="userPage">유저 페이지로 이동</label>
		</div>
		<div class="owner_logout_div">
			<span class="glyphicon glyphicon-off" style="font-size:300px"></span><br>
			<label for="owner_logout">로그아웃</label>
		</div>
	</div>
</form>

<script>
	$('.userPage_div').click(function(){
		// foodOrder 페이지로 보내기
		$('#select_Form').attr("action", "${contextPath}/inner/desk/foodOrder");
		$('#select_Form').attr("method", "post");
		$('#select_Form').submit();
	})
	
	$('.owner_logout_div').click(function(){
		// 점주가 로그아웃하면 첫 페이지로 이동(inout_Select)
		$('#select_Form').attr("action", "${contextPath}/select/ownerLogout");
		$('#select_Form').attr("method", "post");
		$('#select_Form').submit();
	})
</script>
</body>
</html>