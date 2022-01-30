<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container ">
	<form id="frm" method="post" action="insert" >
		<input type="hidden" name="roomNo" value="${accommo.roomNo }">
		<input type="hidden" name="no" value="${accommo.no }">
		<input type="hidden" name="taxIncludedPrice" value="">
		<input type="hidden" name="paidPrice" value="">
		<input type="hidden" name="extraPeople" value="">
		<div class="row mb-3">
			<div class="col">
				<div class="d-flex justify-content-between">
					<div>
						<h5>${accommo.accommoName }</h5>
					</div>
   					<div>
   						<div></div>
	   					<input type="date" name="checkInDate" class="form-control" value="<fmt:formatDate value="${checkIn }" pattern="yyyy-MM-dd"/>"/>
	   					<input type="date" name="checkOutDate" class="form-control" value="<fmt:formatDate value="${checkOut }" pattern="yyyy-MM-dd"/>"/>
   					</div>
   					<div>
   						<span id="top-price"></span>원
   					</div>
				</div>
			</div>
		</div>
		<div class="row mb-3 border">
			<div class="col text-center">
				<table class="table">
					<tr>
						<th>예약 스테이</th>
						<td>${accommo.accommoName } / ${accommo.roomName }</td>
					</tr>
					<tr>
						<th>예약일</th>
						<td>
							<span id="span-checkIn"></span>~<span id="span-checkOut"></span> | <span id="span-night"></span>박
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							${user.name }
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>
							${user.tel }
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							${user.email }
						</td>
					</tr>
					<tr>
						<th>인원 (최대 <span id="span-maximum-number">${accommo.maximumNumber }</span>명)</th>
						<td>
							<div class="d-flex justify-content-between">
								<div class="d-flex justify-content-start">
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">성인</span>
										<select id="adult-number" class="form-select form-select-sm" aria-label=".form-select-sm example">
											<c:forEach begin="1" end="${accommo.maximumNumber }" var="number" step="1" varStatus="status">
												<option value="${status.index }" ${status.index eq accommo.standardNumber ? 'selected' : '' } >${status.index } 명</option>
											</c:forEach>
										</select>
									</div>
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">아동</span>
										<select id="child-number" class="form-select form-select-sm" aria-label=".form-select-sm example">
											<c:forEach begin="0" end="${accommo.maximumNumber-1 }" var="number" step="1" varStatus="status">
												<option value="${status.index }" ${status.index eq 0 ? 'selected' : '' } >${status.index } 명</option>
											</c:forEach>
										</select>
									</div>
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">영아</span>
										<select id="infant-number" class="form-select form-select-sm" aria-label=".form-select-sm example">
											<c:forEach begin="0" end="${accommo.maximumNumber-1 }" var="number" step="1" varStatus="status">
												<option value="${status.index }" ${status.index eq 0 ? 'selected' : '' } >${status.index } 명</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div>
									<span>아동: 24개월~12세<br/>영아: 24개월 미만</span>
								</div>
							</div>
							<div id="maximum-error" style="display: none">
								<h5>최대 숙박 인원수를 초과 하실수 없습니다.</h5>
							</div>
						</td>
					</tr>
					<tr>
						<th>이용자 정보</th>
						<td>
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value="realUser" id="flexCheckChecked-real-user" checked> 
								<label class="form-check-label" for="flexCheckChecked">
									예약자 정보와 동일합니다.
								</label>
							</div>
							<div id="real-user-form" style="display: none">
								<table class="table">
									<tr>
										<th>성명</th>
										<td><input type="text" name="roomUserName"></td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td><input type="text" name="roomUserTel"></td>
									</tr>
									<tr id="real-user-error" style="display: none">
										<td>이용자 정보를 입력해주세요.</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<th>요청사항</th>
						<td>
							<div class="form-floating">
	  							<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px"></textarea>
	  							<label for="floatingTextarea2"></label>
							</div>
						</td>
					</tr>
					<tr>
						<th>예상 결제금액</th>
						<td>
							<table class="table" id="total-price">
								<tr id="room-price-surcharge">
									<th>객실 요금</th>
									<td><span id="room-price"></span><span id="room-surcharge"></span></td>
								</tr>
								<tr>
									<th>할인금액</th>
									<td><span id="discount-amount"></span></td>
								</tr>
								<tr>
									<th>포인트 사용(보유 point: <span id="user-point" data-point="${user.pnt }"><fmt:formatNumber value="${user.pnt }" /></span>)</th>
									<td>
										<input name="usedPnt" type="number" value="0" max="${user.pnt }" min="0">
										<div id="point-error" style="display: none">
											<h5>보유 포인트를 초과 하실수 없습니다.</h5>
										</div>
									</td>
								</tr>
							</table>
							<span id="bottom-price" data-total-price=""></span>원
						</td>
					</tr>
					<tr>
						<th>결제방법 선택</th>
						<td>
							<div class="d-flex justify-content-start">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment" value="신용카드" id="flexRadioDefault1">
									<label class="form-check-label" for="flexRadioDefault1">신용카드 결제</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="payment" value="카카오" id="flexRadioDefault2" checked>
									<img alt="kakaopay" src="/resources/images/reservation/payment_icon_yellow_small.png">
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 이용자 약관 동의 -->
			<div>
				<h6>이용자 약관 동의</h6>
				<div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="terms-all" id="flexCheckDefault">
						<label class="form-check-label" for="flexCheckDefault">사용자 약관 전체 동의</label>
					</div>
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="d-flex justify-content-between">
							<div>
								<input class="form-check-input-necessary" type="checkbox" id="terms">
								<label class="form-check-label" for="flexCheckDefault">서비스 이용 약관 동의 (필수)</label>
							</div>
							<div>
								<button class="btn-terms" style="width: 500px;" data-content=1>약관 모두 보기</button>
							</div>
						</div>
						<div id="terms-content-1" style="display: none">
							1. 개인정보를 제공받는 자 : 캉프맨숀<br/>
							2. 제공하는 개인정보 항목 : [필수] 스테이폴리오 아이디, 이름, 연락처, 이메일주소, 인원정보<br/>
							3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존<br/>
							4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시 까지 보존합니다.<br/>
							5. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.<br/>
						</div>
					</div>
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="d-flex justify-content-between">
							<div>
								<input class="form-check-input-necessary" type="checkbox" id="terms">
								<label class="form-check-label" for="flexCheckDefault">개인정보 취급방침 동의 (필수)</label>
							</div>
							<div>
								<button class="btn-terms" style="width: 500px;" data-content=2>약관 모두 보기</button>
							</div>
						</div>
						<div id="terms-content-2" style="display: none">
							1. 개인정보를 제공받는 자 : 캉프맨숀<br/>
							2. 제공하는 개인정보 항목 : [필수] 스테이폴리오 아이디,이름, 연락처, 이메일주소, 인원정보<br/>
							3. 개인정보를 제공받는 자의 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존<br/>
							4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시 까지 보존합니다.<br/>
						</div>
					</div>
					<div class="d-flex flex-column bd-highlight mb-3">
						<div class="d-flex justify-content-between">
							<div>
								<input class="form-check-input-necessary" type="checkbox" id="terms">
								<label class="form-check-label" for="flexCheckDefault">환불규정에 대한 동의(필수)</label>
							</div>
							<div>
								<button class="btn-terms" style="width: 500px;" data-content=3>약관 모두 보기</button>
							</div>
						</div>
						<div id="terms-content-3" style="display: none">
							<div class="row">
								<div class="col-4">
									<h3>예약 안내</h3>
								</div>
								<div class="col-4">
									<ul>
										<li>예약 신청 후 결제 방식에 따라 결제가 완료되면, 예약 완료 및 안내 문자가 송부됩니다.</li>
										<li>해당일에 '예약 신청'이 중복될 경우 입금 순서가 아닌, 신청 순서로 예약 확정이 처리됩니다.</li>
										<li>예약 신청이 불가한 고객은 연락 후 환불 처리해드립니다.</li>
										<li>캉프맨숀의 정확한 주소는 예약 확정 후 안내 드립니다.</li>
										<li>사전에 협의되지 않은 상업 목적의 사진/영상 촬영(광고, 쇼핑몰, SNS 마켓 등)은 불가합니다.</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-4">
									<h3>환불규정</h3>
								</div>
								<div class="col-4">
									<ul>
										<li>환불 시 아래의 기준일에 따른 환불 금액을 드립니다.</li>
									</ul>
									<table>
										<tr>
											<td>이용 10일전까지</td>
											<td>총 결제금액의 100% 환불</td>
										</tr>
										<tr>
											<td>이용 9일전까지</td>
											<td>총 결제금액의 90% 환불</td>
										</tr>
										<tr>
											<td>이용 8일전까지</td>
											<td>총 결제금액의 80% 환불</td>
										</tr>
										<tr>
											<td>이용 7일전까지</td>
											<td>총 결제금액의 70% 환불</td>
										</tr>
										<tr>
											<td>이용 6일전까지</td>
											<td>총 결제금액의 60% 환불</td>
										</tr>
										<tr>
											<td>이용 5일전까지</td>
											<td>총 결제금액의 50% 환불</td>
										</tr>
										<tr>
											<td>이용 4일전까지</td>
											<td>총 결제금액의 40% 환불</td>
										</tr>
										<tr>
											<td>이용 3일전까지</td>
											<td>변경 / 환불 불가</td>
										</tr>
									</table>
									<ul>
										<li>예약의 확정은 위 사항을 모두 숙지하였고 모든 사항에 동의함을 의미합니다.</li>
										<li>자세한 문의사항은 캉프맨숀(0504-0904-2531)으로 연락주시기 바랍니다.</li>
									</ul>
								</div>
							</div>
							<div class="row">
								<div class="col-4">
									<h3>취소 안내</h3>
								</div>
								<div class="col-4">
									<ul>
										<li>비회원이신 경우, 스테이폴리오 사이트 로그인 페이지 '비회원 예약조회'(예약번호/연락처 입력필수)를 통해 예약내역 확인 후 [예약취소] 버튼을 눌러 신청해주시기 바랍니다.
										https://www.stayfolio.com/nonmember</li>
										<li>예약번호는 예약안내 문자를 통해 확인 가능합니다. 확인이 어려우신 경우 스테이폴리오 챗봇을 통해 예약번호를 문의해주시기 바랍니다.</li>
										<li>회원이신 경우, 스테이폴리오 - ACCOUNT - 마이 페이지 - 예약 정보 - [취소 요청] 버튼을 눌러주시기 바랍니다.</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="d-flex flex-column bd-highlight mb-3">
							<div class="d-flex justify-content-between">
								<div>
									<input class="form-check-input" type="checkbox" id="terms">
									<label class="form-check-label" for="flexCheckDefault">마케팅 정보 수신 동의 (선택)</label>
								</div>
								<div>
									<button class="btn-terms" style="width: 500px;" data-content=4>약관 모두 보기</button>
								</div>
							</div>
							<div id="terms-content-4" style="display: none">
								1. 개인정보를 제공받는 자 : ${accommo.accommoName }</br>
								2. 제공하는 개인정보 항목 : [필수] 스테이폴리오 아이디,이름, 연락처, 이메일주소, 인원정보
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<button id="payment" type="submit" class="btn btn-dark">결제하기</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
$(function() {
	window.onload = function () {
		updateForm();
	}
	// 날짜 변경시 실행
	$(":input[name=checkInDate], :input[name=checkOutDate]").change(function() {
		updateForm();
	});
	
	// 인원수 제한 기능
	setTimeout("window.self.focus();", 1000 );
	var adult, child, infant;
		
	$("#adult-number").focus(function(){
		adult = parseInt($(this).val());
	}).change(function(){
		setNumber("adult", adult);
		updateForm();
	});
	$("#child-number").focus(function(){
		child = parseInt($(this).val());
	}).change(function(){
		setNumber("child", child);
		updateForm();
	});
	$("#infant-number").focus(function(){
		infant = parseInt($(this).val());
	}).change(function(){
		setNumber("infant", infant);
		updateForm();
	});
	
	// 이용자 정보 다를 경우
	$("#flexCheckChecked-real-user").change(function() {
		if ($("input:checkbox[id='flexCheckChecked-real-user']").is(":checked") == true){
			$("#real-user-form").hide();
		} else {
			$("#real-user-form").show();
		}
	});
	
    //yyyy-mm-dd 포맷 날짜 생성
	function dateFormat() {
	    var d = new Date();
	    return d.getFullYear() + "-" + ((d.getMonth() + 1) > 9 ? (d.getMonth() + 1).toString() : "0" + (d.getMonth() + 1)) + "-" + (d.getDate() > 9 ? d.getDate().toString() : "0" + d.getDate().toString());
	}
    
    function updateForm() {
    	// price를 위한 date
    	var checkIn = $(":input[name=checkInDate]").val().replace(/-/g, '');
		var checkOut = $(":input[name=checkOutDate]").val().replace(/-/g, '');
		var number = parseInt($("#adult-number option:selected").val()) + parseInt($("#child-number option:selected").val()) + parseInt($("#infant-number option:selected").val())
		var roomNo = $(":input[name=roomNo]").val();
		var point = $("input[name=usedPnt]").val();
		
		$.getJSON("/getPrice",
				{checkIn: checkIn, checkOut: checkOut, roomNo: roomNo, number: number, point: point},
				function(priceDto) {
			$("#top-price, #bottom-price").text("￦"+priceDto.totalPrice.toLocaleString());
			$("#bottom-price").attr("data-total-price", priceDto.totalPrice);
			$("#room-price").text("￦" + priceDto.roomPrice.toLocaleString());
			$("input[name=taxIncludedPrice]").val(priceDto.totalPrice+priceDto.usePoint);
			$("input[name=paidPrice]").val(priceDto.totalPrice);
			$("input[name=extraPeople]").val(priceDto.extraPeople);
			console.log(priceDto.surcharge);
			if (priceDto.surcharge > 0) {
				$("#room-surcharge").text("(+ ￦" + priceDto.surcharge.toLocaleString() + ")");
			} else {
				$("#room-surcharge").empty();
			}
			if (priceDto.discountAmount > 0) {
				$("#discount-amount").text("-￦" + priceDto.discountAmount.toLocaleString() + "");
			} else {
				$("#discount-amount").empty();
			}
			
		})
		// 예약일을 상단 날짜에서 가져오기
		$("#span-checkIn").text($(":input[name=checkInDate]").val());
		$("#span-checkOut").text($(":input[name=checkOutDate]").val());
		const date1 = new Date(Date.parse($(":input[name=checkInDate]").val()));
		const date2 = new Date(Date.parse($(":input[name=checkOutDate]").val()));
		const night = (date2.getTime() - date1.getTime()) / 1000 / 60 / 60 / 24; 
		$("#span-night").text(night);
    }
    
    // 인원수 select 실행 취소
    function setNumber(idAge, age) {
		var number = parseInt($("#adult-number option:selected").val()) + parseInt($("#child-number option:selected").val()) + parseInt($("#infant-number option:selected").val());
		if (number > $("#span-maximum-number").text()) {
			$("#maximum-error").show();
			/*  focus를 가진 상태에서 여러번 값을 바꿀 때를 방지 */
			$('#'+idAge+'-number').trigger("blur");
			$('#'+idAge+'-number').val(age).prop("selected", true);
		} else {
			$("#maximum-error").hide();
		}
	}
    
    // 전체 동의
    $("#terms-all").click(function() {
		if($("#terms-all").is(":checked")) $("input[id=terms]").prop("checked", true);
		else $("input[id=terms]").prop("checked", false);
	});
	
    // 전체 동의 해제
	$("input[id=terms]").click(function() {
		var total = $("input[id=terms]").length;
		var checked = $("input[id=terms]:checked").length;
		
		if(total != checked) $("#terms-all").prop("checked", false);
		else $("#terms-all").prop("checked", true); 
	});
	
    // 약관 표시
	$(".btn-terms").click(function(event) {
		event.preventDefault();
		var contentNo = $(this).attr("data-content");
		if ($("#terms-content-" + contentNo).is(':visible')){
			$("#terms-content-" + contentNo).hide();
		} else {
			$("#terms-content-" + contentNo).show();
		}
	});
    
    // 결제하기
	$("#payment").click(function(event) {
		event.preventDefault();
		var frm = $("#frm");
		if ($("input:checkbox[id='flexCheckChecked-real-user']").is(":checked") == false &&
			($("input[name=roomUserName]").val() == '' || $("input[name=roomUserTel]").val() == '')) {
				$("#real-user-error").show();
		} else {
			$("#real-user-error").hide();
			if ($("input[class=form-check-input-necessary]:checked").length!=3) {
				alert("동의사항을 모두 확인해 주세요.");
			} else {
				/* if ($("input[name=payment]").val()=="카카오") {
					$("#payment").click(function(event) {
				    	var checkIn = $(":input[name=checkInDate]").val().replace(/-/g, '');
						var checkOut = $(":input[name=checkOutDate]").val().replace(/-/g, '');
				    	var price = parseInt($("#bottom-price").attr("data-total-price"));
				    	var roomNo = $(":input[name=roomNo]").val();
				    	var no = $(":input[name=no]").val();
				   		$.ajax({
				   			url:'/kakaopay',
				  			dataType: 'json',
				  			data: {price: price, checkIn: checkIn, checkOut: checkOut, roomNo: roomNo, no: no},
				   			success:function(data) {
				   				console.log(data.tid);
				   				var box = data.next_redirect_pc_url;
				   				window.open(box);
				   			},
				   			error:function(error) {
				   				alert(error);
				   			}
				   		})
				    });
				} */
				frm.submit();
			}
		}
	});
    
    
    // 카카오페이
    /* $("#payment").click(function(event) {
    	var checkIn = $(":input[name=checkInDate]").val().replace(/-/g, '');
		var checkOut = $(":input[name=checkOutDate]").val().replace(/-/g, '');
    	var price = parseInt($("#bottom-price").attr("data-total-price"));
    	var roomNo = $(":input[name=roomNo]").val();
    	var no = $(":input[name=no]").val();
   		$.ajax({
   			url:'/kakaopay',
  			dataType: 'json',
  			data: {price: price, checkIn: checkIn, checkOut: checkOut, roomNo: roomNo, no: no},
   			success:function(data) {
   				console.log(data.tid);
   				var box = data.next_redirect_pc_url;
   				window.open(box);
   			},
   			error:function(error) {
   				alert(error);
   			}
   		})
    }); */
    
    // 포인트 사용
    $("input[name=usedPnt]").change(function() {
    	var point = parseInt($("#user-point").attr("data-point"));
    	if (point < parseInt($(this).val())){
    		$("#point-error").show();
			$(this).val(point);
			updateForm();
		} else {
			$("#point-error").hide();
			updateForm();
		}
    });
});
	
</script>
</body>
</html>