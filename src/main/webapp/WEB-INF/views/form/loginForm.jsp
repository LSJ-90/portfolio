<!-- 이승준: 부트스트랩을 이용한 데모뷰, 디자인 적용 시 삭제 될 것-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<div class="container ">
	<div class="row mb-3 ">
		<div class="col text-center">
			<h1>로그인</h1>
			<h3>Login</h3>
		</div>
	</div>
	<div class="row mb-3 d-flex justify-content-center">
		<div class="col-8">
			<c:if test="${not empty error }">
				<div class="mb-3 alert alert-danger">
					${error }
				</div>
			</c:if>
			<form class="border p-3 bg-light" method="post" action="login">
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="id" />
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="pwd" />
				</div>
				<div class="mb-3 text-end">
					<a href="#" class="btn btn-secondary">회원가입</a>
					<a href="#" class="btn btn-secondary">비밀번호찾기</a>
					<button class="btn btn-primary">로그인</button>
				</div>
			</form>
				<div class="mb-3 text-end">
					<button class="btn btn-primary">카카오톡 로그인</button>
				</div>
		</div>
	</div>
</div>