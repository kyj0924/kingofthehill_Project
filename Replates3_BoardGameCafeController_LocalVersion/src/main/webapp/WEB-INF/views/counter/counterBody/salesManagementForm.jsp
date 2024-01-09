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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
	body, html {
        background-color: #1D1D2A !important;
    }

	#sales_Management {
		background-color: ivory;
	}
	
	.container h2{
		float: left;
		margin-top: 50px;
		color: #F5BC00;
	}
	
	#datePick{
		float: right;
	}
	
</style>

</head>
<body>
	<jsp:include page="../../always/owner_header.jsp" />

	<div class="container">
	<h2>매출 그래프</h2>
	 <div id="datePick" class="row date-picker">
        <label for="selectedDate" style="color:white;">날짜 선택:</label>
        <input type="date" id="selectedDate" onchange="loadSelectedDate()">
    </div>
		<div class="row">
			<canvas id="myChart"></canvas>
		</div>
	</div>


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">선택한 날짜의 매출</h4>
        </div>
        <div class="modal-body"><p id="modalContent"></p></div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
</div>



<script>
$(document).ready(function () {
    // AJAX 요청
    $.ajax({
        url: "${contextPath}/getSevenDaySales",
        type: "GET",
        dataType: "json",
        success: function (serverData) {
            // 현재 날짜
            const currentDate = new Date();
            
            // 1주일 전의 날짜
            const oneWeekAgo = new Date(currentDate);
            oneWeekAgo.setDate(currentDate.getDate() - 7);

            // serverData에서 1주일 전 이후의 데이터만 필터링
            const filteredData = serverData.filter(entry => new Date(entry.day_Data) >= oneWeekAgo);
            
            // 필터링된 데이터로 labels와 data 생성
            const labels = filteredData.map(entry => new Date(entry.day_Data).toLocaleDateString());
            const data = filteredData.map(entry => entry.total_Price);
         	
            const config = {
            	type: 'line',
            	data: {
            		labels: labels,
                    datasets: [{
                        label: '매출',
                        data: data,
                        fill: false,
                        borderColor: '#F5BC00',
                        tension: 0.1,
                        pointBackgroundColor: 'white',
                        pointHoverBorderColor: 'red',
                    }]
            	},
            	options: {
            		 plugins: {
            	            legend: {
            	                labels: {
            	                    color: 'white'  // 레이블 텍스트 색상 변경
            	                }
            	            }
            	        },
                    scales: {
                        x: {
                            grid: {
                                color: '#5f5f85'  // x축 눈금선 색상 변경
                            },
                            ticks: {
                                color: 'white'  // x축 눈금 색상 변경
                            }
                        },
                        y: {
                            grid: {
                                color: '#5f5f85'  // y축 눈금선 색상 변경
                            },
                            ticks: {
                                color: 'white'  // y축 눈금 색상 변경
                            }
                        }
                    }
                }
            };

            const ctx = document.getElementById('myChart').getContext('2d');
            new Chart(ctx, config);
            
            $('#selectedDate').change(function () {
                const selectedDate = new Date($(this).val());
                loadGraph(selectedDate);
            });
            
        },
        error: function () {
            alert("데이터를 불러오는 중에 오류가 발생했습니다.");
        }
    });
});

	function loadSelectedDate(){
		var selectedDate=$('#selectedDate').val();
		
		$.ajax({
	        url: "${contextPath}/selectDate",
	        type: "GET",
	        data: { selectedDate: selectedDate },
	        dataType: "json",
	        success: function (data) {
	        	var modalContent = selectedDate + " 총 매출: " + data.total_Price + "원";
	            $('#modalContent').text(modalContent);
	            $('#myModal').modal('show'); // 모달 표시
	        },
	        error: function () {
	            alert("데이터를 불러오는 중에 오류가 발생했습니다.");
	        }
	    });
	}
</script>
</body>
</html>