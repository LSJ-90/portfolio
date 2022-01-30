<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<header id="header">
	<div class="header-wrap">
		<div class="header__title">
			<h1 class="title">몬드리안 서울 이태원</h1>
			<p class="text">서울/용산구 · 호텔</p>
		</div>
		<nav id="nav">
			<ul class="nav__menu">
				<li class="nav__item"><a href="" class="active">호스팅 수정</a></li>
				<li class="nav__item"><a href="">프로모션</a></li>
				<li class="nav__item"><a href="">리뷰관리</a></li>
				<li class="nav__item"><a href="">예약관리</a></li>
				<li class="nav__item"><a href="/host/sales?hostNo=${hostNo }&hostType=${hostType }">매출관리</a></li>
				<li class="nav__item"><a href="/host/chat?hostNo=${hostNo }&hostType=${hostType }">게스트문의</a></li>
				<li class="nav__item"><a href="/host/qna?hostNo=${hostNo }&hostType=${hostType }">관리자문의</a></li>
			</ul>
			<div class="nav__dropdown">
				<button class="btn__dropdown">
					<img src="../../resources/images/main/login_icon.png" alt="" class="dropdown__image" />
					<!-- 
						Active
						<img
							src="img/main/login_icon_active.png"
							alt=""
							class="dropdown__image active"
						/>
					 -->
				</button>
				<ul class="dropdown__menu" style="display: none">
					<li class="dropdown__item"><a href="">마이페이지</a></li>
					<li class="dropdown__item"><a href="">호스팅 페이지</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>