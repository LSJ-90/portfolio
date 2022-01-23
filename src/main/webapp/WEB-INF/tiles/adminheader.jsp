<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
  <div class="admin-header-wrap">
    <div class="header__logo">
      <a href="#"><img src="../../resources/images/common/mainLogo.png" alt="logo" class="logo" /></a>
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
 <nav class="navbar navbar-expand-sm bg-dark navbar-dark mb-3">
	<div class="container">
    	<ul class="navbar-nav me-auto mb-2">
      		<li class="nav-item">
        		<a class="nav-link" style="color: yellow;" href="main">관리자페이지</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="user-list">회원관리</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">숙소관리</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">체험관리</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">프로모션관리</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">리뷰관리</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">호스트문의</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">회원문의</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">송금신청내역</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">매출내역</a>
      		</li>
      		<li class="nav-item">
        		<a class="nav-link" href="#">통계</a>
      		</li>
      	</ul>
  	</div>
</nav>
</header>