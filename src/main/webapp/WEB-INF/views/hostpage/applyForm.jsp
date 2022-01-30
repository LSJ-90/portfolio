<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <meta charset="UTF-8">
  <title>호스트 신청</title>
</head>
<body>

	<form class="border p-3 bg-light" id="hostApply" method="post" action="insertHostApply" enctype="multipart/form-data">
	
<!-- first start -->
		<div class="container" id="first">
			<div class="row mb-3 ">
				<div class="col text-center">
					<h1>호스트 등록하기</h1>
				</div>
			</div>
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-6 text-center">
					<div class="mb-3">
						<label class="form-label">등록 유형 선택</label>
					</div>
					<a href="#">
       					<img onclick="first()" src="../../resources/images/apply/host_apply_acc.jpg" id="img1"/>
       				</a>
       				<a href="#">
       					<img onclick="second()" src="../../resources/images/apply/host_apply_act.jpg" id="img2"/>
       				</a>
					<div class="mb-3">
					<!--
						<input id="applyTypeCheck" type="checkbox" checked data-toggle="toggle" data-on="숙박" data-off="체험" data-onstyle="success" data-offstyle="warning">
						  -->
						<input type="hidden" name="hostingType" id="applyType" value="">
					</div>
					<div class="mb-3">
						<label class="form-label">호스트 이름 입력</label>
						<input type="text" class="form-control" id="hostName" name="hostName" />
					</div>
					<div class="mb-3">
						<label class="form-label">호스트 전화번호 입력</label>
						<input type="text" class="form-control" id="hostTel" name="tel" />
					</div>
					<div class="mb-3">
						<label class="form-label">예금주 입력</label>
						<input type="text" class="form-control" id="accName" name="accountHolderName" />
					</div>
					<div class="mb-3">
						<label class="form-label">은행 선택</label>
							<select class="form-control" id="bankName" name="bankName">
								<option value="농협">농협</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="대구은행">대구은행</option>
								<option value="부산은행">부산은행</option>
								<option value="우체국">우체국</option>
								<option value="SC제일은행">SC제일은행</option>
								<option value="광주은행">광주은행</option>
								<option value="경남은행">경남은행</option>
								<option value="수협">수협</option>
								<option value="케이뱅크">케이뱅크</option>
							</select>
					</div>
					<div class="mb-3">
						<label class="form-label">계좌번호 입력</label>
						<input type="text" class="form-control" id="hostAcc" name="accountNumber" />
					</div>
					<div class="mb-3 text-center">
						<button class="btn btn-danger" type="button">계좌 확인</button>
					</div>
					<table class="table" id="table-basket">
			 			<thead>
			 				<tr>
			 					<th><input type="checkbox" id="ck-all"> 사용자 약관 전체 동의</th>
			 				</tr>
			 			</thead>
			 			<tbody>
			 				<tr>
			 					<td>
			 						<div class="container-fluid">
										<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
											<!-- 서비스이용약관 -->
											<div class="panel panel-default">
												<div class="panel-heading" role="tab">
													<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
													<input type="checkbox" id="serve-ck" name="" value="">서비스 이용 약관 동의(필수)
													</a>
												</div>
												<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
													<div class="panel-body">
														개인정보 수집 및 이용 동의
														1. 수집항목: [필수] 이름, 연락처, 이메일주소, 인원정보
														2. 수집 및 이용목적: 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 스테이폴리오 멤버십 및 프로모션, 이벤트 안내
														3. 보관기간: 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
														4. 동의 거부권 등에 대한 고지: 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.
														
														개인정보 제3자 제공 동의
														1. 개인정보를 제공받는 자: 스테이 호스트
														2. 제공하는 개인정보 항목: [필수] 스테이폴리오 아이디, 이름, 연락처, 이메일주소, 인원정보
														3. 개인정보를 제공받는 자의 이용목적: 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존
														4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간: 개인정보 이용목적 달성 시 까지 보존합니다.
														5. 동의 거부권 등에 대한 고지: 정보주체는 개인정보 제공 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.
													</div>
												</div>
											</div>
											<div class="panel panel-default">
												<div class="panel-heading" role="tab">
													<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
													<input type="checkbox" id="mkt-ck" name="" value="">마케팅 정보 수신 동의(선택)
													</a>
												</div>
												<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
													<div class="panel-body">
														이메일, SMS를 통해 스테이폴리오에서 제공되는 이벤트 소식, 스테이 소개 등 다양한 정보 안내를 받을 수 있습니다.
														서비스의 중요 안내사항 및 스테이 예약/취소 관련 정보는 위 수신 여부와 관계없이 발송됩니다.
													</div>
												</div>
											</div>
										</div>
									</div>
			 					</td>
			 				</tr>
			 			</tbody>
		 			</table>
					<div class="mb-3 text-end">
						<button class="btn btn-primary" id="nextBtn">계속 진행</button>
					</div>					
				</div>
			</div>
		</div>
