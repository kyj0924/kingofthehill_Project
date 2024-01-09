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
<form id="write">

<!-- 개인 작성 -->
<c:if test="${PageKey eq 'Request'}">

<div class="main">
		<div class="form-group">
             <label>제목</label>
             <input type="text" name="request_Title" class="form-control" id="request_Title">
         </div>
          
         <div class="form-group">
             <label>내용</label>
             <textarea rows="10" name="request_Content" class="form-control" id="request_Content" style="resize: none;"></textarea>
         </div>
          
         <div class="form-group">
             <label>작성자</label>
             <input type="text" readonly="readonly" name="request_Writer" class="form-control" value="${login_Player.player_ID}">
         </div>
<input type="hidden" value="Request" id="pageName">

</c:if>
<c:if test="${PageKey eq 'NoticePage'}">
<div class="main">
		<div class="form-group">
             <label>제목</label>
             <input type="text" name="notice_Title" class="form-control" id="notice_Title">
         </div>
          
         <div class="form-group">
             <label>내용</label>
             <textarea rows="10" name="notice_Content" class="form-control" id="notice_Content" style="resize: none;"></textarea>
         </div>
          
         <div class="form-group">
             <label>작성자</label>
             <input type="text" readonly="readonly" name="notice_Writer" class="form-control" value="${login_Player.player_ID}">
         </div>
<input type="hidden" value="notice" id="pageName">

</c:if>

<c:if test="${PageKey eq 'NeedFriend'}">
<div class="main">
	<div class="form-group">
		<label>제목</label>
		<input type="text" name="nf_Title" class="form-control" id="nf_Title">
	</div>
	
	<div class="form-group">
		<label>내용</label>
		<textarea rows="10" name="nf_Content" class="form-control" id="nf_Content" style="resize: none;"></textarea>
	</div>
	
	<div class="form-group">
		<label>작성자</label>
		<input type="text" readonly="readonly" name="player_ID" class="form-control" value="${login_Player.player_ID}">
	</div>
<input type="hidden" value="NeedFriend" id="pageName">

</c:if>

<c:if test="">

</c:if>
<button type="button" id="write_btn" class="btn btn-primary">작성 완료</button>
<button type="reset" class="btn btn-danger">재작성</button>
<button type="button" id="cancel_btn" class="btn btn-warning">작성 취소</button>
</form>
</div>
</div>


<script>
$('#write_btn').click(function(){
	console.log('${PageKey}');
	//var pageKey = ${PageKey};
	if($('#notice_Title').val()==""){
		alert("제목을 작성하세요");
	}else if($('#notice_Content').val()==""){
		alert("내용을 작성하세요");
	}else if($('#request_Title').val()==""){
		alert("제목을 작성하세요");
	}else if($('#request_Content').val()==""){
		alert("내용을 작성하세요");
	}else if($('#nf_Title').val()==""){
		alert("제목을 작성하세요");
	}else if($('#nf_Content').val()==""){
		alert("내용을 작성하세요");
	}
	else{
		if('${PageKey}' === 'Request'){
			$('#write').attr("action", "requestWrite");
			$('#write').attr("method", "post");
			$('#write').submit();
		}
		else if('${PageKey}' === 'NoticePage'){
			$('#write').attr("action", "noticeWrite");
			$('#write').attr("method", "post");
			$('#write').submit();
		}
		
		else if('${PageKey}' === 'NeedFriend'){
			$('#write').attr("action", "nfWrite");
			$('#write').attr("method", "post");
			$('#write').submit();
		}
		
		else{
			alert("error");
		}
	}
		
});

$('#cancel_btn').click(function(){
	if('${PageKey}' === 'Request'){
		$('#write').attr("action", "outerRequest");
		$('#write').attr("method", "post");
		$('#write').submit();
	}
	else if('${PageKey}' === 'NoticePage'){
		$('#write').attr("action", "outerNotice");
		$('#write').attr("method", "post");
		$('#write').submit();
	}
	
	else if('${PageKey}' === 'NeedFriend'){
		$('#write').attr("action", "outerFriend");
		$('#write').attr("method", "post");
		$('#write').submit();
	}
	
	else{
		alert("error");
	}
});

</script>

</body>
</html>