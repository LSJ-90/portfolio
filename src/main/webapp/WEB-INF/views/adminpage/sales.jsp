<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <link rel="stylesheet" href="/resources/demos/style.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
.datepicker {border: 1px solid black;}
</style>


 <main id="main">
      <article id="user-list">
        <form class="search-user__form" id="form-search-user" method="get" action="user-list">
          <input type="hidden" name="page" value="1" />
          <h3> 기간 조회하기 </h3>
          <br/> 시작 날짜 :<input class="datepicker" id="startDate" /> <br/> 
          <br/> 종료 날짜 : <input class="datepicker" id="endDate" />

           <button type="button" class="btn__search" id="btn-search-user">검색</button>
          <br/><br/><br/> 
          <div> <button name="filterDate" value="1">일주일</button>
           <button name="filterDate" value="2">3개월</button> 
           <button name="filterDate" value="3">6개월</button> 
           <button name="filterDate" value="4">1년</button>
          </div>
        </form>
		<table class="user-list-table">
			<colgroup>
				<col style="width: 5%;">
				<col style="width: 13%;">
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
				<col style="width: 13%;">
			</colgroup>
			<thead>
				<tr>
					<th>No</th>
					<th>종류</th>
					<th>거래금액</th>
					<th>(환불)회원번호</th>
					<th>(출금)호스트번호</th>
					<th>(입금)숙소예약번호</th>
					<th>(입금)체험예약번호</th>
					<th>누적액</th>
					<th>거래일</th>
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
				<tr>
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

		
<!-- 페이지 내비게이션 표시 -->		

		<c:if test="${pagination.totalRecords gt 0 }">

		<div id="pagination">
			<ul class="pagination__list">
				<li class="page__prev ${pagination.existPrev ? '' : 'disabled' }">
					<a 
						class="page-link" 
						href="user-list?page=${pagination.prevPage }" 
						data-page="${pagination.prevPage }"
					>
						<i class="fas fa-chevron-left"></i>
					</a>
				</li>

				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page__num ${pagination.pageNo eq num ? 'active' : '' }">
						<a 
							class="page-link" 
							href="user-list?page=${num }" 
							data-page="${num }"
						>
						${num }
						</a>
					</li>	    			
				</c:forEach>

				<li class="page__next ${pagination.existNext ? '' : 'disabled' }">
					<a 
						class="page-link" 
						href="user-list?page=${pagination.nextPage }" 
						data-page="${pagination.nextPage }"
					>
						<i class="fas fa-chevron-right"></i>
					</a>
				</li>
			</ul>
		</div>
		
		</c:if>	
      
      </article>
    </main>

<script type="text/javascript">
$(function() { $('.datepicker').datepicker({dateFormat: 'yy-mm-dd'}); 
})

// 날짜 포맷("yyyy-MM-dd") 형식으로 반환 
dateFormatter = function(newDay, today) { 
	let year = newDay.getFullYear();
	let month = newDay.getMonth()+1 ;
	let date = newDay.getDate() ;

	// 기존 날짜와 새로운 날짜가 다를 경우 
	if(today) { 
		let todayDate = today.getDate();
		if(date != todayDate) { 
			if(month == 0) year-=1 ;
			month = (month + 11) % 12 ;
			date = new Date(year, month, 0).getDate() ;// 해당 달의 마지막 날짜를 반환 
			} 
		} 
	
	month = ("0"+month).slice(-2) ;
	date = ("0"+date).slice(-2) ;
	return year+"-"+month+"-"+date ;
	} 
	
document.getElementsByName("filterDate").forEach(e=> { 
	e.addEventListener('click', function() { 
		let endDate = new Date($("#endDate").val());
		let newDate = new Date($("#endDate").val()) ;
		switch(this.value) { 
		case '1': 
			console.log("일주일") ;
		newDate.setDate(newDate.getDate() - 7) ;
		newDate = dateFormatter(newDate); 
		break; 
		case '2': 
			newDate.setMonth(newDate.getMonth() - 3) ;
			newDate = dateFormatter(newDate, endDate) ;
			console.log("3개월");
			break; 
		case '3':
			newDate.setMonth(newDate.getMonth() - 6) ;
			newDate = dateFormatter(newDate, endDate) ;
			console.log("6개월"); break; 
		case '4': 
			newDate.setFullYear(newDate.getFullYear() - 1) ;
			newDate = dateFormatter(newDate, endDate) ;
			console.log("1년"); break; 
			} 
		$("#strtDate").val(newDate);
		}) 
	})


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