<!-- first end -->
		
<!-- second start -->
		<div class="container" id="second">
			<div class="row mb-3 ">
				<div class="col text-center">
					<h1>숙박 시설 정보 입력</h1>
				</div>
			</div>
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-6 text-center">
					<div class="mb-3">
						<label class="form-label">스테이 유형</label>
						<select class="form-control text-center" id="acctype" name="accType">
							<option value="호텔">호텔</option>
							<option value="게스트하우스">게스트하우스</option>
							<option value="렌탈하우스">렌탈하우스</option>
							<option value="펜션">펜션</option>
							<option value="한옥">한옥</option>
							<option value="캠핑&아웃도어">캠핑&아웃도어</option>
							<option value="호스텔">호스텔</option>
							<option value="리조트">리조트</option>
							<option value="민박">민박</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 이름</label>
						<input type="text" class="form-control" id="accName" name="accName" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 사이트</label>
						<input type="text" class="form-control" id="accWebAddress" name="accWebAddress" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 타이틀</label>
						<input type="text" class="form-control" id="accIntroTitle" name="accIntroTitle" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 소개글</label>
						<textarea rows="15" cols="76" id="accIntroContent" name="accIntroContent"></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">메인 사진 첨부</label>
						<input type="file" class="form-control" name="hostMainImage" />
					</div>
					<div class="mb-3">
						<label class="form-label">사진 첨부</label>
						<input type="file" class="form-control" name="accImages" />
						<input type="file" class="form-control" name="accImages" />
						<input type="file" class="form-control" name="accImages" />
						<input type="file" class="form-control" name="accImages" />
						<input type="file" class="form-control" name="accImages" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 주소</label>
						<input type="text" class="form-control" id="accAddress" name="accAddress" />
					</div>
					<div class="mb-3">
						<label class="form-label">체크인 시간</label>
						<input type="text" class="form-control" id="accCheckInTime" name="accCheckInTime" />
					</div>
					<div class="mb-3">
						<label class="form-label">체크아웃 시간</label>
						<input type="text" class="form-control" id="accCheckOutime" name="accCheckOutime" />
					</div>
					<div class="mb-3">
						<button class="btn btn-primary" id="accInsertBtn" type="submit">등록 신청</button>
					</div>					
				</div>
			</div>
		</div>
<!-- second end -->
		
