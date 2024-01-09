<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>King Of The Hill</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style>
  	body{
  		width:100vw;
  		height:100vh;
  		display:flex;
  		align-items:center;
  		flex-direction: column;
  		background-color:#1D1D2A;
  	}
  	
  	
  	.title{
  		text-align:center;
  		color:#F5BC00;
  	}
  	
  	.title_join{
  		color:#F5BC00;
  	}
  	
  	.join_div{
  		width:500px;
  		height:500px;
  		color:#F5BC00;
  	}
  	
  	.player_Icon{
  		text-align:center;
  		align-items:center;
  		justify-content:center;
  	}
  	
  	.view_row{
  		display:flex;
  	}
  	
  </style>
</head>
<body>
	<div class="logo_img_div">
		<img src="../resources/image/cafe_logo_sm.png" alt="cafe_logo" style="width:400px; height:400px;">
	</div>
	<h2 class="title">KING OF THE HILL 보드게임 카페</h1>
	<div class="player_Icon">
		<img src="../resources/image/player_Icon.png" alt="player_Icon" style="width:100px; height:100px;">
	</div>
	<h4 class="title_join">회원가입</h4>
	<div class="join_div">
		<form id="join_form">
			<input type="hidden" value="${desk.desk_idx }" name="desk_idx" id="desk_idx">
			<input type="hidden" value="false" id="id_check">
			<!-- 
			<input type="hidden" value="${login_check }" name="login_check" id="login_check">
			 -->
			<div class="form-group">
				<label for="player_ID">아이디</label>
				<div class="view_row">
					<input type="text" class="form-control" name="player_ID" id="player_ID" placeholder="아이디를 입력하세요">
					<button type="button" class="btn btn-info" id="check_btn">중복확인</button>
				</div>
							
			</div>
			<div class="form-group">
				<label for="player_PW">비밀번호</label>
				<input type="password" class="form-control" name="player_PW" id="player_PW" placeholder="비밀번호를 입력하세요">
			</div>
			<div class="form-group">
				<label for="player_PW2">비밀번호 확인</label>
				<input type="password" class="form-control" id="player_PW2" placeholder="비밀번호를 한번 더 입력하세요">
				<p class="pw_NotCorrectError_msg">비밀번호와 비밀번호 확인이 일치하지 않습니다</p>
			</div>
			<div class="form-group">
				<label for="player_Name">이름</label>
				<input type="text" class="form-control" name="player_Name" id="player_Name" placeholder="이름을 입력하세요">
			</div>
			<div class="form-group">
				<label for="player_Tel">연락처</label>
				<input type="text" class="form-control" name="player_Tel" id="player_Tel" placeholder="010-1234-5678 형태로 입력하세요">
			</div>
			<div class="form-group">
				<label for="player_Email">이메일</label>
				<input type="text" class="form-control" name="player_Email" id="player_Email" placeholder="abc@naver.com 형태로 입력하세요">
			</div>
			
			<button type="button" class="btn btn-primary" id="join_btn" data-toggle="modal" data-target="#myModal">가입</button>
			<button type="button" class="btn btn-success" id="reset_btn">취소</button>
		
		</form>
	</div>
	
	<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
        <div class="modal-body">
          <p></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
	
	<script>
		$('#join_btn').click(function(){
			// 아이디를 입력하지 않으면
			if($('#player_ID').val()==""){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>아이디를 입력하세요</p>");
				$('#myModal').show();
				//alert("아이디를 입력하세요");
			}
			
			// 아이디 중복체크를 하지 않으면
			else if($('#id_check').val()=='false'){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>아이디 중복체크를 해야합니다</p>");
				$('#myModal').show();
			}
			
			// 비밀번호를 입력하지 않으면
			else if($('#player_PW').val()==""){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>비밀번호를 입력하세요</p>");
				$('#myModal').show();
			}
			// 비밀번호와 비밀번호 확인이 일치하지 않으면
			else if($('#player_PW').val()!=$('#player_PW2').val()){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>비밀번호와 비밀번호 확인이 일치하지 않습니다</p>");
				$('#myModal').show();
			}
			// 이름을 입력하지 않으면
			else if($('#player_Name').val()==""){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>이름을 입력하세요</p>");
				$('#myModal').show();
			}
			// 연락처를 입력하지 않으면
			else if($('#player_Tel').val()==""){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>연락처를 입력하세요</p>");
				$('#myModal').show();
			}
			// 이메일을 입력하지 않으면
			else if($('#player_Email').val()==""){
				$('.modal-title').text("error");
				$('.modal-body').html("<p>이메일을 입력하세요</p>");
				$('#myModal').show();
			}
			// 모든 값이 입력되었을 때 submit
			else{
				$('#join_form').attr("action", "${contextPath}/player/joinPro");
				$('#join_form').attr("method", "post");
				//$('#login_check').val("true");
				$('#join_form').submit();	
			}
			
		})
		
		$('#reset_btn').click(function(){
			$('#join_form').attr("action", "${contextPath}/player/innerLogin");
			$('#join_form').attr("method", "post");
			//$('#login_check').val("true");
			$('#join_form').submit();
		})
		
		// 페이지 시작 시 실행 시킬 함수들
		$(document).ready(function(){
			$('.pw_NotCorrectError_msg').hide();
			//$('#myModal').hide();
		})
		
		$('#player_ID').keyup(function(){
			$('#id_check').val('false');
		})
					
		$('#player_PW').keyup(function(){
			if($('#player_PW').val()==$('#player_PW2').val()){
				$('.pw_NotCorrectError_msg').hide();
			}
			else{
				$('.pw_NotCorrectError_msg').css("color", "red");
				$('.pw_NotCorrectError_msg').show();
			}
		})
		
		$('#player_PW2').keyup(function(){
			if($('#player_PW').val()==$('#player_PW2').val()){
				$('.pw_NotCorrectError_msg').hide();
			}
			else{
				$('.pw_NotCorrectError_msg').css("color", "red");
				$('.pw_NotCorrectError_msg').show();
			}
		})
		
		$('#check_btn').click(function(){
			var player_ID = $("#player_ID").val();
			if(player_ID.length==0){
				alert("아이디를 입력하세요");
			}
			else{
				// 입력한 ID를 서버로 전송하여 중복 여부 확인
				$.ajax({
					url : "checkDuplicateId",
					type : "POST",
					data : {"player_ID" : player_ID},
					success : function(response){
						if(response === "available"){
							$('#id_check').val("true");
							alert("사용 가능한 아이디입니다");
						}
						else{
							alert("이미 사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
						}
					},
					error : function(){
						alert("중복 체크 중 오류가 발생했습니다");
					}
					
				});
			}
		});
		
	</script>
	
</body>
</html>