<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
<title>King Of The Hill</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
	#body {
		background-color: #F0ECE5;
	}
	#head{
		margin: 20px;
		display: inline-block;
	}

	.container{
		margin-top: 65px;
	}
	
	#table{
		text-align: center;
	}
	
	thead>tr>th{
		text-align: center;
	}

	.searchForm{
		float: right;
	}
	
	#friendSearch_btn{
		padding: 3px 10px;
	}
	
	#needFriendWrite{
		float: right;
	}
	
	#table tbody tr td{
		height: 50px;
		vertical-align: middle;
		font-size: 15px;
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
});

$(document).ready(function(){
	var pageFrm=$("#pageFrm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		pageFrm.find("#page").val(page);
		pageFrm.submit();
	});
	
	$('#friendSearch_btn').click(function(e){
		var friendSearchKey=$('#friendSearchKey').val();
		if(friendSearchKey.trim()==("")){
			alert("검색할 내용을 입력하세요.");
			e.preventDefault();
		}
	});
});


</script>

  
</head>
<body data-target=".navbar" id="body">
<jsp:include page="../common/outer_header.jsp" />
<div class="container">
	<h2>친구 찾기</h2>
	<form action="${contextPath }/outer/outerFriend" method="get">
	<div class="searchForm">
		<select name="friendSearchType">
			<option value="nf_Title"
			${pageCre.cri.friendSearchType=='nf_Title' ? 'selected' : ''}>제목</option>
			<option value="player_ID"
			${pageCre.cri.friendSearchType=='player_ID' ? 'selected' : ''}>작성자</option>
		</select>
		<input type="text" id="friendSearchKey" name="friendSearchKey" value="${pageCre.cri.friendSearchKey }">
		<button id="friendSearch_btn" type="submit" class="btn btn-default">검색</button>
	</div>
	</form>
	<table class="table table-hover" id="table">
		<thead>
			<tr id="tr_th">
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:if test="${empty readBoard}">
				<tr>
				<td colspan="5">등록된 게시글이 없습니다</td>
				</tr>
				</c:if>
				
				<c:forEach var="li" items="${readBoard}">
				
				<c:if test="${!empty readBoard}">
				
				<tr>
				<td>${li.nf_idx }</td>
				<td><a href="selectRequest?idx=${li.nf_idx}&PageKey=NeedFriend">${li.nf_Title }</a></td>
				<td>${li.player_ID }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${li.nf_Indate }"/></td>
				<td>${li.nf_ViewCount }</td>
			</tr>
			
				</c:if>
				
				</c:forEach>
			</tr>
		</tbody>
		<c:if test="${!empty login_Player.player_ID }">
			<tfoot>
			<tr><td colspan="5" style="text-align: right;"><a type="button" class="btn btn-primary" href="outerWriteForm?PageKey=NeedFriend"><span class="glyphicon glyphicon-pencil"></span>글쓰기</a></td></tr>
			</tfoot>
		</c:if>
	</table>
	
	<!-- 페이징 START -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
		
		<!-- 이전 처리 -->
		<c:if test="${pageCre.prev }">
			<li class="paginate_button previous page-item">
				<a class="page-link" href="${pageCre.startPage-1 }">이전</a>
			</li>
		</c:if>
		
		<!-- 페이지 번호 처리 -->
		 <c:forEach var="pageNum" begin="${pageCre.startPage}" end="${pageCre.endPage}">
			<li id="active" class="paginate_button ${pageCre.cri.page==pageNum ? 'active' : ''} page-item">
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
		</div>
		<!-- END -->
		<form id="pageFrm" action="${contextPath}/outer/outerFriend" method="post">
			<!-- 게시물 번호(idx)추가 -->
			<input type="hidden" id="page" name="page" value="${pageCre.cri.page}" />
			<input type="hidden" name="perPageNum" value="${pageCre.cri.perPageNum}" />
			<input type="hidden" name="friendSearchType" value="${pageCre.cri.friendSearchType }"/>
			<input type="hidden" name="friendSearchKey" value="${pageCre.cri.friendSearchKey }"/>
		</form>
	</div>
</body>
</html>