<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<title>King Of The Hill</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	body, html {
        background-color: #1D1D2A !important;
    }

	#player_Management{
		background-color: ivory;
	}
	
	#playerTable{
		margin-top: 100px;
		text-align: left;
	}
	
	#playerTable th, #playerTable tr{
		color: #F5BC00;
	}
	
	#playerTable td{
		color: black;
	}

	#pw_ErrorMessage{
		color: red;
	}

</style>

<script>
$(document).ready(function(){
	$('#pw_ErrorMessage').hide();
	
	$('#pw_text, #pw_text2').keyup(function(){
		
		var pw_text=$('#pw_text').val();
		var pw_text2=$('#pw_text2').val();
		
		if(pw_text != pw_text2){
			$('#pw_ErrorMessage').show();
		}else{
			$('#pw_ErrorMessage').hide();
		}
	});
	
	var warning = "${warning}";
    if(warning && warning.trim() != ""){
        $('#myModal').modal('show');
    }
});


</script>

</head>
<body>
<jsp:include page="../../always/owner_header.jsp" />
<div class="container">
<form action="${contextPath }/playerUpdate?player_idx=${pl.player_idx}" method="post">
<input type="hidden" name="player_idx" value="${pl.player_idx}">
	<table class="table" id="playerTable">
		<thead>
			<tr>
				<th>비밀번호</th>
				<th>비밀번호 확인</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input type="password" id="pw_text" name="player_PW" value="${pl.player_PW }">
				</td>
				<td>
					<input type="password" id="pw_text2" name="player_PW2" value="${pl.player_PW }">
				</td>
			</tr>
		</tbody>
	</table>
	<p id="pw_ErrorMessage">비밀번호가 일치하지 않습니다.</p>
	<button type="submit" class="btn btn-info" id="playerModifyBtn">수정완료</button>
	<a class="btn btn-danger" href="${contextPath}/playerDelete?player_idx=${pl.player_idx}">삭제</a>
</form>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">${warning}</h4>
        </div>
        <div class="modal-body">${warningMessage }</div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
</div>

<script>
$('#playerModifyBtn').click(function(){
	var pwText=$('#pw_text').val();
	var pwText2=$('#pw_text2').val();
	
	if(pwText==="" || pwText2===""){
		alert("내용을 입력하세요.");
		return false;
	}
});
</script>

</body>
</html>