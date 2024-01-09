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
	
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<style>
#body{
background-color: #1D1D2A;
color: #F5BC00;
}
#shop_Management {
	background-color: ivory;
}
hr{
border: 1px double #F5BC00;
}

.mainBody {
	margin: 0 50px;
}

.left {
	width: 45vw;
	float: left;
	text-align: center;
	border: 2px solid #F5BC00;
	border-radius: 30px;
	padding: 10px;
}

.time, .playing_Game, .order_List {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: large;
}

#order_List {
	height: 40vh;
}

.right {
	width: 45vw;
	height: 90vh;
	float: right;
}

.list-group {
	width: 35vw;
}

#td {
	height: 100px;
	font-size: 30px;
}

.table>#tbody>tr>td {
	vertical-align: middle;
}

.useing {
	padding: 10px 20px;
	border-radius: 40px;
	background-color: #ff9933;
	font-size: 20px;
	color: white;
}

.empty {
	padding: 10px 20px;
	border-radius: 40px;
	background-color: #00cc66;
	font-size: 20px;
	color: white;
}
.deskInfo{
	border-radius: 30px;
	border: 2px solid #F5BC00;
	background-color: #1D1D2A;
}
#playerInfo{
	border: 3px solid #F5BC00;
	background-color: #1D1D2A;
	border-radius: 6px;
	
}
#deskInfoTable{
	text-align: left;
}


</style>

<script type="text/javascript">
//=========================DeskList 정보를 받아오는 ajax==========================
	var Intervalset=setInterval(deskList,5000);
	$(document).ready(function(){
		console.log("hi");
		deskList();
		Intervalset
		
	});
	
	function deskList() {
		$.ajax({
			url:"callDeskList",
			type:"get",
			//data:{"desk_idx":desk_idx},
			dataType:"json",
			success:createViewDeskList,
			error:function(){
				alert("에러");
			}
		});
		
	}
	
	function createViewDeskList(data) {
		var arry = [];
		var deskList="<table class='table table-hover'>"
			deskList+="<thead>"	
			deskList+="<tr>"
			deskList+="<th>테이블 번호</th>"
			deskList+="<th>사용자,회원등급</th>"
			deskList+="<th>사용여부</th>"
			deskList+="<th><span class='glyphicon glyphicon-bell' style='color: red;'></span>:음식 및 게임 주문 <span class='glyphicon glyphicon-bell' style='color: #CCFFFF;'></span>:직원호출</th>"
			deskList+="</tr>"
			deskList+="</thead>"
			deskList+="<tbody id='tbody'>"
			
			
				$.each(data, function(index,call){
					
					
					if (data.indexOf(call) == 0) {
						$.each(call, function(index,obj){
							arry.push(obj);
						});
					
					}
					
					if (data.indexOf(call) == 1) {
						$.each(call, function(index,obj){
						deskList+="<tr>" 
						if(obj.player_ID == null || obj.player_ID == ""){
							deskList+="<td id='td'><span class='td_Text'>"+obj.desk_idx+"번</span></td>"
							deskList+="<td colspan='3' id='td'><span class='empty'>비어있는 방 사용가능</span></td>"	
						}else{
							deskList+="<td id='td'>"
				               
							deskList+="<input type='hidden' id='desk_idx"+obj.desk_idx+"' value='"+obj.desk_idx+"'/>"
							deskList+="<button type='button' class='deskInfo' onclick='deskInfo("+obj.desk_idx+")'><span class='td_Text'>"+obj.desk_idx+"번</span></button>"
				                
							deskList+="</td>"
							deskList+="<td id='td'>"+obj.player_ID+", "
							
							switch (arry[call.indexOf(obj)]) {
							case "폰":
								deskList+="<span class='glyphicon glyphicon-pawn'>";
								break;
							case "나이트":
								deskList+="<span class='glyphicon glyphicon-knight'>";
								break;
							case "비숍":
								deskList+="<span class='glyphicon glyphicon-bishop'>";
								break;
							case "퀸":
								deskList+="<span class='glyphicon glyphicon-queen'>";
								break;
							case "킹":
								deskList+="<span class='glyphicon glyphicon-king'>";
								break;
							default:
								deskList+="<span class='glyphicon glyphicon-pawn'>";
								break;
							}
							
							deskList+="</td>"
							deskList+="<td id='td'><span class='useing'>사용중</span>";
							if(obj.desk_Alarm == "true"){
								deskList+="<span class='glyphicon glyphicon-bell' style='color: red;'/>"
							}
							
							if(obj.call_Alarm == "true"){
								deskList+="<span class='glyphicon glyphicon-bell' style='color: #CCFFFF;'/>"
							}else{
								deskList+="<span class='glyphicon glyphicon-bell' style='display:none;'/>"
							}
							deskList+="</td>"
							if(obj.playTime == 0){
								deskList+="<td id='td'><a class='btn btn-danger btn-xs' id='requestPay' disabled href='#'>결제 <span class='glyphicon glyphicon-shopping-cart'></a><span style='font-size: 15px;'>사용 종료되지 않았습니다</span></td>"
							}else{
								deskList+="<td id='td'><a class='btn btn-danger btn-xs' id='requestPay' href='${contextPath}/payment?desk_idx="+obj.desk_idx+"'>결제 <span class='glyphicon glyphicon-shopping-cart'></a></td>"
							}
							

								
							
						}
						
						deskList+="<tr>"
					});
					}
					
						
				});
				
			
			deskList+="</tbody>"
			deskList+="</table>"
		$(".ajaxDeskListView").html(deskList);
	}

