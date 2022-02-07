<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 
</head>
<body>
<div class="container">
	<form id="form-search-accommo" method="get" action="list">
		<input type="hidden" name="number" value="${criteria.maxStandardNumberValue }">
		<div class="row mb-3">
			<div class="col">
				<span id="span-address">${criteria.addressValue }</span>
				<input id="checkInBox" type="text" name="checkInDate" autocomplete="off" value="${criteria.checkInBoxValue }"> -
		        <input id="checkOutBox" type="text" name="checkOutDate" autocomplete="off" value="${criteria.checkOutBoxValue }">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-6">
				<input type="hidden" name="page" value="1" />
				<div class="accommo">
					<c:choose>
						<c:when test="${empty accommos }">
							<tr>
								<td class="text-center" colspan="6">검색 조건에 맞는 숙소 정보가 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="accommos" items="${accommos }" varStatus="loop" >
								<h3 class="accommo-no" data-no="${accommos.no }">${accommos.name }</h3>
								<h6>${accommos.type }</h6>
								<div class="row">
									<div class="col-3">
										<ul>
											<li>${accommos.regionDepth1 }</li>
											<li>기준 ${accommos.minNumber }명(최대 ${accommos.maxNumber }명)</li>
											<c:choose>
												<c:when test="${empty criteria.checkInBoxValue }">
													<li><fmt:formatNumber value="${accommos.minWeekdaysPrice }" />~<fmt:formatNumber value="${accommos.maxWeekendPrice }" /></li>
													<li>${(accommos.cleanlinessStar + accommos.communicationStar + accommos.accuracyStar + accommos.locationStar) / 4 }</li>
												</c:when>
												<c:otherwise>
													<li><fmt:formatNumber value="${accommos.minPrice }" />~<fmt:formatNumber value="${accommos.maxPrice }" /></li>
													<li>${accommos.averageStar }</li>
												</c:otherwise>
											</c:choose>
											<li>예약하기</li>
										</ul>
									</div>
									<div class="col-7">
										<div id="carouselExampleIndicators${accommos.no }" class="carousel slide" data-bs-interval="false">
										    <div class="carousel-indicators">
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="1" aria-label="Slide 2"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="2" aria-label="Slide 3"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="3" aria-label="Slide 4"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="4" aria-label="Slide 5"></button>
											    <button type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide-to="5" aria-label="Slide 6"></button>
										    </div>
										    <div class="carousel-inner">
										    	<c:forEach var="image" items="${accommos.accommoImages }">
											    	<div class="carousel-item ${fn:substring(image.image, 12, 13) eq 1 ? 'active' : '' } ">
											      		<img src="/resources/images/accommoList/${accommos.no }/${image.image }" class="d-block w-100" alt="${image.image }">
											    	</div>
										    	</c:forEach>
										    </div>
										    <button class="carousel-control-prev" type="button" data-bs-target="carouselExampleIndicators${accommos.no }" data-bs-slide="prev">
										    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
										    	<span class="visually-hidden">Previous</span>
										    </button>
										    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators${accommos.no }" data-bs-slide="next">
										    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
									    		<span class="visually-hidden">Next</span>
									    	</button>
										</div>
									</div>
									<div class="col-2">
									<span class="favorite">
										<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
											<path d="M0 0h24v24H0z" fill="none"/>
											<path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/>
										</svg>
									</span>
								</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${pagination.totalRecords gt 0 }">
					<!-- 페이지 내비게이션 표시 -->
					<div class="row mb-3">
						<div class="col">
							<nav>
					  			<ul class="pagination justify-content-center">
					    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					      				<a class="page-link" href="list.do?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
					    			</li>
				
					    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						    				<a class="page-link" href="list.do?page=${num }" data-page="${num }">${num }</a>
						    			</li>	    			
					    			</c:forEach>
				
					    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					      				<a class="page-link" href="list.do?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
					    			</li>
					  			</ul>
							</nav>
						</div>
					</div>
				</c:if>
			</div>
			
			<!-- 지도 -->
			<div class="col-6">
				<div id="map" style="width:100%;height:600px;"></div>
			</div>
		</div>
	</form>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8606c7f07c8e2d80f27869dab7ebaec2&libraries=services"></script>
