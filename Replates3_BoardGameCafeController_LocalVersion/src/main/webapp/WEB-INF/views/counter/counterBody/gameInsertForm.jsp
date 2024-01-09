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
	body, html {
        background-color: #1D1D2A !important;
    }

	#game_Management{
		background-color: ivory;
	}
	
	#gameInsertTable{
		margin-top: 100px;
		text-align: left;
	}
	
	#gameInsertTable th, #gameInsertTable tr{
		color: #F5BC00;
	}
	
	#gameInsertTable td{
		color: black;
	}
</style>

<script type="text/javascript">
	$(document).ready(function(){
    	var warning = "${warning}";
    	if(warning && warning.trim() !== ""){
        	$('#myModal').modal('show');
   		}
	});
</script>

</head>
<body>
<jsp:include page="../../always/owner_header.jsp" />
<div class="container">
<form action="${contextPath }/gameInsert" method="post">
	<table class="table" id="gameInsertTable">
		<thead>
			<tr>
				<th>이름</th>
				<th>사용가능 개수</th>
				<th>총 개수</th>
				<th>가격</th>
				<th>정보</th>
				<th>게임 인원수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="game_Name" id="game_Name"></td>
				<td><input type="text" name="game_Count" id="game_Count"></td>
				<td><input type="text" name="game_TotalCount" id="game_TotalCount"></td>
				<td><input type="text" name="game_Price" id="game_Price"></td>
				<td><input type="text" name="game_info" id="game_info"></td>
				<td><input type="text" name="game_PlayerNum" id="game_PlayerNum"></td>
			</tr>
		</tbody>
	</table>
	<button class="btn btn-info" type="submit" id="gameInsertSuccess">완료</button>
</form>
</div>

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"><c:out value="${warning}" /></h4>
        </div>
        <div class="modal-body"><c:out value="${warningMessage }"/></div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>

<script>
$('#gameInsertSuccess').click(function(){
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