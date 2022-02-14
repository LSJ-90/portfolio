<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../../../../resources/css/promotionList.css" />
<meta charset="UTF-8">
<title>프로모션 리스트</title>
</head>
<body>
<main id="main">
	<div class="row">
		<div class="col-12">
			<h3 class="text-center" style="margin-top:50px; margin-bottom:0px;">S T A Y&ensp;할인 프로모션</h3>
		</div>
		<div class="col-12">
			<hr class="text-center" style="margin-bottom:20px;" size="3px">
		</div>
	</div>
</main>
<main id="main">
	<article id="">
		<ul class="">
			<c:forEach var="accDiscountPromotions" items="${accDiscountPromotions }" >
				<li class="promotion-list__item">
					<a href="/accommo/detail?accNo=${accDiscountPromotions.accommoNo }">
					<div class="promotion-list__img" style='background-image: url("/resources/images/hostMainImage/${accDiscountPromotions.mainImage}")'>
						<span class="promotion-main__left">${accDiscountPromotions.deadlineDate }DAYS LEFT</span>
						<span>${accDiscountPromotions.accommoName }</span>
						<span class="promotion-main__depth">${accDiscountPromotions.accommoRegionDepth1 }/${accDiscountPromotions.accommoRegionDepth2 }</span>
					</div>
					<div class="promotion-list__description">
						<div class="promotion-list__name">< ${accDiscountPromotions.accommoName } ></div>
						<div class="promotion-list__title">${accDiscountPromotions.introContent }</div>
						<div class="promotion-list__rate">
							평일:<fmt:formatNumber value="${accDiscountPromotions.weekdaysDiscountRate}" type="percent"/>&emsp;
							주말:<fmt:formatNumber value="${accDiscountPromotions.peakSeasonDiscountRate}" type="percent"/>&emsp;
							성수기:<fmt:formatNumber value="${accDiscountPromotions.peakSeasonDiscountRate}" type="percent"/>
						</div>
						<div class="promotion-list__date">
							기간 : <fmt:formatDate value="${accDiscountPromotions.startingDate}" pattern="yyyy.MM.dd"/> ~
								  <fmt:formatDate value="${accDiscountPromotions.endingDate}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</article>
</main>
<main id="main">
	<div class="row">
		<div class="col-12">
			<hr class="text-center" style="margin-top:20px;" size="3px">
		</div>
		<div class="col-12">
			<h3 class="text-center" style="margin-top:50px; margin-bottom:0px;">S T A Y&ensp;증정 프로모션</h3>
		</div>
		<div class="col-12">
			<hr class="text-center" style="margin-bottom:20px;" size="3px">
		</div>
	</div>
</main>
<main id="main">
	<article id="">
		<ul class="">
			<c:forEach var="accOfferPromotions" items="${accOfferPromotions }" >
				<li class="promotion-list__item">
					<a href="/accommo/detail?accNo=${accOfferPromotions.accommoNo }">
					<div class="promotion-list__img" style='background-image: url("/resources/images/hostMainImage/${accOfferPromotions.mainImage}")'>
						<span class="promotion-main__left">${accOfferPromotions.deadlineDate }DAYS LEFT</span>
						<span>${accOfferPromotions.accommoName }</span>
						<span class="promotion-main__depth">${accOfferPromotions.accommoRegionDepth1 }/${accOfferPromotions.accommoRegionDepth2 }</span>
					</div>
					<div class="promotion-list__description">
						<div class="promotion-list__name">< ${accOfferPromotions.accommoName } ></div>
						<div class="promotion-list__title">${accOfferPromotions.introContent }</div>
						<div class="promotion-list__rate">${accOfferPromotions.offerContent }</div>
						<div class="promotion-list__date">
							기간 : <fmt:formatDate value="${accOfferPromotions.startingDate}" pattern="yyyy.MM.dd"/> ~
								  <fmt:formatDate value="${accOfferPromotions.endingDate}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</article>