<script>
$(function() {
	// 공휴일 API
	/* window.onload = function () {
		$.ajax({
			type: 'get',
			url: '/holidays',
			data: {year: "2022", month: "01"},
			dataType: 'json',
			success: function(result) {
				console.log(result);
			},
			error: function(error) {
				console.log(error);
			}
		}) 
	}*/
	
	// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
	$(".pagination a").click(function(event) {
		event.preventDefault();
		// 클릭한 페이지내비게이션의 페이지번호 조회하기
		var pageNo = $(this).attr("data-page");
		// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
		$(":input[name=page]").val(pageNo);
		// 검색폼에 onsubmit 이벤트 발생시키기
		$("#form-search-accommo").trigger("submit");
	});
	
	
	// 카카오지도 API
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	if ($("#span-address").text() != '') {
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다
		ps.keywordSearch($("#span-address").text(), placesSearchCB); 
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (result, status) {
		    if (status === kakao.maps.services.Status.OK) {
				
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		        
		        for (var i=0; i<result.length; i++) {
		            bounds.extend(new kakao.maps.LatLng(result[i].y, result[i].x));
		        }       
		
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}
	} else {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		    	var coords = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude); // 위도
		            
		        map.setCenter(coords);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(locPosition, message);
		}
	}
	// 마커
	var accommoNoArray = [];
               
       $(".accommo-no").each(function(i){
       	accommoNoArray.push($(this).attr("data-no"));
       });
	
       var positionDto;
	$.ajax({
		type: 'get',
		url: '/rest/accommo/marker',
		data: {accommoNoArray: accommoNoArray},
		async: false,
		dataType: 'json',
		success: function(result) {
			positionDto = result;
		},
		error: function(error) {
			console.log(error);
		}
	});
       
	var positions = [];
	
	$.each(positionDto, function(key, value) {
		positions.push({
			title: value.title,
			latlng: new kakao.maps.LatLng(value.xce, value.yce)
		})
	});
		
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	}

	// 지도 영역 변화 이벤트를 등록한다
	kakao.maps.event.addListener(map, 'bounds_changed', function () {
		var bounds = map.getBounds();
		// 영역의 남서쪽 좌표를 얻어옵니다 
	    var swLatLng = bounds.getSouthWest(); 
	    
	    // 영역의 북동쪽 좌표를 얻어옵니다 
	    var neLatLng = bounds.getNorthEast(); 
		
		var number = $("input[name=number]").val();
		var checkIn = $("input[name=checkInDate]").val();
		var checkOut = $("input[name=checkOutDate]").val();
		// mapAreaList(number, checkIn, checkOut, swLatLng.getLat(), swLatLng.getLng(), neLatLng.getLat(), neLatLng.getLng());

	});
	
	// 지도 영역의 list 출력
	function mapAreaList(number, checkIn, checkOut, swLat, swLng, neLat, neLng) {
		$.ajax({
			type: 'get',
			url: '/rest/accommo/mapArea',
			data: {number: number, checkIn: checkIn, checkOut: checkOut, swLat: swLat, swLng: swLng, neLat: neLat, neLng: neLng},
			async: false,
			dataType: 'json',
			success: function(result) {
				console.log(result);
			},
			error: function(error) {
				console.log(error);
			}
			
		});
	}
	
	/* window.onload = function () {
	$.ajax({
		type: 'get',
		url: '/holidays',
		data: {year: "2022", month: "01"},
		dataType: 'json',
		success: function(result) {
			console.log(result);
		},
		error: function(error) {
			console.log(error);
		}
	}) 
}*/
	
	
	
	
	
	
	
	// heart script 이승준
	const favorites = document.querySelectorAll(".favorite")
	favorites.forEach(favorite => {
		favorite.addEventListener("click", () => {
			favorite.classList.toggle("active")
			if(favorite.classList.contains("active")) {
				favorite.innerHTML='<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>'
			} else {
				favorite.innerHTML='<svg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24"><path d="M0 0h24v24H0z" fill="none"/><path d="M16.5 3c-1.74 0-3.41.81-4.5 2.09C10.91 3.81 9.24 3 7.5 3 4.42 3 2 5.42 2 8.5c0 3.78 3.4 6.86 8.55 11.54L12 21.35l1.45-1.32C18.6 15.36 22 12.28 22 8.5 22 5.42 19.58 3 16.5 3zm-4.4 15.55l-.1.1-.1-.1C7.14 14.24 4 11.39 4 8.5 4 6.5 5.5 5 7.5 5c1.54 0 3.04.99 3.57 2.36h1.87C13.46 5.99 14.96 5 16.5 5c2 0 3.5 1.5 3.5 3.5 0 2.89-3.14 5.74-7.9 10.05z"/></svg>'
			}
		})
	})
	
	
	datePickerSet($("#checkInBox"), $("#checkOutBox"));

	// 달력생성함수 sDate:시작일 eDate:종료일
	function datePickerSet(sDate, eDate) {

        var sDay = sDate.val();
        var eDay = eDate.val();

        // 체크인 달력 생성
        if (!isValidStr(eDay)) {
            sDate.datepicker({
                maxDate: new Date(eDay)
            });
        }
        
        sDate.datepicker({
            language: 'ko',
            minDate: new Date(),
            autoClose: true,
            onSelect: function () {
                datePickerSet(sDate, eDate);
            }
        });

        // 체크아웃 달력 생성
        if (!isValidStr(sDay)) {
            eDate.datepicker({
                minDate: new Date(sDay)
            });
        } 
        
	    eDate.datepicker({
	        language: 'ko',
	        autoClose: true,
	        onSelect: function () {
	            datePickerSet(sDate, eDate);
	        }
	    });
		
	    //날짜 생성 여부
	    function isValidStr(str) {
	        if (str == null || str == undefined || str == "")
	            return true;
	        else
	            return false;
	    }
	}
})
</script>

</body>
</html>