<!-- third start -->
		<div class="container" id="third">
			<div class="row mb-3 ">
				<div class="col text-center">
					<h1>체험 활동 정보 입력</h1>
				</div>
			</div>
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-6 text-center">
					<div class="mb-3">
						<label class="form-label">체험 활동 이름</label>
						<input type="text" class="form-control" id="actName" name="actName" />
					</div>
					<div class="mb-3">
						<label class="form-label">체험 활동 타이틀</label>
						<input type="text" class="form-control" id="actIntroTitle" name="actIntroTitle"/>
					</div>
					<div class="mb-3">
						<label class="form-label">체험 활동 소개글</label>
						<textarea rows="15" cols="76" id="actIntroContent" name="actIntroContent"></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">최대 인원</label>
						<input type="text" class="form-control" id="actMaximumNumber" name="actMaximumNumber" />
					</div>
					<div class="mb-3">
						<label class="form-label">1인당 가격</label>
						<input type="text" class="form-control" id="actPricePerPerson" name="actPricePerPerson" />
					</div>
					<div class="mb-3">
						<label class="form-label">메인 사진 첨부</label>
						<input type="file" class="form-control" name="hostMainImage" />
					</div>
					<div class="mb-3">
						<label class="form-label">사진 첨부</label>
						<input type="file" class="form-control" name="actImages" />
						<input type="file" class="form-control" name="actImages" />
						<input type="file" class="form-control" name="actImages" />
						<input type="file" class="form-control" name="actImages" />
						<input type="file" class="form-control" name="actImages" />
					</div>
					<div class="mb-3">
						<label class="form-label">체험 활동 주소</label>
						<input type="text" class="form-control" id="actAddress" name="actAddress" />
					</div>
					<div class="mb-3">
						<button class="btn btn-primary" id="actInsertBtn" type="submit">등록 신청</button>
					</div>					
				</div>
			</div>
		</div>
<!-- third end -->

	</form>
</body>
<script type="text/javascript">

function first() {
	$("#applyType").val(1)
}
function second() {
	$("#applyType").val(2)
}
$("#img1").click(function() {
	$("#img1").css({"width":"170"});
	$("#img2").css({"width":"90"});
})
$("#img2").click(function(b) {
	$("#img2").css({"width":"170"});
	$("#img1").css({"width":"90"});
})


$(function(){
	$('#second').hide();
	$('#third').hide();
	
	$('#ck-all').on('click', function(e){
		var bool = $(this).prop('checked');
		$('#serve-ck').prop('checked', bool);
		$('#mkt-ck').prop('checked', bool);
	});
	
	$('#serve-ck').on('click', function(e){
		e.stopPropagation();
	});
	
	$('#mkt-ck').on('click', function(e){
		e.stopPropagation();
	});
	
	$('#nextBtn').on('click', function(e){
		e.preventDefault();
		e.stopPropagation();
		
		var hostName = $("#hostName").val();
		if(hostName == ""){
			return alert('호스트 이름을 입력해주세요.');
		}
		
		var hostTel = $("#hostTel").val();
		if(hostTel == ""){
			return alert('호스트 전화번호를 입력해주세요.');
		}
		
		var accName = $("#accName").val();
		if(accName == ""){
			return alert('예금주를 입력해주세요.');
		}
		
		/*
		var applyType = $("#applyTypeCheck").prop('checked');
		if(applyType == true){
			$("#applyType").val(1);
		} else {
			$("#applyType").val(2);
		}
		*/
		
		var hostAcc = $('#hostAcc').val();
		if(hostAcc == ""){
			return alert('계좌번호를 입력해주세요.');
		}
		
		var bool = $('#serve-ck').prop('checked');
		if(bool === false){
			return alert('서비스 이용 약관 동의는 필수체크 항목입니다.');
		} else {
			$('#first').hide();
			if($("#applyType").val() == 1){
				$('#second').show();
			} else {
				$('#third').show();
			}
			
		$('#accInsertBtn').click(function(){
			$("#actName").val(1);
			$("#actIntroTitle").val(1);
			$("#actIntroContent").val(1);
			$("#actMaximumNumber").val(1);
			$("#actPricePerPerson").val(1);
			$("#actAddress").val(1);
			$('#hostApply').submit()
		})
		
		$('#actInsertBtn').click(function(){
			$("#accType").val(1);
			$("#accName").val(1);
			$("#accWebAddress").val(1);
			$("#accIntroTitle").val(1);
			$("#accIntroContent").val(1);
			$("#accAddress").val(1);
			$("#accCheckInTime").val(1);
			$("#accCheckOutime").val(1);
			$('#hostApply').submit()
		})
			
		}
	});
});

		
</script>
</html>