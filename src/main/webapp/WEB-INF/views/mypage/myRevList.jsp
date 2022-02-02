<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<div class="mypage__content">
	<ul class="content__menu">
		<li class="content__item"><a href="/mypage/myrevlist" class="active">STAY</a></li>
		<li class="content__item"><a href="/mypage/myrevlist">ACTIVITY</a></li>
	</ul>
	<c:if test="${empty myRevList }">
			<div class="mb-3 text-center alert alert-info">현재 예약하신 STAY가 없습니다.<br/> STAY를 예약하시고, HOGE와 함께 여행을 떠나세요!!! :)</div>
	</c:if>
	<div class="container">
		<c:forEach var="myRevInfo" items="${myRevList }" >
		<div class="row my-5 justify-content-center">
			<div class="col-6 border-start border-top border-bottom bg-light">
				<div class="row">
					<div class="row ms-1 fs-2 fw-bold">
						<a href="#">${myRevInfo.accommoName }</a>
					</div>
					<div class="row ms-1 mb-3">
						<a href="#">${myRevInfo.roomName }</a>
					</div>
					<div class="row ms-1">
						${myRevInfo.accommoRegionDepth1 }/${myRevInfo.accommoRegionDepth2 }
					</div>					
					<div class="row ms-1">CHECK IN ::
						<fmt:formatDate value="${myRevInfo.checkInDate }" type="both" pattern="yyyy-MM-dd '/ PM' HH:mm" />
					</div>					
					<div class="row ms-1">CHECK OUT ::
						<fmt:formatDate value="${myRevInfo.checkOutDate }" type="both" pattern="yyyy-MM-dd '/ AM' HH:mm" />
					</div>					
					<div class="row ms-1">PAY INFO ::
						<fmt:formatNumber value="${myRevInfo.roomTaxIncludedPrice }" type="currency" currencySymbol="￦" />
					</div>					
					
					<div class="row-2 d-flex">
						<button type="button" class="btn btn-dark me-3">예약변경</button>
						<button type="button" class="btn btn-dark">예약취소</button>
					</div>
				</div>
			</div>
			<div class="col-4 me-0 border-top border-bottom border-end bg-light">
				<div id="carouselExampleIndicators${myRevInfo.roomNo }" class="carousel slide"
					data-bs-ride="carousel">
					<div class="carousel-indicators">
						<button type="button" data-bs-target="#carouselExampleIndicators${myRevInfo.roomNo }"
							data-bs-slide-to="0" class="active" aria-current="true"
							aria-label="Slide 1"></button>
						<button type="button" data-bs-target="#ccarouselExampleIndicators${myRevInfo.roomNo }"
							data-bs-slide-to="1" aria-label="Slide 2"></button>
						<button type="button" data-bs-target="#carouselExampleIndicators${myRevInfo.roomNo }"
							data-bs-slide-to="2" aria-label="Slide 3"></button>
					</div>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img src="../../resources/images/accommoList/200/accommo_200_1.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="../../resources/images/accommoList/200/accommo_200_2.jpg" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="../../resources/images/accommoList/200/accommo_200_3.jpg" class="d-block w-100" alt="...">
						</div>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators${myRevInfo.roomNo }" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators${myRevInfo.roomNo }" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>


<!-- <div class="content">
	<ul>
		
		<li></li>
	</ul>
</div> -->