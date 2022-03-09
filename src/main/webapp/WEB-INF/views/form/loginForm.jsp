<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<script src="/resources/js/kakaoLogin.js"></script>
<main id="main">
	<div class="login-wrap">
		<header class="section__header">
			<h1 class="section__title">LOGIN</h1>
			<p class="section__text">로그인</p>
		</header>
		<article id="login">
			<c:if test="${not empty error }">
				<div class="mb-3 alert alert-danger">${error }</div>
			</c:if>
			<form action="login" class="login-form" method="post">
				<div class="form__wrap">
					<div class="login__box">
						<input type="text" id="userId" name="id" placeholder="아이디" />
					</div>
					<div class="login__box">
						<input type="password" id="userPwd" name="pwd" placeholder="비밀번호" />
					</div>
				</div>
				<div class="login__btn">
					<button type="submit" class="btn__login">LOGIN</button>
				</div>
				<div class="login__etc">
					<a href="/register" class="sign-in">회원가입</a>
					<a href="/findid" class="forgot-id">아이디 찾기</a>
					<a href="/findpwd" class="forgot-pwd">패스워드 찾기</a>
				</div>
			</form>
			<div class="login__sns">
				<p class="sns__title">SNS 계정으로 로그인하기</p>
				<div class="sns__login">
					<a href="kakao/login" id="btn-kakao-login"> 
						<img src="../../resources/images/main/login_icon_kakao.png" alt="kakao-icon" class="sns__icon" />
					</a>
				</div>
			</div>
		</article>
	</div>
</main>
<!--  카카오 폼 -->
<form id="form-kakao-login" method="post" action="loginKakao">
	<input type="hidden" name="id" />
	<input type="hidden" name="name" />
	<input type="hidden" name="email" />
	<input type="hidden" name="gender" />
</form>