<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<head>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
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
		<c:forEach var="myRevInfo" items="${myRevList }">
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
							<c:if test="${myRevInfo.roomBookingStatus eq 1 }">
								<button id="" type="button" class="btn btn-dark me-2">예약취소</button>
							</c:if>
							<c:if test="${myRevInfo.roomBookingStatus eq 2 }">
								<button id="" type="button" class="btn btn-dark me-2">취소완료</button>
							</c:if>
							<c:if test="${myRevInfo.roomBookingStatus eq 0 }">
								<button id="" type="button" class="btn btn-dark me-2" data-bs-toggle="modal" data-bs-target="#modal-review">리뷰작성</button>
							</c:if>
						</div>
					</div>
				</div>
				<div class="col-4 me-0 border-top border-bottom border-end bg-light">
					<div id="carouselExampleIndicators${myRevInfo.accommoNo }" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
							<c:forEach var="accommoImage" items="${myRevInfo.accommoImages }" varStatus="status">
								<button type="button" 
										data-bs-target="#carouselExampleIndicators${myRevInfo.accommoNo }"
										data-bs-slide-to="${status.index }" 
										class="<c:if test="${status.index eq 0 }">active</c:if>" 
										aria-current="true"
										aria-label="Slide ${status.count }">
								</button>
							</c:forEach>
						</div>
						<div class="carousel-inner">
							<c:forEach var="accommoImage" items="${myRevInfo.accommoImages }" varStatus="status">
								<div class="carousel-item<c:if test="${status.index eq 0 }"> active</c:if>">
									<img src="../../resources/images/accommoList/${accommoImage.image}" class="d-block w-100" alt="...">
								</div>
							</c:forEach>
						</div>
						<button class="carousel-control-prev" type="button"
							data-bs-target="#carouselExampleIndicators${myRevInfo.accommoNo }" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button"
							data-bs-target="#carouselExampleIndicators${myRevInfo.accommoNo }" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal-review" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <article class="modal-content">
      <header class="modal-title">
        <p class="modal__title">문의 상세</p>
      </header>
      <div class="modal-body">
		<h2>별점주기테스트</h2>
		<div class="make_star1">
			<div class="selectrating" data-rate="5">
				<span class="" id="">청결점수</span>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<span id="starScore1" ></span>
				<input type="hidden" name="cleanlinessStar"/>
			</div>
		</div>
		<div class="make_star2">
			<div class="selectrating" data-rate="5">
				<span class="" id="">소통점수</span>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<span id="starScore2"></span>
				<input type="hidden" name="communicationStar"/>
			</div>
		</div>
		<div class="make_star3">
			<div class="selectrating" data-rate="5">
				<span class="" id="">정확점수</span>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<span id="starScore3"></span>
				<input type="hidden" name="accuracyStar"/>
			</div>
		</div>
		<div class="make_star4">
			<div class="selectrating" data-rate="5">
				<span class="" id="">위치점수</span>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<i class="fas fa-star"></i>
				<span id="starScore4"></span>
				<input type="hidden" name="locationStarme"/>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>
    </article>
  </div>
</div>

<script>
$(function() {
	// 별점주기
	var rating = $(".selectrating");
	
	rating.each(function(){
		var targetScore = $(this).attr('data-rate');
		
		for(var i = 0; i<targetScore; i++){
			$(this).find('.fa-star').eq(i).css({color:'red'});
			$("#starScore${cnt}").text(targetScore + "점");
		}	
	});
	
	<c:forEach var="cnt" begin="1" end="4">
	$(".make_star${cnt} svg").click(function() {
		var targetNum = $(this).index() +1;
		$(".make_star${cnt} svg").css({color:"black"});
		$(".make_star${cnt} svg:nth-child(-n+" + targetNum +")").css({color:"#dc143c"});
		$("#starScore${cnt}").text(targetNum-1 + "점");
		$(".make_star${cnt} input[type=hidden]").val(targetNum-1);
		console.log($(".make_star${cnt} input[type=hidden]").val());
	});
	</c:forEach>
});

</script>