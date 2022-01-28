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


#creatingmodal, #creatingmodimodal {text-decoration: underline;}
</style>
<body>
<div class="container">

<div class="row mb-3 mt-3">
		<div class="col">
			<form id="form-search-userQnA" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="user-qna">
				<input type="hidden" name="page" value="1" />
				<div class="row mb-3 mt-3">
					<div class="col-5">
				<input type="radio" name="answered" value="N" checked>답변 미완료된 질문
				<input type="radio" name="answered" value="Y" ${'Y' eq param.answered ? 'checked' : ''}>답변 완료된 질문
					</div>
					<div class="col-3">
						<ul class="navbar-nav" >
							<li class="nav-item" >
							<select class="form-select" name="opt" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">카테고리</option>
								<option value="정산" ${'정산' eq param.opt ? 'selected' : ''}> 정산</option>
								<option value="호스트승인" ${'호스트승인' eq param.opt ? 'selected' : ''}> 호스트승인</option>
								<option value="호스트정보변경" ${'호스트정보변경' eq param.opt ? 'selected' : ''}> 호스트정보변경</option>
								<option value="호스트탈퇴" ${'호스트탈퇴' eq param.opt ? 'selected' : ''}> 호스트탈퇴</option>
								<option value="게스트신고" ${'게스트신고' eq param.opt ? 'selected' : ''}> 게스트신고</option>
								<option value="불편사항" ${'불편사항' eq param.opt ? 'selected' : ''}> 불편사항</option>
								<option value="기타" ${'기타' eq param.opt ? 'selected' : ''}> 기타</option>
							</select>
							</li>
							<li class="nav-item" >
								<select class="form-select" name="opt" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">호스트등급</option>
								<option value="BRONZE" ${'BRONZE' eq param.opt ? 'selected' : ''}> 브론즈</option>
								<option value="SILVER" ${'SILVER' eq param.opt ? 'selected' : ''}> 실버</option>
								<option value="GOLD" ${'GOLD' eq param.opt ? 'selected' : ''}> 골드</option>
								<option value="PLATINUM" ${'PLATINUM' eq param.opt ? 'selected' : ''}> 플래티넘</option>
								<option value="DIAMOND" ${'DIAMOND' eq param.opt ? 'selected' : ''}> 다이아몬드</option>
							</select>
							</li>	
							<li class="nav-item " >
								<select class="form-select" name="opt" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">승인상태</option>
								<option value="W" ${'W' eq param.opt ? 'selected' : ''}> 승인대기</option>
								<option value="Y" ${'Y' eq param.opt ? 'selected' : ''}> 승인완료</option>
								<option value="N" ${'N' eq param.opt ? 'selected' : ''}> 승인반려</option>
								<option value="D" ${'D' eq param.opt ? 'selected' : ''}> 호스팅종료</option>
								<option value="R" ${'R' eq param.opt ? 'selected' : ''}> 강제종료</option>
							</select>
							</li>	
							<li class="nav-item " >
								<select class="form-select" name="opt">
								<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
								<option value="회원번호" ${'회원번호' eq param.opt ? 'selected' : ''}> 회원번호</option>
								<option value="호스트번호" ${'호스트번호' eq param.opt ? 'selected' : ''}> 호스트번호</option>
								<option value="호스트이름" ${'호스트이름' eq param.opt ? 'selected' : ''}> 호스트이름</option>
								<option value="제목" ${'제목' eq param.opt ? 'selected' : ''}> 제목</option>
								<option value="내용" ${'내용' eq param.opt ? 'selected' : ''}> 내용</option>
							</select>
							</li>	
						</ul>
					</div>
				<div class="col-3">
					<input type="text" class="form-control" name="value" value="${param.value }">
				</div>
				<div class="col-1">
					<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-userQnA">검색</button>
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
					<th style="width: 5%;">아이디</th>
					<th style="width: 7%;">이름</th>
					<th style="width: 7%;">카테고리</th>
					<th style="width: 15%;">제목</th>
					<th style="width: 15%;">내용</th>
					<th style="width: 7%;">질문일</th>
					<th style="width: 10%;">답변</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty userQnaList }">
						<tr>
							<td class="text-center" colspan="6">질문 없음.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="userQna" items="${userQnaList }" varStatus="loop">
							<tr class="text-middle">
								<td>${userQna.questionNo }</td>
								<td>${userQna.userNo }</td>
								<td>${userQna.userId }</td>
								<td>${userQna.userName }</td>
								<td>${userQna.category }</td>
								<td>${userQna.title }</td>
								<td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${userQna.content }</td>
								<td><fmt:formatDate value="${userQna.questionDate }" pattern="yyyy.MM.dd"/></td>
									<c:choose>
									<c:when test="${userQna.answered eq 'N'}">
										<td id="creatingmodal" onclick="creatingModal(${userQna.questionNo })">답변 대기</td>
									</c:when>
									<c:otherwise>
										<td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${userQna.answerContent }
										<br>
										<small id="creatingmodimodal" onclick="creatingModal(${userQna.questionNo })" class="pt-1"> 답변 수정 </small>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
	<c:if test="${pagination.totalRecords gt 0 }">
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<nav>
		  			<ul class="pagination justify-content-center">
		    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="user-qna?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="user-qna?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="user-qna?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    			</li>
		  			</ul>
				</nav>
			</div>
		</div>
	</c:if>		
