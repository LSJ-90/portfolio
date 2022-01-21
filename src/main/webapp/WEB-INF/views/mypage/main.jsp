<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<div class="container">
	<div class="border-bottom row mb-3">
		<div class="col text-center">
			<h3>M Y P A G E</h3>
			<h5>마이페이지</h5>
			<c:if test="${'N' eq LOGIN_USER.isHost}">
				호스트가 되고싶으시다구요?<a href="/host/applyForm">당장 등록하세요!</a>
			</c:if>
			<c:if test="${'Y' eq LOGIN_USER.isHost}">
				<a href="/host/main">호스트페이지 전환</a>
			</c:if>
		</div>
	</div>
	<div class="border-bottom row mb-3">
		<div class="col text-center">
			<p>${LOGIN_USER.name}님 반가워요.</p>
			<p>HOGE와 함께 0번의 여행을 했어요.</p>
			<a href="#">회원정보수정</a>
		</div>
	</div>
</div>
