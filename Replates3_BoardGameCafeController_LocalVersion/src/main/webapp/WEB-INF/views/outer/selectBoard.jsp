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
	<form id="readForm">
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
			<td colspan="3">
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
			<td colspan="3">
			<c:if test="${PageKey eq 'Request'}">
				<input type="text" class="form-control" name="request_Title" readonly="readonly" value="<c:out value='${readBoard.request_Title}'/>"/>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<input type="text" class="form-control" name="notice_Title" readonly="readonly" value="<c:out value='${readBoard.notice_Title}'/>"/>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<input type="text" class="form-control" name="nf_Title" readonly="readonly" value="<c:out value='${readBoard.nf_Title}'/>"/>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3">
			<c:if test="${PageKey eq 'Request'}">
				<textarea rows="10" class="form-control" name="request_Content" readonly="readonly" style="resize:none;"><c:out value='${readBoard.request_Content}'/></textarea>
			</c:if>
			<c:if test="${PageKey eq 'NoticePage'}">
				<textarea rows="10" class="form-control" name="notice_Content" readonly="readonly" style="resize:none;"><c:out value='${readBoard.notice_Content}'/></textarea>
			</c:if>
			<c:if test="${PageKey eq 'NeedFriend'}">
				<textarea rows="10" class="form-control" name="nf_Content" readonly="readonly" style="resize:none;"><c:out value='${readBoard.nf_Content}'/></textarea>
			</c:if>
			</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td colspan="3">
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
			<td colspan="4">
		  	<c:if test="${login_Player.player_ID eq readBoard.request_Writer }">
		  		<button type="button" class="btn btn-warning" id="modify_btn">수정</button>
		  		<button type="button" class="btn btn-danger" id="request_delete_btn">삭제</button>
		  	</c:if>
		  		<button type="button" class="btn btn-info" id="request_btn">목록</button>
			</td>
		</tr>
		
		
		<c:forEach var="comment" items="${comment}">
		<tr>
		<td style="width: 80px;">${comment.comment_Writer}</td>
		<td><input type="text" class="form-control" readonly="readonly" value="${comment.comment_Content}"/></td>
		<c:if test="${login_Player.player_ID ne comment.comment_Writer }">
		<td colspan="2" style="width: 100px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.comment_Indate}"/></td>
		</c:if>
		<c:if test="${login_Player.player_ID eq comment.comment_Writer }">
		<td style="width: 100px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.comment_Indate}"/></td>
			<td style="width: 80px;">
			<input type="hidden" name="comment_idx" value="${comment.comment_idx}"/>
			<button type="button" class="btn btn-danger comment_Delete_btn" id="comment_Delete_btn">삭제</button>
			
			</td>
		</c:if>
		
		</tr>
		</c:forEach>
		<tr>
		<td style="width: 80px;">댓글</td><td><input type="text" class="form-control" name="comment_Content" id="comment_Content"/></td>
		<c:if test="${!empty login_Player.player_ID}">
		<td colspan="2" style="width: 30px;"><button type="button" class="btn btn-success" id="comment_btn">답글</button></td>
		</c:if>
		<c:if test="${empty login_Player.player_ID}">
		<td colspan="2" style="width: 30px;"><button type="button" class="btn btn-success" disabled id="comment_btn">답글</button></td>
		</c:if>
		<input type="hidden" name="comment_Writer" value="${login_Player.player_ID}"/>
		<input type="hidden" name="comment_Board_idx" value="${readBoard.request_idx}"/>
		<input type="hidden" name="request_Board" value="${readBoard}"/>
		</tr>
		
		</c:if>
		<c:if test="${PageKey eq 'NoticePage'}">
		<tr>
			<td colspan="2">
		  	<c:if test="${login_Player.player_ID eq readBoard.notice_Writer }">
		  		<button type="button" class="btn btn-warning" id="modify_btn">수정</button>
		  		<button type="button" class="btn btn-danger" id="delete_btn">삭제</button>
		  	</c:if>
		  		<button type="button" class="btn btn-info" id="list_btn">목록</button>
			</td>
		</tr>
		</c:if>
		
		<c:if test="${PageKey eq 'NeedFriend'}">
			<tr>
				<td colspan="4">
		  		<c:if test="${login_Player.player_ID eq readBoard.player_ID }">
		  			<button type="button" class="btn btn-warning" id="modify_btn">수정</button>
		  			<button type="button" class="btn btn-danger" id="nf_delete_btn">삭제</button>
		  		</c:if>
		  			<button type="button" class="btn btn-info" id="nf_btn">목록</button>
				</td>
			</tr>
			
		<c:forEach var="comment" items="${comment}">
		<tr>
			<td style="width: 80px;">${comment.nf_comment_Writer}</td>
			<td><input type="text" class="form-control" readonly="readonly" value="${comment.nf_comment_Content}"/></td>
		<c:if test="${login_Player.player_ID ne comment.nf_comment_Writer }">
			<td colspan="2" style="width: 100px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.nf_comment_Indate}"/></td>
		</c:if>
		<c:if test="${login_Player.player_ID eq comment.nf_comment_Writer }">
			<td style="width: 100px;"><fmt:formatDate pattern="yyyy-MM-dd" value="${comment.nf_comment_Indate}"/></td>
			<td style="width: 80px;">
			<input type="hidden" name="nf_comment_idx" value="${comment.nf_comment_idx}"/>
			<button type="button" class="btn btn-danger nf_comment_Delete_btn" id="nf_comment_Delete_btn">삭제</button>
			</td>
		</c:if>
		
		</tr>
		</c:forEach>
		<tr>
		<td style="width: 80px;">댓글</td><td><input type="text" class="form-control" name="nf_comment_Content" id="nf_comment_Content"/></td>
		<c:if test="${!empty login_Player.player_ID}">
		<td colspan="2" style="width: 30px;"><button type="button" class="btn btn-success" id="nf_comment_btn">답글</button></td>
		</c:if>
		<c:if test="${empty login_Player.player_ID}">
		<td colspan="2" style="width: 30px;"><button type="button" class="btn btn-success" disabled id="nf_comment_btn">답글</button></td>
		</c:if>
		<input type="hidden" name="nf_comment_Writer" value="${login_Player.player_ID}"/>
		<input type="hidden" name="nf_comment_Board_idx" value="${readBoard.nf_idx}"/>
		<input type="hidden" name="needFriend_Board" value="${readBoard}"/>
		</tr>
		
		</c:if>
	</table>
	</form>
	</div>
