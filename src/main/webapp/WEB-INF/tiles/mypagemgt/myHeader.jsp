<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<header class="section__header">
	<h1 class="section__title">MY PAGE</h1>
	<p class="section__text">마이페이지</p>
</header>

<div class="mypage__info">
	<p class="info__title"><c:out value="${LOGIN_USER.name}"/>님 반가워요!</p>
	<p class="info__count">호게와 함께 0번의 여행을 했어요.</p>
</div>

<div class="host">
	<a href="/host/applyForm" class="host__registration"> <img
		src="../../resources/images/main/login_icon.png" alt=""
		class="host__icon" /> 호스트 등록
	</a>
	<a href="/mypage/hostingList" class="host__registration"> 호스트 전환
	</a>
	<!--  
  호스트 등록 후
  <a href="/host/main" class="host__change">
    <img src="../../resources/images/main/login_icon.png" alt="" class="host__icon" />
    호스트 페이지
  </a>
  -->
</div>
