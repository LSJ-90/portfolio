<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
	<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<link rel="stylesheet" href="../../resources/css/datepickerAdmin.min.css">
	<script src="../../resources/js/datepicker.js"></script>
	<script src="../../resources/js/datepicker.min.js"></script>
	<script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
	<meta charset="UTF-8">
<style>
	.target { display: inline-block; width: 1000px; }

</style>
<title>메인페이지-숙소</title>
</head>
<body>
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3" aria-label="Slide 4"></button>
	    <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="4" aria-label="Slide 5"></button>
	  </div>
	  
	<div class="carousel-inner">
		<c:forEach var="image" items="${accImages}" varStatus="status">
			<c:choose>
				<c:when test="${status.index == 0}">
					<div class="carousel-item active">
				</c:when>
				<c:otherwise>
					<div class="carousel-item">
				</c:otherwise>
			</c:choose>
					<img src="/resources/images/accommodation/${image.image }" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
					<h2>"${accMainDto.accIntroTitle}"   <${accMainDto.accName}></h2>
					</div>
				</div>
		</c:forEach>
	</div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>
	
	<c:choose>
		<c:when test="${param.days == null}">
			<h3 class="text-center">날짜를 선택해주세요.</h3>
		</c:when>
		<c:otherwise>
			<h3 class="text-center">${param.check_in } ~ ${param.check_out } [${param.days }박]</h3>
		</c:otherwise>
	</c:choose>	
	<form method="post" action="search" method="post">
		<input type="hidden" name="accNo" value="${accMainDto.accNo }">
			<div class="text-center">
		        <input id="checkInBox" type="text" name="check_in" > ~ <input id="checkOutBox" type="text" name="check_out" >
				<button class="btn btn-outline-dark btn-lg" type="submit">검색</button>
		    </div>
	</form>
	
		<!-- <input type="date" value="${param.check_in }" name="check_in"> ~ <input type="date" value="${param.check_out }" name="check_out"> -->
	
	<h1>ROOMS</h1>
	<h1>____</h1>
	
	<c:forEach var="roomListDto" items="${roomListDto}">
		<div class="card" style="width: 500px;">
			<h2>${roomListDto.name}</h2>
			<c:forEach var="image" items="${roomListDto.roomImages}"  varStatus="status">
				<c:if test="${status.index == 0}">
					<a href="#"><img src="/resources/images/room/${image.image }" class="card-img-top" alt="..."></a>
				</c:if>
			</c:forEach>
			<div class="card-body">
				<p>평일 ₩<fmt:formatNumber value="${roomListDto.weekdaysPrice }" pattern="##,###"/></p>
				<p>주말 ₩<fmt:formatNumber value="${roomListDto.weekendPrice }" pattern="##,###"/></p>
		        <p>성수기 ₩<fmt:formatNumber value="${roomListDto.peakSeasonPrice }" pattern="##,###"/></p>
		        <Strong>기준 ${roomListDto.standardNumber }명(최대 ${roomListDto.maximumNumber }명)</Strong>
			</div>
		</div>
	</c:forEach>
	
	<div class="text-center">
		<p>.</p>
		<p>.</p>
		<p>.</p>
		<p>.</p>
		<h2>${accMainDto.accIntroTitle}</h2>
		<h3>${accMainDto.accName}</h3>
		<p>|</p>
		<p>|</p>
		<h4 class="target">${accMainDto.accIntroContent}</h4>
		<p>.</p>
		<p>.</p>
		<p>.</p>
		<p>${accMainDto.accName}의 주소는 [ ${accMainDto.accAddress} ]입니다.</p>
	</div>

</body>
<script>

datePickerSet($("#checkInBox"), $("#checkOutBox"));
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


</script>
</html>