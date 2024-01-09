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
  		width:100vw;
  		height:100vh;
  		display:flex;
  		align-items:center;
  		justify-content:center;
  		flex-direction: column;
  		background-color:#1D1D2A;
  	} 
  	
  	.title{
  		text-align:center;
  		color:#F5BC00;
  	}
  	
  	.login_div{
  		width:500px;
  		height:500px;
  		color:#F5BC00;
  	}
  	
  	.player_Icon{
  		text-align:center;
  		align-items:center;
  		justify-content:center;
  	}


</style>
 
</head>
<body>
	<div class="logo_img_div">
		<img src="../resources/image/cafe_logo_sm.png" alt="cafe_logo" style="width:400px; height:400px;">
	</div>
	<h2 class="title">KING OF THE HILL 보드게임 카페</h2>
	<div class="player_Icon">
		<img src="../resources/image/player_Icon.png" alt="player_Icon" style="width:100px; height:100px;">
	</div>
	
	<div class="login_div">
		<form id="outer_login_form">
			<input type="hidden" value="${outer_login_check }" name="login_check" id="login_check">
			<div class="form-group">
				<label for="player_ID">아이디</label>
				<input type="text" class="form-control" name="player_ID">			
			</div>
			<div class="form-group">
				<label for="player_PW">비밀번호</label>
				<input type="password" class="form-control" name="player_PW">
			</div>
			<button type="button" class="btn btn-primary" id="login_btn">로그인</button>
			<button type="button" class="btn btn-success" id="join_btn">회원가입</button>
		
		</form>
	</div>
	
	<script>
		$('#login_btn').click(function(){
			$('#outer_login_form').attr("action", "${contextPath}/outer/outerLoginPro");
			$('#outer_login_form').attr("method", "post");
			//$('#outer_login_check').val("true");
			$('#outer_login_form').submit();
			
		})
		
		$('#join_btn').click(function(){
			$('#outer_login_form').attr("action", "${contextPath}/outer/outerJoin");
			$('#outer_login_form').attr("method", "post");
			//$('#outer_login_check').val("true");
			$('#outer_login_form').submit();
		})
	</script>
</body>
</html>