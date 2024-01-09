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

	#game_Management{
		background-color: ivory;
	}
	
	#gameTable{
		margin-top: 100px;
		text-align: left;
	}
	
	#gameTable tbody{
		border-bottom: 2px solid #1D1D2A !important;
	}
	
	#gameTable th, #gameTable tr, #gameTable td span{
		color: #F5BC00;
	}
	
	#gameTable td{
		color: black;
	}
	
	.gameImageForm{
		display: none;
	}
	
	#gameImage_Insert{
		padding: 5px;
		width: 120px;
	}
	
</style>

<script type="text/javascript">
    $(document).ready(function(){
    	
    	var warning = "${warning}";
        if(warning && warning.trim() != ""){
            $('#myModal').modal('show');
        }
        
        $('#gameImage_Insert').click(function(){
        	$('.gameImageForm').toggle();
            var buttonText = ($(this).text() === '이미지 등록하기') ? '취소하기' : '이미지 등록하기';
            $(this).text(buttonText);
        });
    });
</script>

</head>
<body>
<jsp:include page="../../always/owner_header.jsp" />
<div class="container">
<form action="${contextPath }/gameUpdate?game_idx=${gm.game_idx}" method="post">
<input type="hidden" name="game_idx" value="${gm.game_idx}">

	<table class="table" id="gameTable">
		<thead>
			<tr>
				<th>고유 번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>사용가능 개수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input style="background-color:rgb(184, 181, 181);" type="text" name="game_idx" readonly="readonly" value="${gm.game_idx }">
				</td>
				
				<c:if test="${gm.game_Image eq '' || empty gm.game_Image}">
					<td><span class="glyphicon glyphicon-question-sign"></span></td>
				</c:if>
							
				<c:if test="${gm.game_Image ne '' || !empty gm.game_Image}">
					<td><img src="${contextPath}/resources/upload/${gm.game_Image}" style="width:50px; height:50px;"></td>
				</c:if>
				
				<td>
					<input type="text" name="game_Name" id="game_Name" value="${gm.game_Name }">
				</td>
				<td>
					<input type="text" name="game_Count" id="game_Count" value="${gm.game_Count }">
				</td>
			</tr>
		</tbody>
		<thead>
			<th>총 개수</th>
			<th>가격</th>
			<th>정보</th>
			<th>게임 인원수</th>
		</thead>
		<tbody>
			<td>
				<input type="text" name="game_TotalCount" id="game_TotalCount" value="${gm.game_TotalCount }">
			</td>
			<td>
				<input type="text" name="game_Price" id="game_Price" value="${gm.game_Price }">
			</td>
			<td>
				<input type="text" name="game_Price" id="game_Price" value="${gm.game_info }">
			</td>
			<td>
				<input type="text" name="game_PlayerNum" id="game_PlayerNum" value="${gm.game_PlayerNum }">
			</td>
		</tbody>
	</table>
	<button type="submit" class="btn btn-info" id="gameModifyBtn">수정완료</button>
	<a class="btn btn-danger" href="${contextPath}/gameDelete?game_idx=${gm.game_idx}">삭제</a>
</form>
<button id="gameImage_Insert" class="btn btn-default">이미지 등록하기</button>

<div class="gameImageForm">
<form action="${contextPath }/gameImageUpdate?game_idx=${gm.game_idx }" method="post" enctype="multipart/form-data">
<table class="table" style="text-align:left;">
	<tbody>
		<tr>
			<c:if test="${gm.game_Image eq '' || empty gm.game_Image}">
			<td><span class="glyphicon glyphicon-question-sign"></span></td>
			</c:if>
							
			<c:if test="${gm.game_Image ne '' || !empty gm.game_Image}">
			<td><img src="${contextPath}/resources/upload/${gm.game_Image}" style="width:50px; height:50px;"></td>
			</c:if>
			<td><input type="file" id="file" name="game_Image" style="color:rgb(246, 169, 208)"></td>
			<td colspan="2"><button type="submit" class="btn btn-primary btn-xs">등록하기</button></td>
		</tr>
	</tbody>
</table>
</form>
</div>
</div>

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
$('#gameModifyBtn').click(function(){
	var gameName=$('#game_Name').val();
	var gameCount=$('#game_Count').val();
	var gameTotalCount=$('#game_TotalCount').val();
	var gamePrice=$('#game_Price').val();
	var gameInfo=$('#game_info').val();
	var gamePlayerNum=$('#game_PlayerNum').val();
	
	if(gameName==="" || isNaN(gameCount) || isNaN(gameTotalCount) || isNaN(gamePrice) || gameInfo==="" || gamePlayerNum===""){
		alert("내용을 입력하세요.");
		return false;
	}
});
</script>
</body>
</html>