</div>

<script>
		$('#modify_btn').click(function(){
			// 수정 폼으로 보낸다.
			$('#readForm').attr("action", "modifyForm");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		$('#delete_btn').click(function(){
			// 삭제 처리 폼으로 보낸다.
			$('#readForm').attr("action", "noticeDeletePro");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		$('#list_btn').click(function(){
			$('#readForm').attr("action", "outerNotice");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		$('#request_btn').click(function(){
			$('#readForm').attr("action", "outerRequest");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		
		$('#comment_btn').click(function(){
			if($('#comment_Content').val()==""){
			alert("내용을 작성하세요");
			}else{
				$('#readForm').attr("action", "commentWrite");
				$('#readForm').attr("method", "post");
				$('#readForm').submit();
			}
		})
		
		$('#nf_comment_btn').click(function(){
			if($('#comment_Content').val()==""){
			alert("내용을 작성하세요");
			}else{
				$('#readForm').attr("action", "nf_commentWrite");
				$('#readForm').attr("method", "post");
				$('#readForm').submit();
			}
		})

		
		$('.nf_comment_Delete_btn').click(function(){
		    // 삭제할 댓글의 식별자 변수 (예: nf_comment_idx)를 가정합니다.
		    var nfCommentIdx = $(this).closest('tr').find('input[name=nf_comment_idx]').val();

		    // 양식에 댓글 식별자를 설정합니다.
		    if (nfCommentIdx) {
		        // 댓글 식별자가 유효한 경우에만 삭제 처리를 수행합니다.
		        $('#readForm input[name=nf_comment_idx]').val(nfCommentIdx);

		        // 양식을 서버로 전송합니다.
		        $('#readForm').attr("action", "nf_deleteComment");
		        $('#readForm').attr("method", "post");
		        $('#readForm').submit();
		    } else {
		        // 댓글 식별자가 없을 경우에 대한 처리를 추가할 수 있습니다.
		        console.error("nf_comment 식별자가 유효하지 않습니다.");
		    }
		});
		

		
		$('.comment_Delete_btn').click(function(){
		    // 삭제할 댓글의 식별자 변수 (예: comment_idx)를 가정합니다.
		    var commentIdx = $(this).closest('tr').find('input[name=comment_idx]').val();

		    // 양식에 댓글 식별자를 설정합니다.
		    if (commentIdx) {
		        // 댓글 식별자가 유효한 경우에만 삭제 처리를 수행합니다.
		        $('#readForm input[name=comment_idx]').val(commentIdx);

		        // 양식을 서버로 전송합니다.
		        $('#readForm').attr("action", "deleteComment");
		        $('#readForm').attr("method", "post");
		        $('#readForm').submit();
		    } else {
		        // 댓글 식별자가 없을 경우에 대한 처리를 추가할 수 있습니다.
		        console.error("댓글 식별자가 유효하지 않습니다.");
		    }
		});
		
		
		
		$('#request_delete_btn').click(function(){
			$('#readForm').attr("action", "request_delete");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		
		$('#nf_delete_btn').click(function(){
			$('#readForm').attr("action", "nf_delete");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		$('#nf_btn').click(function(){
			$('#readForm').attr("action", "outerFriend");
			$('#readForm').attr("method", "post");
			$('#readForm').submit();
		})
		
		
		
	</script>
</body>
</html>