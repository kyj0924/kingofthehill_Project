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
	
	.community_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-right:30px;
		color:#F5BC00;
	}
	
	.community_div:hover{
		cursor:pointer;
	}
	
	.store_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-left:30px;
		color:#F5BC00;
	}
	
	.store_div:hover{
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
		<div class="community_div">
			<img src="../resources/image/community2.png" alt="community_img" id="community_img" style="width:300px; height:300px;"/><br>
			<label for="community">커뮤니티</label>
		</div>
		<div class="store_div">
			<img src="../resources/image/store2.png" alt="store_img" id="store_img" style="width:300px; height:300px; padding:30px 20px 30px 20px;"/><br>
			<label for="store">매장</label>
		</div>
	</div>
</form>

<script>
	$('.community_div').click(function(){
		// 커뮤니티 시작 페이지로 보내기
		$('#select_Form').attr("action", "${contextPath}/outer/outerHome");
		$('#select_Form').attr("method", "post");
		$('#select_Form').submit();
	})
	
	$('.store_div').click(function(){
		$('#select_Form').attr("action", "${contextPath}/select/player_Owner_Select");
		$('#select_Form').attr("method", "post");
		$('#select_Form').submit();
	})
</script>
</body>
</html>