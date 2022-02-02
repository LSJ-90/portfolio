<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
 <header id="header">
  <div class="header-wrap">
    <div class="header__logo">
      <a href="#"
        ><img src="../../resources/images/main/logo.png" alt="logo" class="logo"
      /></a>
    </div>
    <div class="search-admin">ADMIN</div>
    <nav id="nav">
      <ul class="nav__menu">
      <!-- 이승준
        		admin계정이 없어 우선 hong을 관리자라 생각하고 LoginController에 기능을 구현하였습니다.
        		hong으로 로그인하시고 확인 후 수정하시면됩니다.
        -->
        <li class="nav__item"><a href="/logout">LOGOUT</a></li>
        <li class="nav__item">
        <!-- 정수민
        		메뉴 드롭박스 : 마이페이지/호스트페이지 이동 -> 미구현		
         -->
          <a href="#">
            <img
              src="../../resources/images/main/login_icon.png"
              alt="pagechange-icon"
              class="pagechange-icon"
            />
          </a>
        </li>
      </ul>
    </nav>
  </div>
  <div class="sub-nav">
    <ul class="sub-nav__tab">
      <li class="sub-nav__item-main">
        <i class="fas fa-cog"></i><a href="/admin/main">MAIN</a>
      </li>
      <li class="sub-nav__item active" data-tabNum="0">
        <a href="" class="tab__btn active">회원관리</a>
      </li>
      <li class="sub-nav__item" data-tabNum="1">
        <a href="" class="tab__btn">숙소관리</a>
      </li>
      <li class="sub-nav__item" data-tabNum="2">
        <a href="" class="tab__btn">체험관리</a>
      </li>
      <li class="sub-nav__item" data-tabNum="3">
        <a href="" class="tab__btn">프로모션관리</a>
      </li>
      <li class="sub-nav__item" data-tabNum="4">
        <a href="" class="tab__btn">매출관리</a>
      </li>
    </ul>
    <!--  -->
    <ul class="sub-nav__content">
      <li class="tab__content">
        <ul class="tab__menu">
          <li class="tab__item">
            <a href="/admin/user-list" class="active">회원리스트</a>
          </li>
          <li class="tab__item"><a href="/admin/host-qna">호스트문의</a></li>
          <li class="tab__item"><a href="/admin/user-qna">회원문의</a></li>
          <li class="tab__item"><a href="/admin/review">리뷰관리</a></li>
        </ul>
      </li>
      <li class="tab__content">
        <ul class="tab__menu">
          <li class="tab__item"><a href="/admin/host-accommo-list">숙소리스트</a></li>
          <li class="tab__item"><a href="/admin/host-qna">숙소승인 대기</a></li>
          <li class="tab__item"><a href="/admin/host-qna">숙소승인 반려/종료</a></li>
        </ul>
      </li>
      <li class="tab__content">
        <ul class="tab__menu">
          <li class="tab__item"><a href="/admin/host-activity-list">체험리스트</a></li>
          <li class="tab__item"><a href="#none">체험승인 대기</a></li>
          <li class="tab__item"><a href="#none">체험승인 반려/종료</a></li>
        </ul>
      </li>
      <li class="tab__content">
        <ul class="tab__menu">
          <li class="tab__item"><a href="/admin/promotion-list">프로모션리스트</a></li>
          <li class="tab__item"><a href="#none">프로모션승인 대기</a></li>
          <li class="tab__item">
            <a href="#none">프로모션승인 반려/종료</a>
          </li>
        </ul>
      </li>
      <li class="tab__content">
        <ul class="tab__menu">
          <li class="tab__item"><a href="/admin/withdrawal">송금 신청내역</a></li>
          <li class="tab__item"><a href="/admin/sales">매출내역</a></li>
        </ul>
      </li>
    </ul>
  </div>
  
</header>