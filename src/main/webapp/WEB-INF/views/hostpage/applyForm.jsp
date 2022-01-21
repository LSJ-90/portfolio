<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<meta charset="UTF-8">
<title>호스트 신청</title>
</head>
<div class="container ">
	<div class="row mb-3 ">
		<div class="col text-center">
			<h1>호스트 등록하기</h1>
		</div>
	</div>
	<div class="row mb-3 d-flex justify-content-center">
		<div class="col-6 text-center">
			<form class="border p-3 bg-light" id="applyForm" method="post" action="/host/req">
				<div class="mb-3">
					<label class="form-label">등록 유형 선택</label>
				</div>
				<div class="mb-3">
					<input id="applyType" type="checkbox" checked data-toggle="toggle" data-on="숙박" data-off="체험" data-onstyle="success" data-offstyle="warning">
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
					<input type="text" class="form-control" id="accName" name="" />
				</div>
				<div class="mb-3">
					<label class="form-label">은행 선택</label>
						<select class="form-control" id="bankName" name="">
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
					<input type="text" class="form-control" id="hostAcc" name="" />
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
					<button class="btn btn-primary" id="applyBtn" type="submit">계속 진행</button>
				</div>					
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(function(){
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
			
			var applyType = $("#applyType").prop('checked');
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
				$('#applyForm').submit();
			}
		});
	});
</script>
</html>