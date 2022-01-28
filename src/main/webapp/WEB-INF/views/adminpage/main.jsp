<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 
	 <style type="text/css">
	 
	 .today-list-box {height:250px; background: white; padding: 20px 20px; border: 1px solid #000;}
	 .todo-list-box {height:400px; background: white; padding: 20px 20px; border: 1px solid #000;}
	 .count {font-size: 22px; color: red;}
	 
	 </style>
	 
	 
</head>
<body>
<div class="container">
<div class="row mb-3">
		<div class="col-8">
		<div class="row mb-3">
		<div class="col-3 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						회원 활동
					</div>
					<div class="col-12">
						신규 회원
	                    <span class="count" id="todayJoinMember">0</span>
						명
					</div>
					<div class="col-12">
						회원 탈퇴
	                    <span class="count" id="todayJoinMember">0</span>
						명
					</div>
					<div class="col-12">
						숙소 리뷰
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						체험 리뷰
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				</div>
			</div>
		</div>
		<div class="col-3 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						결제 내역
					</div>
					<div class="col-12">
						신규 결제
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						결제 취소
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>
		<div class="col-3 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						승인 대기 
					</div>
					<div class="col-12">
						숙소 등록
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						체험 등록
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
					<div class="col-12">
						프로모션 등록
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>
		<div class="col-3 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						답변 미완료 문의 
					</div>
					<div class="col-12">
						회원 문의
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						호스트 문의
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>
		
		
		
		<div class="col-2 mt-1">
			<div class="withdrawal-box">
				<div class="row">
					<div class="col-12">
						출금신청
						<span class="count" id="todayOrder">0</span>
						건
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		<div class="col-5 mt-1">ee</div>
	</div>
		
		
		</div>
		<div class="col-4 mt-1">
			<div class="todo-list-box">
				<div class="row">
					<div class="col-12">
						<span class="count" id="todayOrder">todo-list</span>
						
					</div>
				</div>
			</div>
		</div>
		
	</div><!-- 첫번째 단 -->

	
	


</div> <!-- container -->
</body>
</html>