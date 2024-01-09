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
  /*
  	.headerMenu{
  		position:fixed;
  		top:0;
  	}
  */
  </style>
</head>
<body>
	<div class="headerMenu">
		<form id="menu_form">
			<input type="hidden" name="player_ID" value="">
			<button type="button" class="btn btn-default" id="home_btn">홈으로</button>
			<button type="button" class="btn btn-default" id="boardGame_btn">보드게임</button>
			<button type="button" class="btn btn-default" id="foodOrder_btn">음식주문</button>
			<c:if test="${login_check=='true' }">
				<button type="button" class="btn btn-default" id="myPage_btn">마이페이지</button>
			</c:if>
			<button type="button" class="btn btn-default" id="endGame_btn">사용종료</button>
			<label>테이블 번호 : ${desk.desk_idx }번</label>
		</form>
	</div>
	
	<script>
		$('#home_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/inner/desk/innerHome");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
		$('#boardGame_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/inner/desk/boardGameSearch");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
		$('#foodOrder_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/inner/desk/foodOrder");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
		$('#message_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/inner/desk/counterMessage");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
		$('#myPage_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/player/innerMyPage");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
		$('#endGame_btn').click(function(){
			$('#menu_form').attr("action", "${contextPath}/player/endGamePro");
			$('#menu_form').attr("method", "post");
			$('#menu_form').submit();
		})
	</script>
	
</body>
</html>