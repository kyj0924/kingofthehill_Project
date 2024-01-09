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

	#food_Management{
		background-color: ivory;
	}
	
	#foodTable{
		margin-top: 100px;
		text-align: left;
	}
	
	#foodTable th, #foodTable tr, #foodTable td span{
		color: #F5BC00;
	}
	
	#foodTable td{
		color: black;
	}
	
	.foodImageForm {
		display: none;
	}
	
	#foodImage_Insert{
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
        
        $('#foodImage_Insert').click(function () {
            $('.foodImageForm').toggle();
            var buttonText = ($(this).text() === '이미지 등록하기') ? '취소하기' : '이미지 등록하기';
            $(this).text(buttonText);
        });
});
    
</script>

</head>
<body>
<jsp:include page="../../always/owner_header.jsp" />
<div class="container">
<form action="${contextPath }/foodUpdate?food_idx=${fm.food_idx}" method="post">
<input type="hidden" name="food_idx" value="${fm.food_idx}">

	<table class="table" id="foodTable">
		<thead>
			<tr>
				<th>고유 번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>개수</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<input style="background-color:rgb(184, 181, 181);" type="text" name="food_idx" readonly="readonly" value="${fm.food_idx }">
				</td>
				
				<c:if test="${fm.food_Image eq '' || empty fm.food_Image}">
					<td><span class="glyphicon glyphicon-question-sign"></span>
					</td>
				</c:if>
				<c:if test="${fm.food_Image ne '' || !empty fm.food_Image}">
					<td>
						<img src="${contextPath}/resources/upload/${fm.food_Image}" class="img-rounded" alt="Cinque Terre" width="50" height="50">
					</td>
				</c:if>
			
				<td>
					<input type="text" name="food_Name" id="food_Name" value="${fm.food_Name }">
				</td>
				<td>
					<input type="text" name="food_Count" id="food_Count" value="${fm.food_Count }">
				</td>
				<td>
					<input type="text" name="food_Price" id="food_Price" value="${fm.food_Price }">
				</td>
				<td>
					<input type="text" name="food_Type" id="food_Type" value="${fm.food_Type }">
				</td>
			</tr>
		</tbody>
	</table>
	<button type="submit" class="btn btn-info" id="foodModifyBtn">수정완료</button>
	<a class="btn btn-danger" href="${contextPath}/foodDelete?food_idx=${fm.food_idx}">삭제</a>
</form>
<button id="foodImage_Insert" class="btn btn-default">이미지 등록하기</button>	
	
<div class="foodImageForm">
<form action="${contextPath }/foodImageUpdate?food_idx=${fm.food_idx}" method="post" enctype="multipart/form-data">
<table class="table" style="text-align:left;">
	<tbody>
		<tr>
			<c:if test="${fm.food_Image eq '' || empty fm.food_Image}">
				<td><span class="glyphicon glyphicon-question-sign"></span></td>
			</c:if>
			<c:if test="${fm.food_Image ne '' || !empty fm.food_Image}">
				<td><img src="${contextPath}/resources/upload/${fm.food_Image}" class="img-rounded" alt="Cinque Terre" width="50" height="50"></td>
			</c:if>
			<td><input type="file" id="file" name="food_Image" style="color:rgb(246, 169, 208)"></td>
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
$('#foodModifyBtn').click(function(){
	var foodName = $('#food_Name').val();
    var foodCount = $('#food_Count').val();
    var foodPrice = $('#food_Price').val();
    var foodType = $('#food_Type').val();
    
    if(foodName === "" || isNaN(foodCount) || isNaN(foodPrice) || foodType === ""){
        alert("내용을 입력하세요.");
        return false;
    }
});
</script>

</body>
</html>