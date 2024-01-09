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
    alert("보드게임이신청되었습니다."); 
}
</script>


<style type="text/css">
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
	width: 180px;
	height: 50px;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3); <!--
	text-shadow: 2px 2px 4px #ffffff;
	-->
}

.all {
	background-color: #3c3c3c;
	border-radius: 80px;
	padding: 30px;
	margin-bottom: 100px;
	margin-left: 100px;
	margin-right: 100px;
}

.table-responsive {
	margin: 0 auto;
	width: 80%;
	background-color: #ddd;
	border-radius: 50px;
	border-bottom: 2px solid #ffa;
	border-top: 2px solid #ffa;
	background-color: rgba(255, 255, 255, 0.5);
}

#home_btn1 {
	font-size: 15px;
	background-color: #d5d5d5;
	color: black;
	border-radius: 50px;
	box-shadow: inset 0px 0px 10px 5px rgba(0, 0, 0, 0.3);
	text-shadow: 2px 2px 4px #ffffff;
}

h1 {
	color: #0f58bc;
	text-align: center;
	text-shadow: 1px 1px 1px #fff;
}

  .custom-link {
    color: #1a1a1a; /* 변경하고자 하는 색상으로 설정하세요 */
  }

body, html {
	background-color: #2b2b2b !important;
}
</style>
</head>
<body>


	<div class="container-fluid" style="width: 1850px;">
		<div class="container">
			<jsp:include page="../../common/headerMenu.jsp" />
		</div>
		<div class="all">

			<h1 style="color: #ffa; font-family: 'fantasy'; font-weight: bolder;">보드게임
				리스트</h1>
			<p style="color: #ff9; text-align: center; font-family: 'fantasy';">
				(게임을 선택할 때는 참여하는 인원, 게임 시간, 난이도 등을 고려하여 즐길 수 있는 게임을 선택하시면 더욱 재미있게
				플레이하실 수 있습니다.)</p>
			<br>

			<div class="table-responsive">
				<table class="table">
					<br>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell"
								style="height: 10px; width: 10%;">이미지</th>
							<th class="text-center d-none d-md-table-cell"
								style=" width: 30%;">보드게임이름</th>
							<th class="text-center d-none d-md-table-cell"
								style=" width: 10%;">총개수</th>
							<th class="text-center d-none d-md-table-cell"
								style=" width: 10%;">사용가능개수</th>
							<th class="text-center d-none d-md-table-cell"
								style=" width: 10%;">인원</th>
							<th class="text-center d-none d-md-table-cell"
								style=" width: 20%;">보드게임설명</th>
										
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${GameMenuli}" var="li">

							<form action="${contextPath }/inner/desk/boardGameSearchPro"
								method="get" >

								<tr>
									<td><img
										src="${contextPath }/resources/upload/${li.game_Image}"
										style="width: 30px; height: 30px; margin-left: 40px;"></td>

									<td class="text-center d-none d-md-table-cell"
										style="height: 10px; width: 30%; font-size: 15px;"><input
										type="hidden" id="game_Name" name="game_Name"
										value="${li.game_Name}" />${li.game_Name}</td>

									<td class="text-center d-none d-md-table-cell"
										style="width: 5%;">${li.game_TotalCount}</td>

									<td class="text-center d-none d-md-table-cell"
										style="width: 5%;"><input type="hidden" id="game_count"
										name="game_count" value="${li.game_Count}" />${li.game_Count}</td>

									<td class="text-center d-none d-md-table-cell"
										style="width: 10%;">${li.game_PlayerNum}</td>


										
							<td class="text-center d-none d-md-table-cell">
							
				  <a class="name_a custom-link" href="${li.game_info}" 
				  style="height: 20px; width: 20%;" target="_blank" style="height: 20px; width: 20%;" >
				    <c:out value="설명" />
				  </a>
				</td>				
										
									<td colspan="6">
										<button type="submit" class="btn btn-default" style="width: 50px; height: 30px; font-size: 12px;" onclick="showAlert()">예약</button>
								</tr>
							</form>
						</c:forEach>
					</tbody>
				</table>


				<!-- 검색창  -->
				<div style="text-align: center">
					<form class="form-inline"
						action="${contextPath}/inner/desk/boardGameSearch"
						method="get">
						<div class="form-group">
							<select name="bgstype" class="form-control">
								<option value="game_Name"
									${pageCre.cri.bgstype=='game_Name' ? 'selected': '' }>게임이름</option>
								<option value="game_PlayerNum"
									${pageCre.cri.bgstype=='game_PlayerNum' ? 'selected': '' }>게임인원수</option>
							</select>
						</div>
						<div class="form-group">
							<input type="text" value="${pageCre.cri.bgskeyword }"
								name="bgskeyword" class="form-control" id="bgskeyword">
						</div>
						<button type="submit" class="btn btn-default">검색</button>
					</form>
				</div>
				
				
				
	
	
				<!-- 페이지 시작 -->
				<div style="text-align: center">
					<ul class="pagination pagination-lg">
						<!-- 이전버튼 처리 -->
						<c:if test="${pageCre.prev }">
							<li class="paginate_button previous"><a
								href="${pageCre.startPage-1}">이전</a></li>
						</c:if>
						<!-- 페이지번호 처리 -->

						<c:forEach var="pageNum" begin="${pageCre.startPage }"
							end="${pageCre.endPage }">
							<c:if test="${pageCre.cri.page!=pageNum }">
								<c:if test="${empty pageCre.cri.gskeyword}">
									<li><a
										href="${contextPath }/inner/desk/boardGameSearch?page=${pageNum}">${pageNum}</a></li>
								</c:if>
								<c:if test="${not empty pageCre.cri.gskeyword}">
									<li><a
										href="${contextPath }/inner/desk/boardGameSearch?page=${pageNum}&keyword=${pageCre.cri.bgskeyword}&type=${pageCre.cri.bgstype}">${pageNum}</a></li>
								</c:if>
							</c:if>
							<c:if test="${pageCre.cri.page==pageNum }">
								<li
									class="paginate_button ${pageCre.cri.page==pageNum ? 'active' : ''} page-item"><a
									href="${contextPath }/inner/desk/boardGameSearch?page=${pageNum}&keyword=${pageCre.cri.bgskeyword}&type=${pageCre.cri.bgstype}">${pageNum}</a></li>
							</c:if>

						</c:forEach>

						<!-- 다음버튼 처리 -->
						<c:if test="${pageCre.next }">
							<li class="paginate_button next"><a
								href="${pageCre.endPage+1}">다음</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 마지막 -->
				<form id="pageFrm"
					action="${contextPath}/inner/desk/boardGameSearch"
					method="get">
					<!-- 게시물 번호  -->
					<input type="hidden" id="page" name="page"
						value="${pageCre.cri.page }" /> <input type="hidden"
						name="perPageNum" value="${pageCre.cri.perPageNum }" /> <input
						type="hidden" name="bgstype" value="${pageCre.cri.bgstype }" /> <input
						type="hidden" name="bgskeyword" value="${pageCre.cri.bgskeyword }" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>