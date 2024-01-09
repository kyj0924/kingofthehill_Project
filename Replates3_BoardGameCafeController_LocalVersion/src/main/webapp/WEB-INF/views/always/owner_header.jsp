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
	.body{
		display:flex;
      	justify-content: center;
      	align-items: center;
      	height: 100vh;
	}
	.container{
		text-align: center;
	}
	.btn{
		margin: 10px;
		padding: 10px 30px;
	}
</style>

</head>
<body>

<div class="container">
<form id="frm">
  <div class="btn-group">		<!-- 해당 링크 클릭 시 컨트롤러로 이동  -->
	<a href="${contextPath }/shopForm" id="shop_Management" class="btn btn-default">매장 관리</a>
	<a href="${contextPath }/foodForm" id="food_Management" class="btn btn-default">음식 관리</a>
	<a href="${contextPath }/gameForm" id="game_Management" class="btn btn-default">게임 관리</a>
	<a href="${contextPath }/playerForm" id="player_Management" class="btn btn-default">회원 관리</a>
	<a href="${contextPath }/salesForm" id="sales_Management" class="btn btn-default">매출 관리</a>
  </div>
</form>
</div>
</body>
</html>
