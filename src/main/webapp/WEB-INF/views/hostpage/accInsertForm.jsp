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
  <title>숙소 등록</title>
</head>
<body>

<!-- second start -->
	<form class="border p-3 bg-light" id="second" method="post" action="insertAcc" enctype="multipart/form-data">
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
						<input type="text" class="form-control" id="accAddress" name="address" />
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

</body>
<script type="text/javascript">

	
</script>
</html>