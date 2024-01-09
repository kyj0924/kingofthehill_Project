<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
  <title>King Of The Hill</title>
  <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
</head>
<style>
#body {
	background-color: #F0ECE5;
}

	.searchForm{
		float:right;
	}
	
	.container{
		margin-top:65px;
	}
	
	#notice_table tbody tr td{
		height: 50px;
		vertical-align: middle;
		font-size: 15px;
	}
	
	#noticeSearch_btn{
		padding: 3px 10px;
	}
	
</style>
<script>
$(document).ready(function(){
	window.open("${contextPath}/outer/outerNoticePopup", "popup", "toolbar=no, menubar=no, scrollbars=no, resizable=no, width=700, height=700, left=0, top=0");
});

$(document).ready(function(){
	var pageFrm=$("#pageFrm");
	$(".paginate_button a").on("click",function(e){
		e.preventDefault();
		var page=$(this).attr("href");
		pageFrm.find("#page").val(page);
		pageFrm.submit();
	});
});

</script>
<body data-target=".navbar" id="body">	
	<div class="OuterHeaderMenu_div">
		<jsp:include page="../common/outer_header.jsp" />
	</div>
	<div class="container">
  		<h2>공지사항</h2>
  		<form id="notice_form">
  			<input type="hidden" value="NoticePage" name="PageKey">
  			<div class="searchForm">
  				<select name="noticeSearchType">
  					<option value="notice_Title" ${pageCre.cri.noticeSearchType=='notice_title' ? 'selected' : ''}>제목</option>
  				</select>
  				<input type="text" id="noticeSearchKey" name="noticeSearchKey" value="${pageCre.cri.noticeSearchKey }">
  				<button id="noticeSearch_btn" type="button" class="btn btn-default">검색</button>
  			</div>        
	  		<table class="table table-hover" id="notice_table">
		    	<thead>
		      		<tr>
		        		<th>글 번호</th>
		        		<th>제목</th>
		        		<th>작성자</th>
		        		<th>작성일</th>
		        		<th>조회수</th>
		      		</tr>
		    	</thead>
		    	<tbody id="notice_tblBody">
		    		<c:if test="${notice_li.size()==0 }">
		    			<tr>
							<td colspan='5' style='text-align:center;'>등록된 게시글이 없습니다</td>
						</tr>
		    		</c:if>
		      		<c:forEach var="obj" items="${notice_li}">
		      			<tr>
							<td>${obj.notice_idx}</td>
							<td><a href='selectRequest?idx=${obj.notice_idx}&PageKey=NoticePage'>${obj.notice_Title}</a></td>
							<td>${obj.notice_Writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${obj.notice_Indate}"/></td>
							
							<td>${obj.notice_ViewCount}</td>
						</tr>		      			
		      		</c:forEach>
		    	</tbody>
		    	<c:if test="${login_Player.player_ID eq 'admin'}">
			    	<tfoot>
			    		<tr>
			    			<td colspan="5" style="text-align:right;"><button type="button" class="btn btn-primary" id="write_btn"><span class="glyphicon glyphicon-pencil"></span>글쓰기</button></td>
			    		</tr>
			    	</tfoot>
		    	</c:if>
	  		</table>
	  	</form>
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
		<form id="pageFrm" action="outerNotice" method="post">
			<!-- 게시물 번호(idx)추가 -->
			<input type="hidden" id="page" name="page" value="${pageCre.cri.page}" />
			<input type="hidden" name="perPageNum" value="${pageCre.cri.perPageNum}" />
			<input type="hidden" name="noticeSearchType" value="${pageCre.cri.noticeSearchType }"/>
			<input type="hidden" name="noticeSearchKey" value="${pageCre.cri.noticeSearchKey }"/>
		</form>
	  	
	  	
	</div>
	
	<script>
		$('#write_btn').click(function(){
			$('#notice_form').attr("action", "outerWriteForm");
			$('#notice_form').attr("method", "post");
			$('#notice_form').submit();
		})
		
		$('#noticeSearch_btn').click(function(){
			$('#notice_form').attr("action", "outerNotice");
			$('#notice_form').attr("method", "get");
			$('#notice_form').submit();
		})
	</script>
</body>
</html>