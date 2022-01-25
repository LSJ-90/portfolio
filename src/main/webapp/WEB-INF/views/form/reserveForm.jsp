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
	<div class="row mb-3 ">
		<div class="col text-center">
			<form action="">
				<table class="table">
					<tr>
						<th>예약 스테이</th>
						<td>${accommo.accommoName } / ${accommo.roomName }</td>
					</tr>
					<tr>
						<th>예약일</th>
						<td>
							<fmt:formatDate value="${checkIn }" pattern="yyyy-MM-dd"/>~<fmt:formatDate value="${checkOut }" pattern="yyyy-MM-dd"/> | 
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>
							
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td>
						
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
						
						</td>
					</tr>
					<tr>
						<th>인원 (최대 ${accommo.maximumNumber }명)</th>
						<td>
							<div class="d-flex justify-content-between">
								<div class="d-flex justify-content-start">
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">성인</span>
										<select class="form-select form-select-sm" aria-label=".form-select-sm example">
											<c:forEach begin="1" end="${accommo.maximumNumber }" var="number" step="1" varStatus="status">
												<option value="${status.index }" ${status.index eq accommo.standardNumber ? 'selected' : '' } >${status.index } 명</option>
											</c:forEach>
										</select>
									</div>
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">아동</span>
										<select class="form-select form-select-sm" aria-label=".form-select-sm example">
											<c:forEach begin="0" end="${accommo.maximumNumber-1 }" var="number" step="1" varStatus="status">
												<option value="${status.index }" ${status.index eq 0 ? 'selected' : '' } >${status.index } 명</option>
											</c:forEach>
										</select>
									</div>
									<div class="d-flex justify-content-start">
										<span style="width: 50px; padding-right: 2px">영아</span>
										<select class="form-select form-select-sm" aria-label=".form-select-sm example">
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
						</td>
					</tr>
					<tr>
						<th>이용자 정보</th>
						<td>
							<div class="form-check real-user">
								<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked> 
								<label class="form-check-label" for="flexCheckChecked">
									예약자 정보와 동일합니다.
								</label>
							</div>
							<div id="real-user">
								<table class="table">
									<tr>
										<th>성명</th>
										<td><input type="text"></td>
									</tr>
									<tr>
										<th>휴대폰 번호</th>
										<td><input type="text"></td>
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
							<table class="table">
								<tr>
									<th>객실 요금</th>
									<td>520,000</td>
								</tr>
								<tr>
									<th>할인금액</th>
									<td>-20,000</td>
								</tr>
							</table>
							<h1>500,000</h1>
						</td>
					</tr>
					<tr>
						<th>결제방법 선택</th>
						<td>
							<div class="d-flex justify-content-start">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
									<label class="form-check-label" for="flexRadioDefault1">신용카드 결제</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
									<label class="form-check-label" for="flexRadioDefault2">카카오페이</label>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<!-- 이용자 약관 동의 -->
		<div>
			<h6>이용자 약관 동의</h6>
			<div>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
					<label class="form-check-label" for="flexCheckDefault">사용자 약관 전체 동의</label>
				</div>
				<div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

</script>
</body>
</html>