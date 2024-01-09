<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>King Of The Hill</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
body{
text-align: center;
background-color: #F0ECE5;
}
.container{
		margin-top:60px;
	}
</style>

</head>
<body>
<div class="container">
<div class="main">
	<form id="modifyForm">
	<input type="hidden" value="${PageKey }" name="PageKey">
	<c:if test="${PageKey eq 'Request'}">
		<input type="hidden" value="${readBoard.request_idx }" name="idx">
	</c:if>
	<c:if test="${PageKey eq 'NoticePage'}">
		<input type="hidden" value="${readBoard.notice_idx }" name="idx">
	</c:if>
	<c:if test="${PageKey eq 'NeedFriend'}">
		<input type="hidden" value="${readBoard.nf_idx }" name="idx">
	</c:if>
	<table class="table table-bordered">
		<tr>
			<td>번호</td>
			<td>
			<c:if test="${PageKey eq 'Request'}">
				<input type="text" class="form-control" name="request_idx" readonly="readonly" value="${readBoard.request_idx}"/>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<input type="text" class="form-control" name="notice_idx" readonly="readonly" value="${readBoard.notice_idx}"/>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<input type="text" class="form-control" name="nf_idx" readonly="readonly" value="${readBoard.nf_idx}"/>
			</c:if>		
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
			<c:if test="${PageKey eq 'Request'}">
				<input type="text" class="form-control" name="request_Title" id="request_Title" value="<c:out value='${readBoard.request_Title}'/>"/>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<input type="text" class="form-control" name="notice_Title" id="notice_Title" value="<c:out value='${readBoard.notice_Title}'/>"/>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<input type="text" class="form-control" name="nf_Title" id="nf_Title" value="<c:out value='${readBoard.nf_Title}'/>"/>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<c:if test="${PageKey eq 'Request'}">
				<textarea rows="10" class="form-control" name="request_Content" id="request_Content" style="resize:none;"><c:out value='${readBoard.request_Content}'/></textarea>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<textarea rows="10" class="form-control" name="notice_Content" id="notice_Content" style="resize:none;"><c:out value='${readBoard.notice_Content}'/></textarea>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<textarea rows="10" class="form-control" name="nf_Content" id="nf_Content" style="resize:none;"><c:out value='${readBoard.nf_Content}'/></textarea>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
			<c:if test="${PageKey eq 'Request'}">
				<input type="text" class="form-control" name="request_Writer" readonly="readonly" value="${readBoard.request_Writer}"/>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<input type="text" class="form-control" name="notice_Writer" readonly="readonly" value="${readBoard.notice_Writer}"/>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<input type="text" class="form-control" name="player_ID" readonly="readonly" value="${readBoard.player_ID}"/>
			</c:if>
			</td>
		</tr>
		<c:if test="${PageKey eq 'Request'}">
		<tr>
			<td colspan="2">
		  	<c:if test="${login_Player.player_ID eq readBoard.request_Writer}">
		  		<button type="button" class="btn btn-primary" id="modify_btn">수정 완료</button>
				<button type="button" class="btn btn-warning" id="cancel_btn">취소</button>
		  	</c:if>
		  		<button type="button" class="btn btn-info" id="list_btn">목록</button>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${PageKey eq 'NoticePage'}">
		<tr>
			<td colspan="2">
		  	<c:if test="${login_Player.player_ID eq readBoard.notice_Writer}">
		  		<button type="button" class="btn btn-primary" id="modify_btn">수정 완료</button>
				<button type="button" class="btn btn-warning" id="cancel_btn">취소</button>
		  	</c:if>
		  		<button type="button" class="btn btn-info" id="list_btn">목록</button>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${PageKey eq 'NeedFriend'}">
		<tr>
			<td colspan="2">
		  	<c:if test="${login_Player.player_ID eq readBoard.player_ID}">
		  		<button type="button" class="btn btn-primary" id="modify_btn">수정 완료</button>
				<button type="button" class="btn btn-warning" id="cancel_btn">취소</button>
		  	</c:if>
		  		<button type="button" class="btn btn-info" id="list_btn">목록</button>
			</td>
		</tr>
		</c:if>
	</table>
	</form>
	</div>
</div>

<script>
$('#modify_btn').click(function(){
	console.log('${PageKey}');
	//var pageKey = ${PageKey};
	if($('#notice_Title').val()==""){
		alert("제목을 작성하세요");
	}
	else if($('#notice_Content').val()==""){
		alert("내용을 작성하세요");
	}
	else if($('#request_Title').val()==""){
		alert("제목을 작성하세요");
	}
	else if($('#request_Content').val()==""){
		alert("내용을 작성하세요");
	}
	else if($('#nf_Title').val()==""){
		alert("제목을 작성하세요");
	}
	else if($('#nf_Content').val()==""){
		alert("내용을 작성하세요");
	}
	else{
		if('${PageKey}' === 'Request'){
			$('#modifyForm').attr("action", "requestModify");
			$('#modifyForm').attr("method", "post");
			$('#modifyForm').submit();
		}
		else if('${PageKey}' === 'NoticePage'){
			$('#modifyForm').attr("action", "noticeModify");
			$('#modifyForm').attr("method", "post");
			$('#modifyForm').submit();
		}
		else if('${PageKey}' === 'NeedFriend'){
			$('#modifyForm').attr("action", "needFriendModify");
			$('#modifyForm').attr("method", "post");
			$('#modifyForm').submit();
		}
		else{
			alert("error");
			
		}
	}
});


$('#cancel_btn').click(function(){
	if('${PageKey}' === 'Request'){
		$('#modifyForm').attr("action", "selectRequest");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else if('${PageKey}' === 'NoticePage'){
		$('#modifyForm').attr("action", "selectRequest");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else if('${PageKey}' === 'NeedFriend'){
		$('#modifyForm').attr("action", "selectRequest");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else{
		alert("error");
		
	}
})

$('#list_btn').click(function(){
	if('${PageKey}' === 'Request'){
		$('#modifyForm').attr("action", "outerRequest");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else if('${PageKey}' === 'NoticePage'){
		$('#modifyForm').attr("action", "outerNotice");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else if('${PageKey}' === 'NeedFriend'){
		$('#modifyForm').attr("action", "outerFriend");
		$('#modifyForm').attr("method", "post");
		$('#modifyForm').submit();
	}
	else{
		alert("잘못된 접근입니다");
	}
})

</script>

</body>
</html>