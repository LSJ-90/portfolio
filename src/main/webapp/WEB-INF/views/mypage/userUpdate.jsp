<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<div class="mypage__content">
	<header class="section__header">
		<h1 class="section__title">회원정보수정</h1>
	</header>
	
	<c:if test="${not empty error }">
		<div class="mb-3 alert alert-danger">${error }</div>
	</c:if>
	
	<article class="login">
		<form action="userUpdate" class="login-form" method="post">
			<div class="form__wrap">
				<!--  자리를 어디에 둬야 할까... -->
				<div class="">profile photo
					<input type="file" class="" id="" name="" title=""  accept="">
				</div>
				<!--  제목들은 왼쪽으로 정렬되어야할까... -->
				<div class="login__id">이름
					<input type="text" class="form__id" name="name" value="<c:out value="${LOGIN_USER.name}"/>" />
				</div>
				<div class="login__id">아이디
					<input type="text" class="form__id" name="id" value="<c:out value="${LOGIN_USER.id}"/>" />
				</div>
				<div class="login__pwd">비밀번호
					<input type="password" class="form__pwd" name="pwd" placeholder="비밀번호" />
				</div>
				<div class="login__pwd">
					<input type="password" class="form__pwd" name="changePwd" placeholder="변경할 비밀번호" />
				</div>
				<div class="login__pwd">
					<input type="password" class="form__pwd" name="confilmPwd" placeholder="변경할 비밀번호 확인" />
				</div>
				<div class="login__id">전화번호
					<input type="text" class="form__id" name="tel" value="<c:out value="${LOGIN_USER.tel}"/>" />
				</div>
				<div class="login__id">이메일
					<!-- type을 email로 줘야 할까...? -->
					<input type="text" class="form__id" name="email" value="<c:out value="${LOGIN_USER.email}"/>" />
				</div>
			</div>
			<div class="login__btn">
				<button type="submit" class="btn__login">저장</button>
			</div>
		</form>
			<!-- 버튼 디자인을 작게 할까..? 색을 다르게 입힐까? -->
		<a href="" class="login__btn">
			<button type="button" class="">회원탈퇴</button>
		</a>
	</article>
</div>