</div>


<div class="modal fade" id="modal-answering" tabindex="-1" aria-labelledby="문의상세" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">문의 상세</h5>
      			</div>
      			<div class="modal-body">
      				<div class="row mb-2">
						<div class="col">
      				<span>질문일: <strong id="questionDate"></strong></span>
	      				</div>
					</div>
					<div class="row mb-2">
						<div class="col">
      				<table class="table table-detail table-bordered border-dark" >
					<tbody>
						<tr>
							<th style="width: 20%;">no.</th>
							<th style="width: 30&;">회원번호</th>
							<th style="width: 30%;">아이디</th>
							<th style="width: 20%;">이름</th>
						</tr>
						<tr>
							<td id="questionNo"></td>
							<td id="userNo"></td>
							<td id="userId"></td>
							<td id="userName"></td>
						</tr>
					</tbody>
				</table>	
				</div>
					</div>
					<div class="row mb-2">
						<div class="col">
				<table class="table table-detail table-bordered border-dark" >
					<tbody>
						<tr>
							<th style="width: 20%;">카테고리</th>
							<th style="width: 80%;">제목</th>
						</tr>
						<tr>
							<td id="category"></td>
							<td id="title"></td>
						</tr>
					</tbody>
				</table>
				</div>
					</div>
					<div class="row mb-2">
						<div class="col">
							<table class="table table-detail table-bordered border-dark" >
								<tbody>
									<tr>
										<th style="width: 100%;">내용</th>
									</tr>
									<tr>
										<td id="content"></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="row mb-1">
						<div class="col">
      				<span><strong id="modified"></strong></span>
	      				</div>
					</div>
					<form id="answer-form" method="post" action="/admin/answer-insert-user-qna">
					<input type="hidden" name="questionNo" value="">
					<div class="row mb-2">
						<div class="col">
							<table class="table table-detail table-bordered border-dark" >
								<tbody>
									<tr>
										<th style="width: 100%;">답변</th>
									</tr>
									<tr>
									<td><input type="text" class="form-control" name="answerContent" id="answerContent" maxlength="30" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					
					
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" id="answer-btn" data-bs-dismiss="modal"></button>
      			</div>
				</form>
      			</div>
    		</div>
  		</div>
	</div>
	
	

<script type="text/javascript">

function creatingModal(no) {
	
	let answeringModal = new bootstrap.Modal(document.getElementById('modal-answering'), {
		keyboard: false
	
	});
	
	//private String content;
	//private String answered;
	
	//private String answerContent;
	//@JsonFormat(pattern = "yyyy년 M월 d일")
	//private Date answerUpdateDate;
	//private String answerModified; //답변 수정 여부
	
	$.getJSON('/admin/user-qna-answer.do', {no:no}, function(QnaDto) {
	
			$('#questionNo').text(QnaDto.questionNo);
			$("#userNo").text(QnaDto.userNo);
			$("#userName").text(QnaDto.userName);
			$("#userId").text(QnaDto.userId);
			$("#category").text(QnaDto.category);
			$("#title").text(QnaDto.title);
			$("#questionDate").text(QnaDto.questionDate);
			$("#content").text(QnaDto.content);
			$('input[name=questionNo]').attr('value', QnaDto.questionNo);
			
			
			if (QnaDto.answerContent!=null) {				
			$('input[name=answerContent]').attr('value', QnaDto.answerContent);
			$("#answer-btn").text('수정');
			} else {
				$("#answer-btn").text('등록');
			}
			if (QnaDto.answerModified=='Y') {				
				$("#modified").text( '답변수정일: ' + QnaDto.answerUpdateDate);
			}
		
	});

	answeringModal.show();
}


$("#answer-btn").click(function() {
	
//검색옵션값과 입력값을 조회한다.
var questionNo = $(":input[name=questionNo]").val();
var value = $(":input[name=answerContent]").val();

console.log(questionNo);
console.log(value);
		$("#answer-form").trigger("submit");
	
});



// 검색버튼을 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
$("#btn-search-userQnA").click(function() {
	// 검색옵션값과 입력값을 조회한다.
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
	// 검색옵션값과 입력값이 모두 존재하면 페이지번호를 1로 설정하고 폼에서 onsubmit 이벤트를 발생시켜서 폼 입력값이 서버로 제출되게 한다.
	if (opt && value) {
		$(":input[name=page]").val("1");
		$("#form-search-userQnA").trigger("submit");
	} else {
		alert("검색조건 혹은 검색어를 입력하세요");					
	}
	
});

// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
$(".pagination a").click(function(event) {
	event.preventDefault();
	// 클릭한 페이지내비게이션의 페이지번호 조회하기
	var pageNo = $(this).attr("data-page");
	// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
	$(":input[name=page]").val(pageNo);
	
	// 검색폼에 onsubmit 이벤트 발생시키기
	$("#form-search-userQnA").trigger("submit");
})


   $("input:radio[name=answered]").click(function()
    {
	   $("#form-search-userQnA").trigger("submit");
    })




</script>


</body>
</html>