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
	<div class="row mb-3">
		<div class="col-6">
			<div class="accommo">
				<c:choose>
					<c:when test="${empty accommos }">
						<tr>
							<td class="text-center" colspan="6">등록된 도서 정보가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="accommos" items="${accommos }" varStatus="loop" >
							<h3>${accommos.name }</h3>
							<h6>${accommos.type }</h6>
							<div class="row">
								<div class="col-3">
									<ul>
										<li id="position" data-xce="${accommos.xce }" data-yce="${accommos.yce }">${accommos.regionDepth1 }</li>
										<li>기준 ${accommos.minNumber }명(최대 ${accommos.maxNumber }명)</li>
										<li>${accommos.minPrice }~${accommos.maxPrice }</li>
										<li>${accommos.averageStar }</li>
										<li>예약하기</li>
									</ul>
								</div>
								<div class="col-7">
									<img style="height: 200px; width: auto" src="/resources/images/accommos/200/accommo_200_1.jpg" alt="숙소 이미지">
								</div>
								<div class="col-2">
									<span>heart</span>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		
		<!-- 지도 -->
		<div class="col-6">
			<div id="map" style="width:100%;height:600px;"></div>
		</div>
	</div>
</div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8606c7f07c8e2d80f27869dab7ebaec2"></script>
<script>

	window.onload=function(){
		$.getJSON('/rest/accommo/list', function(accommo) {
			console.log("실행되니?");
			console.log(accommo);
		})
	}
	
	$(function() {
		$.getJSON('list.jsp', function(data) {
			
		})
	})

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(37.57145, 126.98959), // 지도의 중심좌표
		level : 6, // 지도의 확대 레벨
		mapTypeId : kakao.maps.MapTypeId.ROADMAP
	// 지도종류
	};

	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption);

	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        
	        /* var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	        // 마커와 인포윈도우를 표시합니다
	        displayMarker(locPosition, message); */
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	        title: '카카오', 
	        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
	    },
	    {
	        title: '생태연못', 
	        latlng: new kakao.maps.LatLng(33.450936, 126.569477)
	    },
	    {
	        title: '텃밭', 
	        latlng: new kakao.maps.LatLng(33.450879, 126.569940)
	    },
	    {
	        title: '근린공원',
	        latlng: new kakao.maps.LatLng(33.451393, 126.570738)
	    }
	];
	
	

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
	
		
</script>

</body>
</html>