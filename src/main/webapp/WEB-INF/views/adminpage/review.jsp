<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
table {font-size: 10pt; text-align:center;}


</style>
<body>
<div class="container">
<div class="row mb-3 mt-3">
	<div class="col">
		<p>숙소리뷰</p>
	</div>
</div>
<div class="row mb-3 mt-3">
	<div class="col">
		<div class="row mb-3 mt-3">
			<div class="col">
				<form id="form-search-accReview" class="row row-cols-lg-auto g-3 align-items-center">
					<div class="row mb-3 mt-3">
						<div class="col-3">
							<select class="form-select" name="opt1">
								<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
								<option value="회원번호"> 회원번호</option>
								<option value="호스트번호"> 호스트번호</option>
								<option value="시설번호"> 시설번호</option>
								<option value="시설이름"> 시설이름</option>
								<option value="내용"> 내용</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="value1" value="">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-accReview">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col">
		 			<table class="table table-bordered border-dark">
					<thead>
						<tr>
							<th style="width: 5%;">no.</th>
							<th style="width: 7%;">회원번호</th>
							<th style="width: 5%;">숙소번호</th>
							<th style="width: 7%;">숙소이름</th>
							<th style="width: 7%;">청결도</th>
							<th style="width: 7%;">의사소통</th>
							<th style="width: 7%;">정확도</th>
							<th style="width: 7%;">위치</th>
							<th style="width: 15%;">내용</th>
							<th style="width: 7%;">작성일</th>
							<th style="width: 10%;">답변</th>
						</tr>
					</thead>
					<tbody id="dataSection1">
						
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<div class="pagination1">
					<ul id="paginationBox1" class="pagination">
		
					</ul>
				</div>
			</div>
		</div>
		
		
	</div>
</div> <!-- 첫번째 리스트 -->

<div class="row mb-3 mt-3">
	<div class="col">
		<p>체험리뷰</p>
	</div>
</div>

<div class="row mb-3 mt-3">
	<div class="col">
		<div class="row mb-3 mt-3">
			<div class="col">
				<form id="form-search-actReview" class="row row-cols-lg-auto g-3 align-items-center">
					<div class="row mb-3 mt-3">
						<div class="col-3">
							<select class="form-select" name="opt1">
								<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
								<option value="회원번호"> 회원번호</option>
								<option value="호스트번호"> 호스트번호</option>
								<option value="시설번호"> 체험번호</option>
								<option value="시설이름"> 체험이름</option>
								<option value="내용"> 내용</option>
							</select>
						</div>
						<div class="col-3">
							<input type="text" class="form-control" name="value1" value="">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-actReview">검색</button>
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="row mb-3">
			<div class="col">
		 			<table class="table table-bordered border-dark">
					<thead>
						<tr>
							<th style="width: 5%;">no.</th>
							<th style="width: 7%;">회원번호</th>
							<th style="width: 5%;">체험번호</th>
							<th style="width: 7%;">체험이름</th>
							<th style="width: 7%;">별점</th>
							<th style="width: 15%;">내용</th>
							<th style="width: 7%;">작성일</th>
							<th style="width: 10%;">답변</th>
						</tr>
					</thead>
					<tbody id="dataSection2">
						
					</tbody>
				</table>
			</div>
		</div>
	
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<div class="pagination2">
					<ul id="paginationBox2" class="pagination">
		
					</ul>
				</div>
			</div>
		</div>
		
		
	</div>
</div> <!-- 두번째 리스트 -->




</div>

<script type="text/javascript">
$(document).ready(function() {
	getAccPage();
	getActPage();
});

function getAccPage(page) {
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
			$.ajax({
				type: 'POST',
				url : "/admin/getAccList.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					opt : opt,
					value : value
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					const criteria = result['criteria'];
					var data = "";
					var block = "";

					console.log(pagination);
					console.log(list);
					console.log(criteria);
					// 테이블의 row를 삽입하는 부분
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].no + "</td>";
						console.log(list[i].no);
						data += "<td style='cursor:pointer' onclick='showUserDetail("
							+ list[i].userNo + ")'>" + list[i].userNo + "</td>";
						data += "<td style='cursor:pointer' onclick='showAccommoDetail("
							+ list[i].accommoNo + ")'>" + list[i].accommoNo + "</td>";
						data += "<td>" + list[i].accommoName + "</td>";
						data += "<td>" + list[i].cleanlinessStar + "</td>";
						data += "<td>" + list[i].communicationStar + "</td>";
						console.log(list[i].content);
						data += "<td>" + list[i].accuracyStar + "</td>";
						data += "<td>" + list[i].locationStar + "</td>";
						data += "<td>" + list[i].content + "</td>";
						data += "<td>" + list[i].createdDate + "</td>";
						
						if (list[i]['answerContent']!=null) {
						data += "<td>" + list[i].answerContent + "</td>";
						} else {
							data += "<td>답변없음</td>";
						}
						data += "</tr>";
					}
					$("#dataSection1").html(data);

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getAccPage("
								+ (pagination['beginPage'] - 1)
								+ ")'> < </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getAccPage("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getAccPage("
								+ (pagination['endPage'] + 1)
								+ ")'>  > </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
					}
					
					$("#paginationBox1").html(block);
				}
			})
}
function getActPage(page) {
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
			$.ajax({
				type: 'POST',
				url : "/admin/getActList.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					opt : opt,
					value : value
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					const criteria = result['criteria'];
					var data = "";
					var block = "";

					console.log(pagination);
					console.log(list);
					console.log(criteria);
					// 테이블의 row를 삽입하는 부분
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].no + "</td>";
						console.log(list[i].no);
						data += "<td style='cursor:pointer' onclick='showUserDetail("
							+ list[i].userNo + ")'>" + list[i].userNo + "</td>";
						data += "<td style='cursor:pointer' onclick='showAccommoDetail("
							+ list[i].activityNo + ")'>" + list[i].activityNo + "</td>";
						data += "<td>" + list[i].activityName + "</td>";
						data += "<td>" + list[i].star + "</td>";
						data += "<td>" + list[i].content + "</td>";
						data += "<td>" + list[i].createdDate + "</td>";
						
						if (list[i]['answerContent']!=null) {
						data += "<td>" + list[i].answerContent + "</td>";
						} else {
							data += "<td>답변없음</td>";
						}
						data += "</tr>";
					}
					$("#dataSection2").html(data);

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getActPage("
								+ (pagination['beginPage'] - 1)
								+ ")'> < </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getActPage("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getActPage("
								+ (pagination['endPage'] + 1)
								+ ")'>  > </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
					}
					
					$("#paginationBox2").html(block);
				}
			})
}


</script>


</body>
</html>