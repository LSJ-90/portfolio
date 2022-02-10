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
	<c:if test="${empty myTourList }">
			<div class="mb-3 text-center alert alert-info">다녀오신 STAY가 없습니다.<br/> STAY를 예약하시고, HOGE와 함께 여행을 떠나세요!!! :)</div>
	</c:if>
	<div class="container">
		<c:forEach var="myTourInfo" items="${myTourList }" >
		<div class="row my-5 justify-content-center">
			<div class="col-6 border-start border-top border-bottom bg-light">
				<div class="row">
					<div class="row ms-1 fs-2 fw-bold">
						<a href="#">${myTourInfo.accommoName }</a>
					</div>
					<div class="row ms-1 mb-3">
						<a href="#">${myTourInfo.roomName }</a>
					</div>
					<div class="row ms-1">
						${myTourInfo.accommoRegionDepth1 }/${myTourInfo.accommoRegionDepth2 }
					</div>					
					<div class="row ms-1">CHECK IN ::
						<fmt:formatDate value="${myTourInfo.checkInDate }" type="both" pattern="yyyy-MM-dd '/ PM' HH:mm" />
					</div>					
					<div class="row ms-1">CHECK OUT ::
						<fmt:formatDate value="${myTourInfo.checkOutDate }" type="both" pattern="yyyy-MM-dd '/ AM' HH:mm" />
					</div>					
					<div class="row ms-1">PAY INFO ::
						<fmt:formatNumber value="${myTourInfo.roomTaxIncludedPrice }" type="currency" currencySymbol="￦" />
					</div>					
					
					<div class="row-2 d-flex">
						<button type="button" class="btn btn-dark">리뷰작성</button>
					</div>
				</div>
			</div>
			<div class="col-4 me-0 border-top border-bottom border-end bg-light">
				<div id="carouselExampleIndicators${myTourInfo.accommoNo }" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-indicators">
						<c:forEach var="accommoImage" items="${myTourInfo.accommoImages }" varStatus="status">
							<button type="button" 
									data-bs-target="#carouselExampleIndicators${myTourInfo.accommoNo }"
									data-bs-slide-to="${status.index }" 
									class="<c:if test="${status.index eq 0 }">active</c:if>" 
									aria-current="true"
									aria-label="Slide ${status.count }">
							</button>
						</c:forEach>
					</div>
					<div class="carousel-inner">
						<c:forEach var="accommoImage" items="${myTourInfo.accommoImages }" varStatus="status">
							<div class="carousel-item<c:if test="${status.index eq 0 }"> active</c:if>">
								<img src="../../resources/images/accommoList/${accommoImage.image}" class="d-block w-100" alt="...">
							</div>
						</c:forEach>
					</div>
					<button class="carousel-control-prev" type="button"
						data-bs-target="#carouselExampleIndicators${myTourInfo.accommoNo }" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#carouselExampleIndicators${myTourInfo.accommoNo }" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>