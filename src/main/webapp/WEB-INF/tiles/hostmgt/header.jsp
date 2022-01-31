<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<header id="header">
	<div class="header-wrap">
		<div class="header__title">
			<a href="/host/main?hostNo=${param.hostNo}&hostingType=${param.hostingType }"><h1>${accMainDto.accName }</h1></a>
			<a href="/host/main?hostNo=${param.hostNo}&hostingType=${param.hostingType }"><h1>${actMaintDto.actName }</h1></a>
			<h1 class="title">${accMainDto.accType }</h1>
		</div>
		<nav id="nav">
			<ul class="nav__menu">
				<li class="nav__item"><a href="/host/modify?hostNo=${param.hostNo }&hostingType=${param.hostingType }" class="active">호스팅 수정</a></li>
				<li class="nav__item"><a href="">프로모션</a></li>
				<li class="nav__item"><a href="">리뷰관리</a></li>
				<li class="nav__item"><a href="">예약관리</a></li>
				<li class="nav__item"><a href="/host/sales?hostNo=${param.hostNo }&hostingType=${param.hostingType }">매출관리</a></li>
				<li class="nav__item"><a href="/host/chat?hostNo=${param.hostNo }&hostingType=${param.hostingType }">게스트문의</a></li>
				<li class="nav__item"><a href="/host/qna?hostNo=${param.hostNo }&hostingType=${param.hostingType }">관리자문의</a></li>
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