//=========================선택한 버튼의 정보를 받아오는 ajax==========================
	//데이터를 가져오는 ajax
	var Interval;
	
	function deskInfo(desk_idx) {
			deskInfo2();	
		
			clearInterval(Interval);
		
			Interval = setInterval(deskInfo2,5000);

		
		
		function deskInfo2() {
			$.ajax({
				url:"getDeskList/"+desk_idx,
				type:"post",
				data:{"desk_idx":desk_idx},
				dataType:"json",
				success:createViewDeskInfo,
				error:function(){
				
				}
			});
		
		}
	}
	//최종적인 화면출력
	function createViewDeskInfo(data) {
		var list = "사용중인 테이블의 정보입니다.";
		//사용자 정보를 불러오는 반복문
		$.each(data, function(index,obj){
			if (data.indexOf(obj) == 0) {
			$.each(obj, function(index,objData){
			list+="<h2>"+objData.desk_idx+"번 테이블</h2>";
			list+="<div class='time'>";
			list+="<ul  id='playerInfo'>"
			list+="<li >이용중인 고객:"+objData.player_Name+"님(회원ID:"+objData.player_ID+")</li>"
			list+="<li >이용시작 시간:"+objData.start_Time.substr(0, 16)+"</li>"
			list+="</ul>"
			list+="</div>"
	
			list+="<div class='playing_Game'>"
			list+="<ul class='list-group'>"
			
			if(objData.game_Name == null || objData.game_Name == ""){
				list+="<li class='list-group-item list-group-item-warning'>사용중인 게임이 없습니다.</li>"
			}else{
				list+="<li class='list-group-item list-group-item-warning'>사용중인 게임:"+objData.game_Name+"</li>"
			}
			
			list+="</ul>"
			list+="</div>"

			});
		}else{
			list+="<div class='deskInfo_container'>";
				list+="<h2>주문 내역</h2>";
				list+="<table class='table' id='deskInfoTable'>";
				list+="<thead>";
				list+="<tr>";
				list+="<th>주문 품목</th>";
				list+="<th>가격</th>";
				list+="<th>수량</th>";
				list+="<th>주문 시간</th>";
				list+="</tr>";
				list+="</thead>";
				list+="<tbody>";
			
			//주문내역을 불러오는 반목문
			$.each(obj, function(index,objData){
				list+="<tr>";
				list+="<td>"+objData.food_Name+"</td>";
				list+="<td>"+objData.food_Price+"&#8361;</td>";
				list+="<td>"+objData.food_Count+" 개</td>";
				list+="<td>"+objData.order_Time.substr(0, 16)+"</td>";
				list+="</tr>";
			});
			
			list+="</tbody>";
			list+="</table>";
			list+="</div>";
		}
		//작성한 list를 화면에 출력한다.
		$(".ajaxDeskLinfoView").html(list);
	});
};
	
</script>

</head>
<body id="body">
<input type="hidden" id="paymentCheckView" value=""/>
	<jsp:include page="../../always/owner_header.jsp" />

	<div class="mainBody">
		<!-- div 전체를 잡고있음 -->

		<div class="left">
			<!-- 좌측바디 -->
			<h2>테이블 상세 정보</h2>
			<hr style="border: 2px double #F5BC00;">
			<div class="ajaxDeskLinfoView">
			</div>
			
		</div>

		<div class="right">
			<!-- 우측바디 -->
			<div class="ajaxDeskListView">
			</div>
		</div>

	</div>

</body>
</html>