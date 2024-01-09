<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>King Of The Hill</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<style type="text/css">
body {
	background-color: #1D1D2A;
	color: #F5BC00;
}
</style>
<script>
const userCode = "imp14397622";
IMP.init(userCode);

function requestPay() {
  IMP.request_pay({
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid: "test_lq1zxrpk",
    name: "테스트 결제",
    amount: 100,
    buyer_tel: "010-0000-0000",
    m_redirect_url: "",
  });
}

requestPay();

</script>
<body>
<center>
<h1>결제 확인 페이지</h1>
<h3>
결제확인 페이지 입니다.
결제를 하고나서 "결제 완료"를 누르지 않으면 결제가 원활이 진행되지 않을 수 있습니다.
</h3>
<a class="btn btn-success" href="${contextPath}/roomClear?desk_idx=${desk_idx}">결제 완료</a>
<a class="btn btn-danger" href="${contextPath}/shopForm">결제 취소</a>
</center>
</body>
</head>
</html>