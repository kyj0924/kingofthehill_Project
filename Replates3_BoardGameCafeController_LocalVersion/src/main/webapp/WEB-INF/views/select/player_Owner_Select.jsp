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
	
	.select_person_type{
		width:100%;
		height:70vh;
		display:flex;
		text-align:center;
		align-items:center;
		justify-content:center;
	}
	
	.desk_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-right:30px;
		color:#F5BC00;
	}
	
	.desk_div:hover{
		cursor:pointer;
	}
	
	.store_management_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-left:30px;
		color:#F5BC00;
	}
	
	.store_management_div:hover{
		cursor:pointer;
	}
	
	#login_div{
		display:block;
  		width:500px;
  		height:500px;
  		align-items:center;
  		justify-content:center;
  		margin:auto;
  		color:#F5BC00;
  	}
  	
  	.active{
  		background-color:#EBDDCC;
  	}
  	
  	#store_management_img{
  		padding: 15px 5px 30px 5px;
  	}
  	
</style>
</head>
<body>
<div class="logo_img_div">
	<img src="../resources/image/logonuggi.png" alt="cafe_logo" style="width:400px; height:400px;">
</div>
<form id="select_Form">
	<div class="form">
		<div class="select_person_type">
			<div class="desk_div">
				<img src="../resources/image/desk5.png" alt="desk_img" id="desk_img" style="width:300px; height:300px;"/><br>
				<label for="desk">테이블</label>
			</div>
			<div class="store_management_div">
				<img src="../resources/image/store_management6.png" alt="store_management_img" id="store_management_img" style="width:300px; height:300px;"/><br>
				<label for="store">점포운영</label>
			</div>
		</div>
		<div id="login_div">
			<input type="hidden" value="${login_check }" name="login_check" id="login_check">
			<div class="form-group">
				<label for="player_ID">아이디</label>
				<input type="text" class="form-control" name="player_ID">			
			</div>
			<div class="form-group">
				<label for="player_PW">비밀번호</label>
				<input type="password" class="form-control" name="player_PW">
			</div>
			<div class="form-group desk_idx_div">
				<label for="desk_idx">테이블 번호</label>
				<select name="desk_idx" id="desk_idx_select">
					<option value="1">1번테이블</option>
					<option value="2">2번테이블</option>
					<option value="3">3번테이블</option>
					<option value="4">4번테이블</option>
					<option value="5">5번테이블</option>
					<option value="6">6번테이블</option>
					<option value="7">7번테이블</option>
					<option value="8">8번테이블</option>
				</select>
				<!-- <input type="text" class="form-control" name="desk_idx"> -->
			</div>
			<button type="button" class="btn btn-primary" id="login_btn">로그인</button>
		</div>
	</div>
</form>

<script>
	$(document).ready(function(){
		$('#login_div').hide();
	})
	$('.desk_div').click(function(){
		$('#select_Form').attr("action", "${contextPath}/select/selectLogin");
		$('#select_Form').attr("method", "post");
		$('.store_management_div').removeClass('active');
		$('.desk_div').addClass('active');		
		$('.desk_idx_div').show();
		$('#login_div').show();
	})
	
	$('.store_management_div').click(function(){
		// 점포 운영 페이지로 보내기(로그인하고 보내기 때문에 post로 변경해야 됨)
		//$('#select_Form').attr("action", "${contextPath}/counter/counterBody/shopManagementForm");
		$('#select_Form').attr("action", "${contextPath}/select/shopFormLoginPro");
		$('#select_Form').attr("method", "post");
		$('.desk_div').removeClass('active');
		$('.store_management_div').addClass('active');
		$('.desk_idx_div').hide();
		$('#login_div').show();
	})
	
	$('#login_btn').click(function(){
		$('.desk_idx_div').val()
		$('#select_Form').submit();
	})
</script>
</body>
</html>