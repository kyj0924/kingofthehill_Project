<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<title>King Of The Hill</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
	function showAlert() {
		alert("직원호출이신청되었습니다");
	}
</script>

<style type="text/css">


.container-fluid {
	background-color: #2b2b2b;
}

.container {
	color: #fff;
	padding-top: 10px;
	font-size: 40px;
	width: 100px;
	text-align: center;
}

.container button {
	border-radius: 60px;
	background-color: #919191;
	font-family: 'fantasy';
	font-weight: bold;
	margin-right: 20px;
}

.headerMenu .btn {
	width: 180px;
	height: 50px;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3); <!--
	text-shadow: 2px 2px 4px #ffffff;
}

.all {
	background-color: #3c3c3c;
	border-radius: 80px;
	padding: 30px;
	margin-bottom: 100px;
	margin-left: 100px;
	margin-right: 100px;
}

#home_btn1 {
	font-size: 20px;
	background-color: #ff7;
	color: black;
	border: none;
	border-radius: 50px;
}

.row {
	text-align: center;
	color: white;
	background-color:;
	border-radius: 80px;
}

.table {
	border-radius: 50px;
	border-bottom: 2px solid #ffa;
	border-top: 2px solid #ffa;
}

.col {
	border-radius: 50px;
	border-left: 2px solid #919191;
	border-right: 2px solid #919191;
}

.table-no-border td, .table-no-border th {
	border: none;
}

body, html {
	background-color: #2b2b2b !important;
}
</style>
</head>
<body>

<div class="container-fluid" style="width: 1850px; overflow: hidden;">
		<div class="container">
			<jsp:include page="../../common/headerMenu.jsp" />
		</div>
		<div class="all">

			<div class="row">
				<div class="col-sm-4" style="background-color:">

					<div>
						<img src="../../resources/image/logonuggi.png"
							style="width: 230px; height: 230px;" />
					</div>
					<br>
					<div>
						<p>보드게임카페 이용방법</p>

						<p>'King of the Hill'은 우리 모두가 주인인</p>
						<p>국내 최초의 24시간 운영되는 보드게임 카페입니다.
						<p>보드게임 주문 및 음 료 주문과 구매는</p>
						<p>
							<b>'음식주문'</b>
						</p>
						<p>버튼을 클릭해주세요.</p>
						<p>매장 내 음주 및 흡연은 삼가 부탁드립니다.</p>
						<p>외부 음식은 반입을 자제해 주시기 바랍니다.</p>
						<p>나가시기 전에,</p>
						<p>이용하신 자리는 쾌적한 환경을 위해 깨끗하게</p>
						<p>정리해 주세요.</p>
						<p>놓고 가시는 물건이 없는지 한 번 확인해 주세요.</p>
						<br>
						<p>'King of the Hill'은 언제나 노력하는 카페이며,</p>
						<p>고객들의 만족을 위해 최선을 다하겠습니다.</p>
						<p>감사합니다.</p>
					</div>
				</div>
				<div class="col-sm-4" style="background-color:">
					<div class="col" style="height: 750px;">

						<table class="table-no-border">
							<br>
							<br>
							<thead>
								<tr>
									<th class="text-center d-none d-md-table-cell"
										style="height: 50px; width: 40%;">입실시간</th>
								</tr>
							</thead>

							<tbody>
								<tr>
									<td class="text-center d-none d-md-table-cell"
										style="height: 50px; width: 40%; font-size: 26px; color: 9a9a9a; font-weight: bold;">${pt}</td>
								</tr>
							</tbody>
						</table>
						<tr>
							<td colspan="1">
							<th class="text-center d-none d-md-table-cell"
								style="height: 50px; width: 20%;">주문내역</th>
						</tr>


						<div style="width: 100%; height: 470px; overflow: auto">
							<table class="table">
								<br>
								<thead>
									<tr>
										<th class="text-center d-none d-md-table-cell"
											style="height: 50px; width: 20%;">메뉴이름</th>
										<th class="text-center d-none d-md-table-cell"
											style="height: 50px; width: 20%;">메뉴가격</th>
										<th class="text-center d-none d-md-table-cell"
											style="height: 50px; width: 20%;">주문개수</th>
										<th class="text-center d-none d-md-table-cell"
											style="height: 50px; width: 20%;">주문시간</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${DeskOrderli}" var="DeskOrderla">
										<tr>
											<td class="text-center d-none d-md-table-cell"
												style="height: 50px; width: 20%;">${DeskOrderla.food_Name}</td>
											<td class="text-center d-none d-md-table-cell"
												style="height: 50px; width: 20%;">${DeskOrderla.food_Price}</td>
											<td class="text-center d-none d-md-table-cell"
												style="height: 50px; width: 20%;">${DeskOrderla.food_Count}</td>
											<td class="text-center d-none d-md-table-cell"
												style="height: 50px; width: 20%;">${DeskOrderla.order_Time}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>

				<div class="col-sm-4" style="background-color:;">

					<form action="${contextPath }/inner/desk/innerHomepro"
						method="get">
						<button type="submit" class="btn btn-default" id="home_btn1"
							style="WIDTH: 200pt; HEIGHT: 80pt; box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.5); text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3); font-family: 'fantasy';"
							onclick="showAlert()">직원호출</button>
						<div>
					</form>
					<br> <img src="../../resources/image/banner1.jpg" style="width: 380px; height: 100px; margin-left: 50px;" />
				</div>
				<br>
				<div id="mainimg">
					<div id="view">
						<ul class="list">
							<li><img
								src="${contextPath }/resources/image/0banner001.jpg"
								alt="img01"></li>
							<li><img
								src="${contextPath }/resources/image/0banner002.jpg"
								alt="img02"></li>
							<li><img
								src="${contextPath }/resources/image/0banner003.jpg"
								alt="img03"></li>
						</ul>
					</div>
					<ul class="btn">
						<li><a href="">1</a></li>
						<li><a href="">2</a></li>
						<li><a href="">3</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

