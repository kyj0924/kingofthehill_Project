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

	#food_Management{
		background-color: ivory;
	}

	#foodInsertTable{
		margin-top: 100px;
		text-align: left;
	}
	
	#foodInsertTable th, #foodInsertTable tr{
		color: #f5BC00;
	}
	
	#foodInsertTable td{
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
<form action="${contextPath }/foodInsert" method="post">
	<table class="table" id="foodInsertTable">
		<thead>
			<tr>
				<th>이름</th>
				<th>개수</th>
				<th>가격</th>
				<th>종류</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="text" name="food_Name" id="food_Name"></td>
				<td><input type="text" name="food_Count" id="food_Count"></td>
				<td><input type="text" name="food_Price" id="food_Price"></td>
				<td><input type="text" name="food_Type" id="food_Type"></td>
			</tr>
		</tbody>
	</table>
<button class="btn btn-info" type="submit" id="foodInsertSuccess">완료</button>
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
$('#foodInsertSuccess').click(function(){
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