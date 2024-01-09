<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />


<head>
<title>King Of The Hill</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<style>

.timeButton {
	width: 150px; /* 버튼의 너비 */
	height: 150px; /* 버튼의 높이 */
	font-size: 25px; /* 버튼의 글꼴 크기 */
	margin: 10px; /* 버튼 사이의 간격 */
	border-radius: 50px;
	background-color: #868296;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3);
	color: #FFFFFF; /* 버튼의 글자색 */
	border: 2px solid #FFFFFF; /* 버튼의 테두리 색상을 빨간색으로 설정 */
}

.usingButton {
	width: 150px;
	height: 150px;
	font-size: 30px;
	margin: 20px;
	border-radius: 50px;
	background-color: #adb5bd;
	box-shadow: inset 0px 0px 10px 5px rgba(255, 255, 255, 0.3);
	color: #ff9999;
	border: 2px solid #FFFFFF; /* 버튼의 테두리 색상을 빨간색으로 설정 */
}

.title01 h2 {
	font-weight: bold;
	font-size: 40px;
	color: #343a40;
	text-transform: uppercase;
}

.all {
	padding: 50px;
	border-radius: 25px;
	background-color: #e9ecef;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3);
}

.all-border {
	border: 1px solid rgba(0, 0, 0, 0.5);
}

body, html {
	background-color: #F0ECE5 !important;
}

.footer {
	background-color: #2d2d30;
	color: #f5f5f5;
	padding: 32px;
	 width: 100%;
}

.footer a {
	color: #f5f5f5;
}

.footer a:hover {
	color: #777;
	text-decoration: none;
}



</style>


<script type="text/javascript">
	var Intervalset = setInterval(timeList, 5000);

	$(document).ready(function() {
		timeList();
		Intervalset;
	});

	function timeList() {
		$.ajax({
			url : "RealTimeList",
			type : "get",
			dataType : "json",
			success : createViewRealTimeList,
			error : function() {
				alert("에러");
			}
		});
	}

	function createViewRealTimeList(data) {
		var arry = [];
		var timeList = "<table class='table table-hover'>";
		timeList += "<thead>";
		timeList += "<tr>";
		timeList += "</tr>";
		timeList += "</thead>";
		timeList += "<tbody id='tbody'>";

		$
				.each(
						data,
						function(index, obj) {
							timeList += "<tr>";
							if (obj.player_ID == null || obj.player_ID == "") {
								timeList += "<span id='span'><button type='button' class='timeButton' onclick='timeButton("
										+ obj.desk_idx
										+ ")'><span class='empty'>"
										+ obj.desk_idx
										+ "번 <br>사용 가능</span></button></td>";

							} else {
								timeList += "<span id='span'><button type='button' class='usingButton'><span class='using'>"
										+ obj.desk_idx
										+ "번<br> 사용중</span></button></td>";

							}
							timeList += "<tr>";
						});

		timeList += "</tbody>";
		timeList += "</table>";
		$(".ajaxRealTimeinfoView").html(timeList);
	}
</script>

</head>
s
<body>
	<jsp:include page="../common/outer_header.jsp" />

	 <div class="container-fluid1"> 
		<br>
		<br>
		<br>
		<br>

		<div class="text-center"
			style="margin-left: 400px; margin-right: 400px;">

			<div class="all">

				<div class="ajaxRealTimeinfoView"></div>
			</div>
			<br>
			<br>
			<h2>KING OF THE HILL 테이블 현황</h2>
			<br>
			<p>-공간소개-</p>
			<p>당사의 카페는 생일이나 기념일과 같은 의미 있는 날에 파티를 즐기기에 안성맞춤인 공간과 서비스를 제공하고
				있습니다.</p>
			<p>파티룸은 다양한 소품으로 장식되어 있어 사진을 찍기에도 좋습니다.</p>
			<p>또한, 보드게임을 즐길 수 있는 보드게임카페로서 파티와 함께 다양한 보드게임을 즐길 수 있습니다.</p>
			<p></p>
			<p>음료 및 커피는 다양한 종류를 제공하며, 맛있는 치킨과 식사도 가능합니다.</p>
			<p>고객님의 취향에 맞는 음료와 식사를 즐기실 수 있습니다.</p>
			<p></p>
			<p>또한, 전용 흡연실과 화장실도 구비되어 있어 편안한 공간을 제공합니다.</p>
			<p>고객님의 편의를 위해 친절하고 부드러운 서비스로 최선을 다하겠습니다.</p>
			<p></p>
			<p>더 궁금하신 사항이 있으시면 언제든지 말씀해주세요! 저는 여러분을 도와드리기 위해 여기에 있습니다. 😊</p>

		</div>

		<br>
		<br>
		<br>
		<br>
			
		<div style="text-align: right;">
			<img img src="/ezen/resources/image/logonuggi.png" alt="로고"
				style="width: 100px;">
		</div>

		<!-- Footer -->
		<div class=footer>
			<footer class="text-center">
				<a class="up-arrow" href="#" data-toggle="tooltip" title="TO TOP">
					<span class="glyphicon glyphicon-chevron-up"></span>
				</a><br>
				<br>
				<p>
					KING OF THE HILL <a href=""
						data-toggle="tooltip" title="w3schools"></a>
				</p>
			
			</footer>
		</div>

			</div>
</body>
</html>