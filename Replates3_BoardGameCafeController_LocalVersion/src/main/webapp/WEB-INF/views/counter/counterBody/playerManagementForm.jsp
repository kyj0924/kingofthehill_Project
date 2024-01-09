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

	#player_Management{
		background-color: ivory;
	}
	
	.container h2{
		float: left;
		margin-top: 50px;
		color: #F5BC00;
	}
	
	#playersTable{
		text-align: left;
	}
	
	#playersTable th, #playersTable tr, #playersTable td{
		color: #F5BC00;
	}
	
	#pName{
		color: lightblue;
	}
	
	.searchForm{
		margin-top: 100px;
		float: right;
	}
	
	#search_btn{
		padding: 3px 10px;
	}
	
</style>	

<script type="text/javascript">
	$(document).ready(function(){
		var pageFrm=$("#pageFrm");
		$(".paginate_button a").on("click",function(e){
			e.preventDefault();
			var page=$(this).attr("href");
			pageFrm.find("#page").val(page);
			pageFrm.submit();
		});
		
		$('#search_btn').click(function(e){
			var searchKey=$('#searchKey').val();
			if(searchKey.trim()==("")){
				alert("검색할 내용을 입력하세요.");
				e.preventDefault();
			}
		});
		
    	var warning = "${warning}";
        if(warning && warning.trim() != ""){
            $('#myModal').modal('show');
        }
		
	});
</script>

</head>
<body>
<jsp:include page="../../always/owner_header.jsp" />
	<div class="container">
	<h2>회원 목록</h2>
	<form action="${contextPath }/playerForm" method="get">
	<div class="searchForm">
		<select name="searchType">
			<option value="name"
			${pageCre.cri.searchType=='name' ? 'selected' : ''}>이름</option>
			<option value="id"
			${pageCre.cri.searchType=='id' ? 'selected' : ''}>아이디</option>
		</select>
		<input type="text" id="searchKey" name="searchKey" value="${pageCre.cri.searchKey }">
		<button id="search_btn" type="submit" class="btn btn-default">검색</button>

	</div>
	</form>
	
	<!-- 데이터가 없는 경우 -->
	<c:choose>
		<c:when test="${empty li}">
			<table class="table" id="playersTable">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="5" style="text-align: center"><h3>등록된 내용이 없습니다.</h3></td>
				</tr>
			</tbody>
			</table>
		</c:when>
		
		<c:otherwise> <!-- 데이터가 있는 경우 -->
		<table class="table" id="playersTable">
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${li }" var="li">
					<tr>
						<td>${li.player_idx }</td>
						<td>
							<a id="pName" href="${contextPath }/selectPlayer?player_idx=${li.player_idx}">${li.player_ID }</a>
						</td>
						<td>${li.player_Name }</td>
						<td>${li.player_Tel }</td>
						<td>${li.player_Email }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<!-- 페이징 START -->
		<ul class="pagination justify-content-center">
		
		<!-- 이전 처리 -->
		<c:if test="${pageCre.prev }">
			<li class="paginate_button previous page-item">
				<a class="page-link" href="${pageCre.startPage-1 }">이전</a>
			</li>
		</c:if>
		
		<!-- 페이지 번호 처리 -->
		 <c:forEach var="pageNum" begin="${pageCre.startPage}" end="${pageCre.endPage}">
			<li class="paginate_button ${pageCre.cri.page==pageNum ? 'active' : ''} page-item">
				<a class="page-link" href="${pageNum }">${pageNum }</a>
			</li>
		</c:forEach>
		
		<!-- 다음 처리 -->
		<c:if test="${pageCre.next }">
			<li class="paginate_button next page-item">
				<a class="page-link" href="${pageCre.endPage+1 }">다음</a>
			</li>
		</c:if>
		</ul>
		
		<!-- END -->
		<form id="pageFrm" action="${contextPath}/playerForm" method="post">
			<!-- 게시물 번호(idx)추가 -->
			<input type="hidden" id="page" name="page" value="${pageCre.cri.page}" />
			<input type="hidden" name="perPageNum" value="${pageCre.cri.perPageNum}" />
			<input type="hidden" name="searchType" value="${pageCre.cri.searchType }"/>
			<input type="hidden" name="searchKey" value="${pageCre.cri.searchKey }"/>
        </form>
		</c:otherwise>
    </c:choose>
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

</body>
</html>