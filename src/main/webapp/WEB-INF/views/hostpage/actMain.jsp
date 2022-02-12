<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<meta charset="UTF-8">
<title>메인페이지-체험</title>
</head>
<body>
	<div class="text-center">
		<h1>체험</h1>
		<img src="/resources/images/hostMainImage/${actMainDto.mainImage}" width="800">
		<button class="btn btn-primary" onclick="location.href='/host/modify?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">호스트 수정</button>
		<button class="btn btn-primary" onclick="location.href='/mypage/hostingList'">호스팅 리스트</button>
		<button class="btn btn-outline-dark" onclick="location.href='/host/addActInfo?hostNo=${param.hostNo }&hostingType=${param.hostingType }'">호스트 소개 및 기타 안내 사항 등록</button>
	</div>
</body>
</html>