</body>


<style>
#mainimg {
	width: 500px;
	height: 500px;
	position: relative;
	margin: 0 auto; /* 이미지를 수평으로 가운데로 정렬합니다 */
}

#view {
	width: 550px;
	height: 550px;
	position: relative;
	overflow: hidden;
}

#view li {
	position: absolute;
	top: 0;
	width: 100%;
	height: 350px;
}

#view li:nth-child(1) {
	left: 0%;
	background-color:;
}

#view li:nth-child(2) {
	left: 100%;
	background-color:;
}

#view li:nth-child(3) {
	left: 200%;
	background-color:;
}

#mainimg .btn {
	position: absolute;
	bottom: 30px;
	left: 50%;
	z-index: 9999;
	margin-left: -32.5px;
}

#mainimg .btn li {
	float: left;
	margin-right: 10px;
	width: 15px;
	height: 15px;
	border-radius: 50%;
	overflow: hidden;
}

#mainimg .btn li.on a {
	background-color: rgb(0, 0, 0);
}

#mainimg .btn a {
	display: block;
	text-indent: -9999px;
	overflow: hidden;
	background-color: white;
}
</style>
<script>
	$(document).ready(function() {
		var current = 0;
		var setIntervalId;

		// 디폴트인 이미지 1의 버튼에 클래스 지정
		$(".btn li").eq(0).addClass("on");

		timer();
		function timer() {
			setIntervalId = setInterval(function() {
				var n = current + 1; // 0,1,2
				// 이미지 3 (i=2) 이후에 흰 화면이 아니라 이미지 1로 돌아가도록 설정
				if (n == 3) {
					n = 0;
				}
				move(n);
			}, 2000);
		}

		function move(i) {
			var currentEl = $(".list li").eq(current); //current는 계속 변화하는 값이다
			var nextEl = $(".list li").eq(i);

			//애니메이션 지정(움직이는 액션)
			currentEl.css({
				left : "0%"
			}).animate({
				left : "-100%"
			});
			nextEl.css({
				left : "100%"
			}).animate({
				left : "0%"
			});
			current = i;
			//현재화면에 보이는 요소 인덱스값 current
			//다음에 화면에 보이는 요소 인덱스값이 i
			//애니메이션이 동작하고 나면 현재 current에는 i값을 대입해서
			//다음애니메이션이 될때는 i가 current가 됨

			//버튼에 클래스 지정
			$(".btn li").removeClass("on");
			$(".btn li").eq(i).addClass("on");
		}

		// 이미지에 커서를 올릴 시, 배너 애니메이션 멈춤
		// 커서를 치울 시, 애니메이션 재개
		$("#mainimg").on({
			mouseover : function() {
				clearInterval(setIntervalId);
			},
			mouseout : function() {
				timer();
			},
		});

		// 버튼 클릭 시에도 이미지 애니메이션 실행
		$(".btn li").click(function(e) {
			e.preventDefault();
			var i = $(this).index();
			move(i);
		});
	});
</script>


</html>