</main>
<main id="main">
	<div class="row">
		<div class="col-12">
			<hr class="text-center" style="margin-top:20px;" size="3px">
		</div>
		<div class="col-12">
			<h3 class="text-center" style="margin-top:50px; margin-bottom:0px;">A C T I V I T Y&ensp;증정 프로모션</h3>
		</div>
		<div class="col-12">
			<hr class="text-center" style="margin-bottom:20px;" size="3px">
		</div>
	</div>
</main>
<main id="main">
	<article id="">
		<ul class="">
			<c:forEach var="actDiscountPromotions" items="${actDiscountPromotions }" >
				<li class="promotion-list__item">
					<a href="/activity/detail?actNo=${actDiscountPromotions.actNo }">
					<div class="promotion-list__img" style='background-image: url("/resources/images/hostMainImage/${actDiscountPromotions.mainImage}")'>
						<span class="promotion-main__left">${actDiscountPromotions.deadlineDate }DAYS LEFT</span>
						<span>${actDiscountPromotions.actName }</span>
						<span class="promotion-main__depth">${actDiscountPromotions.actRegionDepth1 }/${actDiscountPromotions.actRegionDepth1 }</span>
					</div>
					<div class="promotion-list__description">
						<div class="promotion-list__name">< ${actDiscountPromotions.actName } ></div>
						<div class="promotion-list__title">${actDiscountPromotions.introContent }</div>
						<div class="promotion-list__rate">
							평일:<fmt:formatNumber value="${actDiscountPromotions.weekdaysDiscountRate}" type="percent"/>&emsp;
							주말:<fmt:formatNumber value="${actDiscountPromotions.peakSeasonDiscountRate}" type="percent"/>&emsp;
							성수기:<fmt:formatNumber value="${actDiscountPromotions.peakSeasonDiscountRate}" type="percent"/>
						</div>
						<div class="promotion-list__date">
							기간 : <fmt:formatDate value="${actDiscountPromotions.startingDate}" pattern="yyyy.MM.dd"/> ~
								  <fmt:formatDate value="${actDiscountPromotions.endingDate}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</article>
</main>
<main id="main">
	<div class="row">
		<div class="col-12">
			<hr class="text-center" style="margin-top:20px;" size="3px">
		</div>
		<div class="col-12">
			<h3 class="text-center" style="margin-top:50px; margin-bottom:0px;">A C T I V I T Y&ensp;증정 프로모션</h3>
		</div>
		<div class="col-12">
			<hr class="text-center" style="margin-bottom:20px;" size="3px">
		</div>
	</div>
</main>
<main id="main">
	<article id="">
		<ul class="">
			<c:forEach var="actOfferPromotions" items="${actOfferPromotions }" >
				<li class="promotion-list__item">
					<a href="/activity/detail?actNo=${actOfferPromotions.actNo }">
					<div class="promotion-list__img" style='background-image: url("/resources/images/hostMainImage/${actOfferPromotions.mainImage}")'>
						<span class="promotion-main__left">${actOfferPromotions.deadlineDate }DAYS LEFT</span>
						<span>${actOfferPromotions.actName }</span>
						<span class="promotion-main__depth">${actOfferPromotions.actRegionDepth1 }/${actOfferPromotions.actRegionDepth2 }</span>
					</div>
					<div class="promotion-list__description">
						<div class="promotion-list__name">< ${actOfferPromotions.actName } ></div>
						<div class="promotion-list__title">${actOfferPromotions.introContent }</div>
						<div class="promotion-list__rate">${actOfferPromotions.offerContent }</div>
						<div class="promotion-list__date">
							기간 : <fmt:formatDate value="${actOfferPromotions.startingDate}" pattern="yyyy.MM.dd"/> ~
								  <fmt:formatDate value="${actOfferPromotions.endingDate}" pattern="yyyy.MM.dd"/>
						</div>
					</div>
					</a>
				</li>
			</c:forEach>
		</ul>
	</article>
</main>
</body>
</html>