<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<!-- datepicker -->
	<link rel="stylesheet" href="../../resources/css/datepickerAdmin.min.css">
    <script src="../../resources/js/datepicker.js"></script>
    <script src="../../resources/js/datepicker.min.js"></script>
    <script src="../../resources/js/datepickerutil/datepicker.ko.js"></script>
	<meta charset="UTF-8">
<style>
	.target { display: inline-block; width: 1000px; }
	A:link {text-decoration:none; color:#000000;}
	A:visited {text-decoration:none; color:#000000;}
	A:active {text-decoration:none; color:#000000;}
	A:hover {text-decoration:none; color:#000000;}
	#box1 {text-align: right;}
	#box2 {text-align: center;}
</style>
<title>메인페이지-숙소</title>
</head>
<body>
<div class="container">
	<div class="col-12" style=margin-top:50px">
		<a style="margin=top:50px;">${accMainDto.accName}</a>
		<a style="float:right; margin=bottom:100px;" href="javascript:history.back()"><img src="/resources/images/common/back.JPG">돌아가기</a>
	</div>
</div>

<div class="container">
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-indicators">
	  <c:forEach var="image" items="${accImages}" varStatus="status">
	  		<c:choose>
				<c:when test="${status.index == 0}">
	    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${status.index}" class="active" aria-current="true"></button>
	    		</c:when>
				<c:otherwise>
	    			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="${status.index}"></button>
	    		</c:otherwise>
			</c:choose>
		</c:forEach>
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
							<h2>"${accMainDto.accIntroTitle}"   <${accMainDto.accName}></h2><h6>${accMainDto.dept1} / ${accMainDto.dept2}</h6>
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
</div>

<div class="container">
	<div class="row text-center" style="margin-top:80px; margin-bottom:150px;">
		<div class="col">
			<c:choose>
				<c:when test="${param.days == null}">
					<h3>날짜를 선택해주세요.</h3>
				</c:when>
				<c:otherwise>
					<h3>${param.check_in } ~ ${param.check_out } [${param.days }박]</h3>
				</c:otherwise>
			</c:choose>	
			<form method="post" action="search" method="post">
				<input type="hidden" name="accNo" value="${accMainDto.accNo }">
				<input id="checkInBox1" type="text" name="check_in" > ~ <input id="checkOutBox1" type="text" name="check_out" >
				<button class="btn btn-outline-dark btn-lg" type="submit">검색</button>
			</form>
			<hr style="margin-top:50px;" width="100%" align="right" size="4px">
		</div>
	</div>
</div>	
		<!-- <input type="date" value="${param.check_in }" name="check_in"> ~ <input type="date" value="${param.check_out }" name="check_out"> -->
	
<div class="container">	
	<div class="row">
		<div class="col-2">
			<h1>ROOMS</h1>
			<h1>____</h1>
		</div>
		<c:forEach var="roomSearchList" items="${roomSearchList}">
			<div class="card col-3" style="width: 500px;">
				<h2>${roomSearchList.name}</h2>
				<c:forEach var="image" items="${roomSearchList.roomImages}" varStatus="status">
					<c:if test="${status.index == 0}">
						<a href="/accommo/roomDetail?accNo=${param.accNo }&check_in=${param.check_in }&check_out=${param.check_out }&roomNo=${roomSearchList.no }&days=${param.days }">
							<img id="image" src="/resources/images/room/${image.image }" class="card-img-top" alt="...">
						</a>
					</c:if>
				</c:forEach>
				<div class="card-body">
					<p>평일 ₩<fmt:formatNumber value="${roomSearchList.weekdaysPrice }" pattern="##,###"/></p>
					<p>주말 ₩<fmt:formatNumber value="${roomSearchList.weekendPrice }" pattern="##,###"/></p>
			        <p>성수기 ₩<fmt:formatNumber value="${roomSearchList.peakSeasonPrice }" pattern="##,###"/></p>
			        <Strong>기준 ${roomSearchList.standardNumber }명(최대 ${roomSearchList.maximumNumber }명)</Strong>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="container">	
	<div class="row">
		<div class="col">
			<div class="text-center" style="margin:100px 0;">
				<h2>${accMainDto.accIntroTitle}</h2>
				<h3>${accMainDto.accName}</h3>
				<p>|</p>
				<p>|</p>
				<h4 class="target">${accMainDto.accIntroContent}</h4>
				<p>${accMainDto.accName}의 주소는 [ ${accMainDto.accAddress} ]입니다.</p>
			</div>
		</div>
	</div>
</div>	
	
<div class="container">
	<div class="row">
		<div class="col-2">
		    <p style="margin-bottom:15px;">F A Q</p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="11">인원 및 금액</a></p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="22">예약 및 결제</a></p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="33">이용 안내</a></p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="44">부대시설 안내</a></p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="55">기타 안내</a></p>
		    <p style="margin-bottom:15px;"><a href="" class="" id="">호스트에게 문의</a></p>
	    </div>
	    
		<div class="col-10" id="1">
			<h5 style="margin-bottom:30px;">FAQ를 통하여 예약에 관련된 더 자세한 내용들을 찾아보세요.</h5>
			<h3 style="margin-bottom:20px;">인원 및 금액</h3>
			<div class="row">
				<div class="col-2">
					<h5>인원 기준</h5>
				</div>
				<div class="col-8">
					<table class="table" id="box2">
						<thead>
							<tr>
								<th>객실이름</th>
								<th></th>
								<th>기준인원</th>
								<th></th>
								<th>최대인원</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="roomListDto" items="${roomListDto}">
								<tr>
									<td>${roomListDto.name}<td>
									<td>${roomListDto.standardNumber}<td>
									<td>${roomListDto.maximumNumber}<td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<c:forEach var="roomListDto" items="${roomListDto}">
						<c:if test="${roomListDto.pricePerPerson ne 0}">
							<p>• ${roomListDto.name } 객실 : 기준 인원 외의 인원은 1박당 <fmt:formatNumber value="${roomListDto.pricePerPerson }" pattern="##,###"/>원의 추가 비용이 적용됩니다.</p>
						</c:if>
					</c:forEach>
					<p style="margin-bottom:40px;">• 최대인원을 초과하는 인원 및 방문객의 입실은 불가합니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<h5>요금 기준</h5>
				</div>
				<div class="col-8">
					<table class="table" id="box2">
						<thead>
							<tr>
								<th>객실이름</th>
								<th></th>
								<th>주중(일-목)</th>
								<th></th>
								<th>주말(금-토)</th>
								<th></th>
								<th>성수기</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="roomListDto" items="${roomListDto}">
								<tr>
									<td>${roomListDto.name}<td>
									<td>${roomListDto.weekdaysPrice}<td>
									<td>${roomListDto.weekendPrice}<td>
									<td>${roomListDto.peakSeasonPrice}<td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<p>• 성수기 : 7. 15 - 8. 14/ 12월 특정 일자(12. 24, 12. 31)</p>
					<p>• 공휴일 전날은 주말요금이 적용됩니다.</p>
					<p style="margin-bottom:40px;">• 예약 변경 및 기타 문의사항은 ${accMainDto.accName}(${accMainDto.tel})로 연락 주시기 바랍니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-10" id="2">
			<h5 style="margin-bottom:30px;">FAQ를 통하여 예약에 관련된 더 자세한 내용들을 찾아보세요.</h5>
			<h3 style="margin-bottom:20px;">예약 및 결제</h3>
			<div class="row">
				<div class="col-2">
					<h5>예약 안내</h5>
				</div>
				<div class="col-8">
					<p>• 예약신청 후 결제방식에 따라 결제가 완료되면, 예약이 확정됩니다.</p>
					<p>• 신청 후 12시간 이내에 입금되지 않을 경우, 예약이 취소됩니다.</p>
					<p>• 한 날짜에 예약신청이 중복될 경우, 입금 순서가 아닌 신청 순서로 예약이 확정됩니다.</p>
					<p>• 계좌이체 결제시 현금영수증 발행이 가능합니다. 예약시 신청해주세요.</p>
					<p>• 예약 취소는 MyPage - 스테이 예약정보 - [예약 취소 요청] 버튼을 눌러주시기 바랍니다.</p>
					<p>• 이곳은 촬영 스튜디오가 아닌 숙박 공간입니다. 사전에 협의되지 않은 상업 사진 및 영상 촬영은 불가합니다.(광고용 사진, 제품사진, 쇼핑몰, SNS마켓 포함)</p>
					<p style="margin-bottom:40px;">• 상업적 용도의 촬영은 별도 대관료를 책정하여 운영하고 있습니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<h5>환불 규정</h5>
				</div>
				<div class="col-6">
					<p>• 환불 시 아래의 기준일에 따른 환불 금액을 드립니다.</p>
					<table class="table" id="box2">
						<thead>
							<tr>
								<th></th>
								<th>이용 10일전까지</th>
								<th></th>
								<th>총 결제금액의 100% 환불</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 9일전까지</strong><td>
								<td><strong>총 결제금액의 90% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 8일전까지</strong><td>
								<td><strong>총 결제금액의 80% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 7일전까지</strong><td>
								<td><strong>총 결제금액의 70% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 6일전까지</strong><td>
								<td><strong>총 결제금액의 60% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 5일전까지</strong><td>
								<td><strong>총 결제금액의 50% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 4일전까지</strong><td>
								<td><strong>총 결제금액의 40% 환불</strong><td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th></th>
								<td><strong>이용 3일전까지</strong><td>
								<td><strong>변경/환불 불가</strong><td>
							</tr>
						</tbody>
					</table>
					<p>• 예약의 확정은 위 사항을 모두 숙지하였고 모든 사항에 동의함을 의미합니다.</p>
					<p style="margin-bottom:40px;">• 자세한 문의사항은 ${accMainDto.accName}(${accMainDto.tel})로 연락주시기 바랍니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<h5>취소 안내</h5>
				</div>
				<div class="col-8">
					<p>• 예약번호는 예약안내 문자를 통해 확인 가능합니다. 확인이 어려우신 경우 스테이폴리오 챗봇을 통해 예약번호를 문의해주시기 바랍니다.</p>
					<p style="margin-bottom:40px;">• 취소를 원하시는 경우, 스테이폴리오 - ACCOUNT - 마이 페이지 - 예약 정보 - [취소 요청] 버튼을 눌러주시기 바랍니다.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-2">
					<h5>숙박권 양도</h5>
				</div>
				<div class="col-8">
					<p>• 숙박권의 재판매를 비롯하여 양도, 양수, 교환을 금지합니다.</p>
					<p style="margin-bottom:40px;">• 예약자의 부득이한 사유로 인해 본인 이용이 어려울 경우 가족에 한해 가족관계임을 증명할 수 있는 서류(가족관계증명서 등)와 실제 이용하시는 분의 신분증을 해당 스테이에 제시 후 이용이 가능합니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-10" id="3">
			<h5 style="margin-bottom:30px;">FAQ를 통하여 예약에 관련된 더 자세한 내용들을 찾아보세요.</h5>
			<h3 style="margin-bottom:20px;">이용 안내</h3>
			<div class="row">
				<div class="col-2">
					<h5>예약 전<br>확인사항</h5>
				</div>
				<div class="col-8">
					<p>• 체크인은 ${accMainDto.accCheckInTime}, 체크아웃은 ${accMainDto.accCheckOutime}입니다.</p>
					<p>• 객실 정리를 위해 체크아웃 시간을 지켜주시길 부탁드립니다.</p>
					<p>• 예약하신 당일 오전에 체크인 안내 문자를 보내드립니다.</p>
					<p>• 숙박 인원 외의 방문자 입실은 불가하며, 이에 따른 책임은 게스트에게 있으니 꼭 참고 부탁드립니다.</p>
					<p>• 숙소 내 모든 구역에서는 전자 담배를 포함하여 절대 금연입니다. 위반 시 즉각 퇴실 조치와 추가 청소비를 청구합니다.</p>
					<p>• 시설 및 비품의 파손, 반출, 분실 시 변상비가 청구됩니다.</p>
					<p>• 사전에 협의가 이뤄지지 않은 상업 사진 및 영상 촬영(광고용, 제품 사진, 쇼핑몰, SNS 마켓 포함), 드론 촬영은 불가합니다.</p>
					<p style="margin-bottom:40px;">• 예약 변경 및 기타 문의 사항은 ${accMainDto.accName}(${accMainDto.tel})로 연락해 주시기 바랍니다.</p>
				</div>
			</div>
		</div>
		
		<div class="col-10" id="4">
			<h5 style="margin-bottom:30px;">FAQ를 통하여 예약에 관련된 더 자세한 내용들을 찾아보세요.</h5>
			<h3 style="margin-bottom:20px;">부대시설 안내</h3>
			<c:forEach var="roomInfoType1" items="${roomInfoType1}">
				<div class="row">
					<div class="col-2">
						<h5>${roomInfoType1.infoTitle1}</h5>
					</div>
					<div class="col-10">
						<pre><p style="margin-bottom:30px;"><strong>${roomInfoType1.infoContent1}</strong></p></pre>
					</div>
				</div>
			</c:forEach>
		</div>
		
		<div class="col-10" id="5">
			<h5 style="margin-bottom:30px;">FAQ를 통하여 예약에 관련된 더 자세한 내용들을 찾아보세요.</h5>
			<h3 style="margin-bottom:20px;">기타 안내</h3>
			<c:forEach var="roomInfoType2" items="${roomInfoType2}">
				<div class="row">
					<div class="col-2">
						<h5>${roomInfoType2.infoTitle2}</h5>
					</div>
					<div class="col-10">
						<pre><p style="margin-bottom:30px;"><strong>${roomInfoType2.infoContent2}</strong></p></pre>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>		
</div>
</body>
<script>

datePickerSet($("#checkInBox1"), $("#checkOutBox1"));

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

	$(function() {
		$("#2").hide();
		$("#3").hide();
		$("#4").hide();
		$("#5").hide();
	})
	
	
	$('#11').click(function(e){
		e.preventDefault(); // 이벤트 막아버림(새로고침, submit 등등)
		$("#1").show();
		$("#2").hide();
		$("#3").hide();
		$("#4").hide();
		$("#5").hide();
	})
	
	$('#22').click(function(e){
		e.preventDefault();
		$("#2").show();
		$("#1").hide();
		$("#3").hide();
		$("#4").hide();
		$("#5").hide();
	})
	
	$('#33').click(function(e){
		e.preventDefault();
		$("#3").show();
		$("#1").hide();
		$("#2").hide();
		$("#4").hide();
		$("#5").hide();
	})
	
	$('#44').click(function(e){
		e.preventDefault();
		$("#4").show();
		$("#1").hide();
		$("#2").hide();
		$("#3").hide();
		$("#5").hide();
	})
	
	$('#55').click(function(e){
		e.preventDefault();
		$("#5").show();
		$("#1").hide();
		$("#2").hide();
		$("#3").hide();
		$("#4").hide();
	})
	
	
	$("#image").on("click", function(e) {
		e.preventDefault();
		if (${param.check_in == null}) {
			alert('날짜를 선택하세요.');
		}
	})
	




</script>
</html>