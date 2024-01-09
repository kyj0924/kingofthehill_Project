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
	
	.select_member_type{
		width:100%;
		height:70vh;
		display:flex;
		text-align:center;
		align-items:center;
		justify-content:center;
	}
	
	.member_yes_div{
		border:4px solid #F5BC00;
		border-radius:50px;
		margin-right:30px;
		color:#F5BC00;
		cursor:pointer;
	}
	
	.member_no_div{
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
	<input type="hidden" value="${login_check }" name="login_check" id="login_check">
	<input type="hidden" value="${desk.desk_idx }" name="desk_idx" id="desk_idx">
	<!-- 
	<div class="desk_number">
		<label for="desk_num">테이블 번호 : ${desk.desk_idx }번</label>
	</div>
	 -->
	<div class="select_member_type">
		<div class="member_yes_div">
			<img src="../resources/image/member.png" alt="member_yes_img" id="member_yes_img" style="width:300px; height:300px;"/><br>
			<label for="member_yes">회원</label>
		</div>
		<div class="member_no_div">
			<img src="../resources/image/nonmember.png" alt="member_no_img" id="member_no_img" style="width:300px; height:300px;"/><br>
			<label for="member_no">비회원</label>
		</div>
	</div>
</form>

<script>
	$('.member_yes_div').click(function(){
		$('#select_Form').attr("action", "${contextPath}/player/innerLogin");
		$('#select_Form').attr("method", "post");
		$('#login_check').val("true");
		$('#select_Form').submit();
	})
	
	$('.member_no_div').click(function(){
		$('#select_Form').attr("action", "${contextPath}/player/notMemberLogin");
		//$('#select_Form').attr("action", "${contextPath}/inner/desk/foodOrder");
		$('#select_Form').attr("method", "post");
		$('#login_check').val("false");
		$('#select_Form').submit();
	})
</script>
</body>
</html>