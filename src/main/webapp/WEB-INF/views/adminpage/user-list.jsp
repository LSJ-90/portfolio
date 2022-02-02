<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!--  
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 -->  

<style>

table {font-size: 10pt; text-align:center;}
</style>
<body>


<div class="container">


<form id="form-search-user" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="user-list">
	<input type="hidden" name="page" value="1" />
	<div class="row mb-3 mt-3">
		<div class="col-3">
	<input type="radio" name="deleted" value="N" checked>현재 이용중인 회원
	<input type="radio" name="deleted" value="Y" ${'Y' eq param.deleted ? 'checked' : ''}>탈퇴한 회원
		</div>
		<div class="col-3">
			<select class="form-select" name="opt">
				<option value="" selected disabled="disabled">검색조건을 선택하세요</option>
				<option value="이름" ${'이름' eq param.opt ? 'selected' : ''}> 이름으로 검색</option>
				<option value="전화번호" ${'전화번호' eq param.opt ? 'selected' : ''}> 전화번호 검색</option>
				<option value="아이디" ${'아이디' eq param.opt ? 'selected' : ''}> 아이디로 검색</option>
				<option value="이메일" ${'이메일' eq param.opt ? 'selected' : ''}> 이메일으로 검색</option>
			</select>
		</div>
	<div class="col-3">
		<input type="text" class="form-control" name="value" value="${param.value }">
	</div>
	<div class="col-3">
		<button type="button" class="btn btn-outline-primary btn-sm" id="btn-search-user">검색</button>
	</div>
	</div>
</form>



<table class="table table-bordered border-dark" >
	<thead>
		<tr>
			<th style="width: 7%;">회원번호</th>
			<th style="width: 8%;">아이디</th>
			<th style="width: 7%;">이름</th>
			<th style="width: 10%;">연락처</th>
			<th style="width: 15%;">이메일</th>
			<th style="width: 5%;">성별</th>
			<th style="width: 10%;">포인트</th>
			<th style="width: 15%;">가입일</th>
			<th style="width: 7%;">호스팅여부</th>
			<th style="width: 7%;">탈퇴여부</th>
			<th style="width: 7%;">신고횟수</th>
		</tr>
	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty users }">
				<tr>
					<td class="text-center" colspan="6">사용자 없음.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="user" items="${users }" varStatus="loop">
					<tr class="text-middle">
						<td>${user.no }</td>
						<td>${user.id }</td>
						<td>${user.name }</td>
						<td>${user.tel }</td>
						<td>${user.email }</td>
						<td>${user.gender == 'female' ? '여' : '남'}</td>
						<td>${user.pnt }</td>
						<td><fmt:formatDate value="${user.registeredDate }" pattern="yyyy.MM.dd"/></td>
						<td>${user.isHost == 'N' ?  'X' :'O'}</td>
						<td>${user.deleted }</td>
						<td>${user.reportedCount }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</tbody>
</table>

<c:if test="${pagination.totalRecords gt 0 }">
<!-- 페이지 내비게이션 표시 -->
<div class="row mb-3">
	<div class="col">
		<nav>
  			<ul class="pagination justify-content-center">
    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
      				<a class="page-link" href="user-list?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
    			</li>

    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
	    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
	    				<a class="page-link" href="user-list?page=${num }" data-page="${num }">${num }</a>
	    			</li>	    			
    			</c:forEach>

    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
      				<a class="page-link" href="user-list?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
    			</li>
  			</ul>
		</nav>
	</div>
</div>
</c:if>		
</div>

<script type="text/javascript">
/* 폼에서 onsubmit 이벤트가 발생해서 폼이 제출될 때 실행될 이벤트핸들러 함수를 등록한다.
$("#form-search-book").submit(function() {	// form에서 onsubmit이벤트가 발생했을 때, 반환값에 따라서 form 입력값이 서버로 제출되거나 제출되지 않을 수 있다.
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
	if (opt && value) {
		return true;		// 이벤트핸들러 함수가 true를 반환하면 form의 입력값이 서버로 제출된다.
	}
	
	alert("검색조건 혹은 검색어를 입력하세요");
	return false;			// 이벤트핸들러 함수가 false를 반환하면 form의 입력값이 서버로 제출되지 않는다.
});
*/

// 검색버튼을 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
$("#btn-search-user").click(function() {
	// 검색옵션값과 입력값을 조회한다.
	var opt = $("select[name=opt]").val();
	var value = $.trim($(":input[name=value]").val());
	
	// 검색옵션값과 입력값이 모두 존재하면 페이지번호를 1로 설정하고 폼에서 onsubmit 이벤트를 발생시켜서 폼 입력값이 서버로 제출되게 한다.
	if (opt && value) {
		$(":input[name=page]").val("1");
		$("#form-search-user").trigger("submit");
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
	$("#form-search-user").trigger("submit");
})


   $("input:radio[name=deleted]").click(function()
    {
	   $("#form-search-user").trigger("submit");
    })




</script>


</body>
</html>