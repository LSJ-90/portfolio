<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!-- 
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 -->	 
<style>
table {font-size: 10pt; text-align:center;}


#creatingmodal, #creatingmodimodal {text-decoration: underline;}
</style>
<body>

<c:set var="subnav" value="회원관리"></c:set>
<c:set var="tab" value="호스트문의"></c:set>

<div class="container">

<div class="row mb-3 mt-3">
		<div class="col">
			<form id="form-search-hostQnA" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="host-qna">
				<input type="hidden" name="page" value="1" />
				<div class="row mb-3 mt-3">
					<div class="col-5">
				<input type="radio" name="answered" value="N" checked>답변 미완료된 질문
				<input type="radio" name="answered" value="Y" ${'Y' eq param.answered ? 'checked' : ''}>답변 완료된 질문
					</div>
					<div class="col-3">
						<ul class="navbar-nav" >
							<li class="nav-item" >
							<select class="form-select" name="category" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">카테고리</option>
								<option value="정산" ${'정산' eq param.category ? 'selected' : ''}> 정산</option>
								<option value="호스트승인" ${'호스트승인' eq param.category ? 'selected' : ''}> 호스트승인</option>
								<option value="호스트정보변경" ${'호스트정보변경' eq param.opt ? 'selected' : ''}> 호스트정보변경</option>
								<option value="호스트탈퇴" ${'호스트탈퇴' eq param.category ? 'selected' : ''}> 호스트탈퇴</option>
								<option value="게스트신고" ${'게스트신고' eq param.category ? 'selected' : ''}> 게스트신고</option>
								<option value="불편사항" ${'불편사항' eq param.category ? 'selected' : ''}> 불편사항</option>
								<option value="기타" ${'기타' eq param.category ? 'selected' : ''}> 기타</option>
							</select>
							</li>
							<li class="nav-item" >
								<select class="form-select" name="grade" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">호스트등급</option>
								<option value="BRONZE" ${'BRONZE' eq param.grade ? 'selected' : ''}> 브론즈</option>
								<option value="SILVER" ${'SILVER' eq param.grade ? 'selected' : ''}> 실버</option>
								<option value="GOLD" ${'GOLD' eq param.grade ? 'selected' : ''}> 골드</option>
								<option value="PLATINUM" ${'PLATINUM' eq param.grade ? 'selected' : ''}> 플래티넘</option>
								<option value="DIAMOND" ${'DIAMOND' eq param.grade ? 'selected' : ''}> 다이아몬드</option>
							</select>
							</li>	
							<li class="nav-item " >
								<select class="form-select" name="approval" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">승인상태</option>
								<option value="W" ${'W' eq param.approval ? 'selected' : ''}> 승인대기</option>
								<option value="Y" ${'Y' eq param.approval ? 'selected' : ''}> 승인완료</option>
								<option value="N" ${'N' eq param.approval ? 'selected' : ''}> 승인반려</option>
								<option value="D" ${'D' eq param.approval ? 'selected' : ''}> 호스팅종료</option>
								<option value="R" ${'R' eq param.approval ? 'selected' : ''}> 강제종료</option>
							</select>
							</li>	
							<li class="nav-item " >
								<select class="form-select" name="hostType" onchange="searchQnAs()">
								<option value="" selected disabled="disabled">호스트타입</option>
								<option value="1" ${1 eq param.hostType ? 'selected' : ''}> 숙소</option>
								<option value="2" ${2 eq param.hostType ? 'selected' : ''}> 체험</option>
							</select>
							</li>	
						</ul>
					</div>
				<div class="col-3">
						<select class="form-select" name="opt">
								<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
								<option value="회원번호" ${'회원번호' eq param.opt ? 'selected' : ''}> 회원번호</option>
								<option value="호스트번호" ${'호스트번호' eq param.opt ? 'selected' : ''}> 호스트번호</option>
								<option value="호스트이름" ${'호스트이름' eq param.opt ? 'selected' : ''}> 호스트이름</option>
								<option value="제목" ${'제목' eq param.opt ? 'selected' : ''}> 제목</option>
								<option value="내용" ${'내용' eq param.opt ? 'selected' : ''}> 내용</option>
						</select>
					<input type="text" class="form-control" name="value" value="${param.value }">
				</div>
				<div class="col-1">
					<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-hostQnA">검색</button>
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
					<th style="width: 5%;">회원번호</th>
					<th style="width: 10%;">호스트번호</th>
					<th style="width: 15%;">호스트이름</th>
					<th style="width: 10%;">호스트타입</th>
					<th style="width: 5%;">승인상태</th>
					<th style="width: 5%;">카테고리</th>
					<th style="width: 15%;">제목</th>
					<th style="width: 15%;">내용</th>
					<th style="width: 7%;">질문일</th>
					<th style="width: 15%;">답변</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty hostQnaList }">
						<tr>
							<td class="text-center" colspan="6">질문 없음.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="hostQna" items="${hostQnaList }" varStatus="loop">
							<tr class="text-middle">
								<td>${hostQna.questionNo }</td>
								<td>${hostQna.userNo }</td>
								<td>${hostQna.hostNo }</td>
								<td>${hostQna.hostName }</td>
								<c:choose>
									<c:when test="${hostQna.hostType eq '1'}">
										<td>숙소</td>
									</c:when>
									<c:otherwise>
										<td>체험</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${hostQna.hostStatus eq 'W'}">
										<td>승인대기</td>
									</c:when>
									<c:when test="${hostQna.hostStatus eq 'Y'}">
										<td>승인완료</td>
									</c:when>
									<c:when test="${hostQna.hostStatus eq 'N'}">
										<td>승인반려</td>
									</c:when>
									<c:when test="${hostQna.hostStatus eq 'D'}">
										<td>호스팅종료</td>
									</c:when>
									<c:otherwise>
										<td>강제종료</td>
									</c:otherwise>
								</c:choose>
								<td>${hostQna.category }</td>
								<td>${hostQna.title }</td>
								<td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${hostQna.content }</td>
								<td><fmt:formatDate value="${hostQna.questionDate }" pattern="yyyy.MM.dd"/></td>
									<c:choose>
									<c:when test="${hostQna.answered eq 'N'}">
										<td id="creatingmodal" onclick="creatingModal(${hostQna.questionNo })">답변 대기</td>
									</c:when>
									<c:otherwise>
										<td style="white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${hostQna.answerContent }
										<br>
										<small id="creatingmodimodal" onclick="creatingModal(${hostQna.questionNo })" class="pt-1"> 답변 수정 </small>
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
		      				<a class="page-link" href="host-qna?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="host-qna?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="host-qna?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
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
							<th style="width: 30%;">호스트번호</th>
							<th style="width: 20%;">호스트이름</th>
						</tr>
						<tr>
							<td id="questionNo"></td>
							<td id="userNo"></td>
							<td id="hostNo"></td>
							<td id="hostName"></td>
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
							<th style="width: 20%;">호스트타입</th>
							<th style="width: 30&;">승인상태</th>
							<th style="width: 30%;">승인디테일</th>
							<th style="width: 20%;">호스트등급</th>
						</tr>
						<tr>
							<td id="hostType"></td>
							<td id="hostStatus"></td>
							<td id="statusDetail"></td>
							<td id="gradeName"></td>
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
					<form id="answer-form" method="post" action="/admin/answer-insert-host-qna">
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
        			<button type="button" class="btn btn-secondary" id="answer-btn"  data-bs-dismiss="modal"></button>
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
	
	$.getJSON('/admin/host-qna-answer.do', {no:no}, function(QnaDto) {
	
			$('#questionNo').text(QnaDto.questionNo);
			$("#userNo").text(QnaDto.userNo);
			$("#hostNo").text(QnaDto.hostNo);
			$("#hostName").text(QnaDto.hostName);
			
			$("#hostType").text(QnaDto.hostType);
			$("#hostStatus").text(QnaDto.hostStatus);
			$("#statusDetail").text(QnaDto.statusDetail);
			$("#gradeName").text(QnaDto.gradeName);
			
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


function searchQnAs() {
	$("#form-search-hostQnA").trigger("submit");
}



$("#btn-search-hostQnA").click(function() {
	// 검색옵션값과 입력값을 조회한다.
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
	// 검색옵션값과 입력값이 모두 존재하면 페이지번호를 1로 설정하고 폼에서 onsubmit 이벤트를 발생시켜서 폼 입력값이 서버로 제출되게 한다.
	if (opt && value) {
		$(":input[name=page]").val("1");
		$("#form-search-hostQnA").trigger("submit");
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
	$("#form-search-hostQnA").trigger("submit");
})


   $("input:radio[name=answered]").click(function()
    {
	   $("#form-search-hostQnA").trigger("submit");
    })





</script>


</body>
</html>