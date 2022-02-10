<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row mb-3">
			<div class="col">
				<span id="span-address">${criteria.addressValue }</span> <input
					id="checkInBox" type="text" name="checkInDate" autocomplete="off"
					value="${criteria.checkInBoxValue }">
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-6">
				<!-- List 영역 -->
				<div class="activities"></div>
				<div class="row mb-3">
					<div class="col">
						<div class="pagination"></div>
					</div>
				</div>
			</div>
	
			<!-- 지도 -->
			<div class="col-6">
				<div id="map" style="width: 100%; height: 600px;"></div>
			</div>
		</div>
	</div>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8606c7f07c8e2d80f27869dab7ebaec2&libraries=services"></script>
<script>
</script>

</body>
</html>