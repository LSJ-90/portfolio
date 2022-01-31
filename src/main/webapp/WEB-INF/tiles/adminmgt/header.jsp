<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<header id="header">
  <div class="admin-header-wrap">
    <div class="header__logo">
      <a href="#"><img src="../../resources/images/main/logo.png" alt="logo" class="logo" /></a>
    </div>
    <nav id="nav">
      <ul class="nav__menu">
        <li class="admin_nav__item">admin</li>
      </ul>
    </nav>
    <nav id="nav">
      <ul class="nav__menu">
        <!-- 이승준
        		로그아웃을 위한 a tag추가  
        		admin계정이 없어 우선 hong을 관리자라 생각하고 LoginController에 기능을 구현하였습니다.
        		hong으로 로그인하시고 확인 후 수정하시면됩니다.
        -->
        <li class="admin_nav__item"><a href="/logout">LOGOUT</a></li>
      </ul>
    </nav>
  </div>
	<nav id="nav">
			<ul class="nav__menu">
				<li class="nav__item"><a href="/admin/main" class="active">관리자페이지 메인</a></li>
				<li class="nav__item"><a href="/admin/withdrawal">송금신청내역</a></li>
				<li class="nav__item"><a href="/admin/sales">매출내역</a></li>
				<li class="nav__item"><a href="/admin/statistics">통계</a></li>
				
			</ul>
			<ul class="nav__menu">
				<li class="nav__item">회원관리</a></li>
				<li class="nav__item"><a href="/admin/user-list">회원리스트</a></li>
				<li class="nav__item"><a href="/admin/host-qna">호스트문의</a></li>
				<li class="nav__item"><a href="/admin/user-qna">회원문의</a></li>
				<li class="nav__item"><a href="/admin/review">리뷰관리</a></li>
			</ul>
			<ul class="nav__menu">
				<li class="nav__item">숙소관리</a></li>
				<li class="nav__item"><a href="/admin/host-accommo-list">숙소리스트</a></li>
				<li class="nav__item"><a href="">숙소 승인 대기</a></li>
				<li class="nav__item"><a href="">숙소 승인 반려/종료</a></li>
			</ul>
			<ul class="nav__menu">
				<li class="nav__item">체험관리</a></li>
				<li class="nav__item"><a href="/admin/host-activity-list">체험리스트</a></li>
				<li class="nav__item"><a href="">체험 승인 대기</a></li>
				<li class="nav__item"><a href="">체험 승인 반려/종료</a></li>
			</ul>
			<ul class="nav__menu">
				<li class="nav__item">프로모션관리</a></li>
				<li class="nav__item"><a href="/admin/promotion-list">프로모션리스트</a></li>
				<li class="nav__item"><a href="">프로모션 승인 대기</a></li>
				<li class="nav__item"><a href="">프로모션 승인 반려/종료</a></li>
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
</header>