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

<!-- first start -->
	<form class="border p-3 bg-light" id="first" method="post" action="insertHostApply" enctype="multipart/form-data">
		<div class="container">
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
					<div class="mb-3">
						<input id="applyTypeCheck" type="checkbox" checked data-toggle="toggle" data-on="숙박" data-off="체험" data-onstyle="success" data-offstyle="warning">
						<input type="hidden" name="hostingType" id="applyType">
					</div>
					<div class="mb-3">
						<label class="form-label">호스트 이름 입력</label>
						<input type="text" class="form-control" id="hostName" name="name" />
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
														서비스 이용 약관 입니다.
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
														마케팅 정보 수신 약관입니다.
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
						<button class="btn btn-primary" id="applyBtn">계속 진행</button>
					</div>					
				</div>
			</div>
		</div>
	</form>
<!-- first end -->
		
<!-- second start -->
	<form class="border p-3 bg-light" id="second" method="post" action="insertAcc" enctype="multipart/form-data">
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
	<input type="hidden" name="" value="" />
		<div class="container">
			<div class="row mb-3 ">
				<div class="col text-center">
					<h1>숙박 시설 정보 입력</h1>
				</div>
			</div>
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-6 text-center">
					<div class="mb-3">
						<label class="form-label">스테이 유형</label>
						<select class="form-control text-center" id="type" name="type">
							<option value="호텔">호텔</option>
							<option value="게스트하우스">게스트하우스</option>
							<option value="렌탈하우스">렌탈하우스</option>
							<option value="펜션">펜션</option>
							<option value="한옥">한옥</option>
							<option value="캠핑&아웃도어">캠핑&아웃도어</option>
							<option value="호스텔">호스텔</option>
							<option value="리조트">리조트</option>
							<option value="민박">민박</option>
							<option value="호텔">호텔</option>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 이름</label>
						<input type="text" class="form-control" id="accName" name="name" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 사이트</label>
						<input type="text" class="form-control" id="accWebAddress" name="webAddress" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 타이틀</label>
						<input type="text" class="form-control" id="accTitle" name="introTitle" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 소개글</label>
						<textarea rows="15" cols="76" name="introContent"></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">사진 첨부</label>
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 주소</label>
						<input type="text" class="form-control" id="accAdress" name="adress" />
					</div>
					<div class="mb-3">
						<label class="form-label">체크인 시간</label>
						<input type="text" class="form-control" id="checkInTime" name="checkInTime" />
					</div>
					<div class="mb-3">
						<label class="form-label">체크아웃 시간</label>
						<input type="text" class="form-control" id="checkOutime" name="checkOutime" />
					</div>
					<div class="mb-3">
						<button class="btn btn-primary" id="accInsertBtn" type="submit">등록 신청</button>
					</div>					
				</div>
			</div>
		</div>
	</form>
<!-- second end -->
		
<!-- third start -->
	<form class="border p-3 bg-light" id="third" method="post" action="insertAct" enctype="multipart/form-data">
		<div class="container">
			<div class="row mb-3 ">
				<div class="col text-center">
					<h1>체험 활동 정보 입력</h1>
				</div>
			</div>
			<div class="row mb-3 d-flex justify-content-center">
				<div class="col-6 text-center">
					<div class="mb-3">
						<label class="form-label">체험 활동 이름</label>
						<input type="text" class="form-control" id="hostName" name="name" />
					</div>
					<div class="mb-3">
						<label class="form-label">체험 활동 타이틀</label>
						<input type="text" class="form-control" id="actTitle" name="introTitle"/>
					</div>
					<div class="mb-3">
						<label class="form-label">숙박 시설 소개글</label>
						<textarea rows="15" cols="76" name="introContent"></textarea>
					</div>
					<div class="mb-3">
						<label class="form-label">최대 인원</label>
						<input type="text" class="form-control" id="maximumNumber" name="maximumNumber" />
					</div>
					<div class="mb-3">
						<label class="form-label">1인당 가격</label>
						<input type="text" class="form-control" id="pricePerPerson" name="pricePerPerson" />
					</div>
					<div class="mb-3">
						<label class="form-label">사진 첨부</label>
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
						<input type="file" class="form-control" name="image" />
					</div>
					<div class="mb-3">
						<label class="form-label">체험 활동 주소</label>
						<input type="text" class="form-control" id="actAdress" name="adress" />
					</div>
					<div class="mb-3">
						<button class="btn btn-primary" id="actInsertBtn" type="submit">등록 신청</button>
					</div>					
				</div>
			</div>
		</div>
	</form>
<!-- third end -->

</body>
<script type="text/javascript">
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
		
		$('#applyBtn').on('click', function(e){
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
			
			var applyType = $("#applyTypeCheck").prop('checked');
			if(applyType == true){
				$("#applyType").val(1);
			} else {
				$("#applyType").val(2);
			}
			
			var hostAcc = $('#hostAcc').val();
			if(hostAcc == ""){
				return alert('계좌번호를 입력해주세요.');
			}
			
			var bool = $('#serve-ck').prop('checked');
			if(bool === false){
				return alert('서비스 이용 약관 동의는 필수체크 항목입니다.');
			} else {
				//$('#first').hide();
				//if($("#applyType").val() == 1){
				//	$('#second').show();
				//} else {
				//	$('#third').show();
				//}
				
				
				$('#first').submit();
				
			}
		});
	});
</script>
</html>