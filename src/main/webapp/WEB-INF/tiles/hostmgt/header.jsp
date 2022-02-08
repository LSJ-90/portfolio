<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../views/common/tags.jsp" %>
<header id="host-header">
	<div class="host-header-wrap">
		<div class="header__title">
			<h1 class="host-title">
			<a href="/host/main?hostNo=${param.hostNo}&hostingType=${param.hostingType }">${accMainDto.accName }</a>
			</h1>
			<h1 class="host-text">${accMainDto.accType }</h1>
		</div>
		<nav id="host-nav">
			<ul class="host-nav__menu">
			<c:choose>
				<c:when test="${(param.hostingType) == 1 }">
					<li class="host-nav__item"><a href="/host/mainRoom?hostNo=${param.hostNo }&hostingType=${param.hostingType }" class="active">객실관리</a></li>
				</c:when>
			<c:otherwise>
					<li class="nav__item"><a href="/activity/mainTime?hostNo=${param.hostNo }&hostingType=${param.hostingType }" class="active">체험관리</a></li>
      <!-- 마스터 주석처리
					<li class="host-nav__item"><a href="/host/mainRoom?hostNo=${param.hostNo }&hostingType=${param.hostingType }" class="active">체험관리</a></li>
      -->
			</c:otherwise>
			</c:choose>
				<li class="nav__item"><a href="/host/mainPromotion?hostNo=${param.hostNo }&hostingType=${param.hostingType }">프로모션</a></li>
				<li class="nav__item"><a href="">리뷰관리</a></li>
				<li class="nav__item"><a href="">예약관리</a></li>
				<li class="nav__item"><a href="/host/sales?hostNo=${param.hostNo }&hostingType=${param.hostingType }">매출관리</a></li>
				<li class="nav__item"><a href="/host/chat?hostNo=${param.hostNo }&hostingType=${param.hostingType }">게스트문의</a></li>
				<li class="nav__item"><a href="/host/qna?page=1&hostNo=${param.hostNo }&hostingType=${param.hostingType }">관리자문의</a></li>

			</ul>
			<div class="host-nav__dropdown">
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
				<ul class="host-dropdown__menu" style="display: none">
					<li class="dropdown__item"><a href="">마이페이지</a></li>
					<li class="dropdown__item"><a href="">호스팅 페이지</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>