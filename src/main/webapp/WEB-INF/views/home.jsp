<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/tags.jsp" %>
<main id="main">
	<!-- 
   - ul 이 슬라이드 전체, li가 보여지는 슬라이드 화면 1개 라고 보시면 됩니다. 
   - 페이지 네이션은 부트스트랩 자체 기능으로 조절 가능.
   - 이미지는 div에 background-image로 불러올 예정이기에 
   background-color를 임시로 넣어두고 사이즈 맞춰놨습니다.
 -->
	<!-- 숙소 -->
	<section id="stay">
		<!-- 최신순 -->
		<article id="stay-new">
		<div id="carouselNewStayControls" class="carousel slide" data-bs-ride="carousel">
			<ul class="stay-new__list carousel-inner">
			    <c:forEach var="newSixAccommoDto" items="${newSixAccommoDtos }">
			    <li id="stay-new__item" class="stay-new__item carousel-item">
				    <a href="/accommo/detail?accNo=${newSixAccommoDto.accNo }&check_in=&check_out=&days=">
					    <div class="stay-new__image">
					    	<img src="../resources/images/hostMainImage/${newSixAccommoDto.mainImage}"/>
					    </div>
					    <div class="stay-new__info">
							<p class="title">${newSixAccommoDto.accName }</p>
							<p class="info__description">
								${newSixAccommoDto.accIntroTitle }
							</p>
							<p class="event">NEW LAUNCHING</p>
							<p class="read-more">read more</p>
						</div>
					</a>
			    </li>
			    </c:forEach>
			 </ul>    
			 <button class="carousel-control-prev" type="button" data-bs-target="#carouselNewStayControls" data-bs-slide="prev">
			   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			   <span class="visually-hidden">Previous</span>
			 </button>
			 <button class="carousel-control-next" type="button" data-bs-target="#carouselNewStayControls" data-bs-slide="next">
			   <span class="carousel-control-next-icon" aria-hidden="true"></span>
			   <span class="visually-hidden">Next</span>
			 </button>
		</div>
		</article>
		<!-- 전체 숙소 -->
		<article id="stay-total">
			<h1>S T A Y</h1>

			<!-- 숙소 3개 묶어서 1개 슬라이드 화면 -->
			<ul class="stay-total__list">
			<c:forEach var="accommoDto" items="${accommoDtos }" varStatus="status">
				<li class="stay-total__item-wrap">
					<div class="stay-total__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="stay-total__image">
								<img src="../resources/images/hostMainImage/${accommoDto.mainImage }"/>
							</div>
							<div class="stay-total__info">
								<h2 class="info__title">${accommoDto.accommoName }</h2>
								<p class="info__text">
									${accommoDto.accommoRegionDepth1 }
									 / 
									${accommoDto.accommoRegionDepth2 }
									<span>
										<fmt:formatNumber value="${accommoDto.minPrice }" type="currency" currencySymbol="￦" />
									~
										<fmt:formatNumber value="${accommoDto.maxPrice }" type="currency" currencySymbol="￦" />
									</span>
								</p>
								<p class="read-more">read more</p>
							</div>
						</a>
					</div>
				</li>
				</c:forEach>
			</ul>
			<c:if test="${pagination.totalRecords gt 0 }">
				<div id="pagination">
		  			<ul class="pagination__list">
		    			<li class="page__prev ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="home?page=${pagination.prevPage }" data-page="${pagination.prevPage }">
		      				 <i class="fas fa-chevron-left"></i>
		      				</a>
		    			</li>
		
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page__num ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="home?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
		
		    			<li class="page__next ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="home?page=${pagination.nextPage }" data-page="${pagination.nextPage }">
		      				 <i class="fas fa-chevron-right"></i>
		      				</a>
		    			</li>
		  			</ul>
				</div>
			</c:if>	
		</article>
	</section>

	<!-- 프로모션 -->
	<section id="promotion">
		<!-- 프로모션 이미지 배너 -->
		<div class="promotion-banner">
			<a href="">
				<div class="promotion__image">HOGE X PROMOTION</div>
			</a>
		</div>

		<!-- 할인 -->
		<article id="discount">
		<div id="carouselDiscountAccControls" class="carousel slide" data-bs-ride="carousel">
			<ul class="discount__list carousel-inner">
			    <c:forEach var="homePromotionDiscountDto" items="${homePromotionDiscountDtos }">
			    <li id="discount__item" class="discount__item carousel-item">
				    <a href="#">
					    <div class="discount__info">
							<div class="info-top">
								<p class="text">
									${homePromotionDiscountDto.introContent }
								</p>
								<p class="event">
									평일 숙박 
									<fmt:formatNumber value="${homePromotionDiscountDto.weekdaysDiscountRate }" type="percent"/>
									할인!!!
								</p>
							</div>
							<div class="info-bottom">
								<h2 class="info__title">${homePromotionDiscountDto.accommoName }</h2>
								<p class="info__text">
									${homePromotionDiscountDto.accommoRegionDepth1 } / 
									${homePromotionDiscountDto.accommoRegionDepth2 } · 
									<span>${homePromotionDiscountDto.accommoType }</span>
									<br /> 
									최소 ${homePromotionDiscountDto.minNumber }명 / 
									최대 ${homePromotionDiscountDto.maxNumber }명 
									<br />
									<fmt:formatNumber value="${homePromotionDiscountDto.minPrice * (1-homePromotionDiscountDto.weekdaysDiscountRate)}" type="currency" currencySymbol="￦" />
									 ~ 
									<fmt:formatNumber value="${homePromotionDiscountDto.maxPrice * (1-homePromotionDiscountDto.peakSeasonDiscountRate)}" type="currency" currencySymbol="￦" />
								</p>
							</div>
						</div>
						<div class="discount__image">
							<img src="../resources/images/hostMainImage/${homePromotionDiscountDto.mainImage }"/>
						</div>
						<div class="promotion-date">
							${homePromotionDiscountDto.deadlineDate } DAYS <br />LEFT!
						</div>
					</a>
			    </li>
			    </c:forEach>
			 </ul>    
			 <button class="carousel-control-prev" type="button" data-bs-target="#carouselDiscountAccControls" data-bs-slide="prev">
			   <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			   <span class="visually-hidden">Previous</span>
			 </button>
			 <button class="carousel-control-next" type="button" data-bs-target="#carouselDiscountAccControls" data-bs-slide="next">
			   <span class="carousel-control-next-icon" aria-hidden="true"></span>
			   <span class="visually-hidden">Next</span>
			 </button>
		</div>
		</article>
		
		<!-- <article id="discount">
			<div class="discount-wrap">
				<h1>D I S C O U N T</h1>
				<ul class="discount__list">
					<li class="discount__item">
						<a href="">
							<div class="discount__info">
								<div class="info-top">
									<p class="text">
										태양과 바다가 있는 <br />우리만의 CHILL STAY
									</p>
									<p class="event">평일 숙박권 15%할인</p>
								</div>
								<div class="info-bottom">
									<h2 class="info__title">칠 드라이브인</h2>
									<p class="info__text">
										강원 / 양양군 · <span>호스텔</span> <br /> 최소 1명 / 최대 3명 <br />
										₩230,000 ~ ₩370,000
									</p>
								</div>
							</div>
							<div class="discount__image"></div>
							<div class="promotion-date">
								4 DAYS <br />LEFT!
							</div>
						</a>
					</li>
				</ul>
			</div>
		</article> -->

		<!-- 증정 -->
		<article id="event">
			<h1>E V E N T</h1>

			<!-- 증정 3개 묶어서 1개 슬라이드 화면 -->
			<ul class="event__list">
				<li class="event__item-wrap">
					<div class="event__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="event__image"></div>
							<div class="promotion-date">
								2 DAYS <br />LEFT!
							</div>
							<div class="event__info">
								<h2 class="info__title">토리코티지 X 하시시박</h2>
								<p class="info__text">제주/제주시</p>
								<p class="info__description">
									주중 1박 <br /> 4인 숙박권 이벤트
								</p>
								<p class="read-more">자세히 보기</p>
							</div>
						</a>
					</div>
					<div class="event__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="event__image"></div>
							<div class="promotion-date">
								4 DAYS <br />LEFT!
							</div>
							<div class="event__info">
								<h2 class="info__title">서우주</h2>
								<p class="info__text">제주/제주시</p>
								<p class="info__description">
									주중 1박 <br /> 2인 숙박권 이벤트
								</p>
								<p class="read-more">자세히 보기</p>
							</div>
						</a>
					</div>
					<div class="event__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="event__image"></div>
							<div class="promotion-date">
								12 DAYS <br />LEFT!
							</div>
							<div class="event__info">
								<h2 class="info__title">Conte D'Hiver</h2>
								<p class="info__text">전국 호게 숙소</p>
								<p class="info__description">
									사계 연작의 첫 번째 이야기 <br /> 도서 증정 이벤트
								</p>
								<p class="read-more">자세히 보기</p>
							</div>
						</a>
					</div>
				</li>
			</ul>
		</article>
	</section>

	<!-- 체험 -->
	<section id="activity">
		<!-- 최신순 -->
		<article id="activity-new">
			<ul class="activity-new__list">
				<li class="activity-new__item"><a href="">
						<div class="activity-new__image"></div>
						<div class="activity-new__info">
							<p class="event">NEW</p>
							<p class="text">
								빛의 흐름에 따라<br />완성되는 여행의 조각
							</p>
							<p class="title">CELLOPHANE</p>
							<p class="read-more">read more</p>
						</div>
				</a></li>
			</ul>
		</article>

		<!-- 전체 체험 -->
		<article id="activity-total">
			<h1>A C T I V I T Y</h1>

			<!-- 체험 3개 묶어서 1개 슬라이드 화면 -->
			<ul class="activity-total__list">
				<li class="activity-total__item-wrap">
					<div class="activity-total__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="activity-total__image"></div>
							<div class="activity-total__info">
								<h2 class="info__title">
									한땀한땀 직접 <br />책 제본 해보기
								</h2>
								<p class="info__text">제주/제주시</p>
								<p class="read-more">read more</p>
							</div>
						</a>
					</div>
					<div class="activity-total__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="activity-total__image"></div>
							<div class="activity-total__info">
								<h2 class="info__title">
									드라이플라워 <br />꽃꽃이 체험
								</h2>
								<p class="info__text">전라/전주시</p>
								<p class="read-more">read more</p>
							</div>
						</a>
					</div>
					<div class="activity-total__item">
						<button class="btn__like">
							<i class="far fa-heart"></i>
						</button>
						<a href="">
							<div class="activity-total__image"></div>
							<div class="activity-total__info">
								<h2 class="info__title">
									빈티지 카페 <br />독서클럽
								</h2>
								<p class="info__text">강원/강릉시</p>
								<p class="read-more">read more</p>
							</div>
						</a>
					</div>
				</li>
			</ul>
		</article>
	</section>
</main>
<script>
$(function() {
	$("#stay-new__item").attr("class","stay-new__item carousel-item active");
	$("#discount__item").attr("class","discount__item carousel-item active");
	
	// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var pageNo = $(this).attr("data-page");
	})
});

</script>