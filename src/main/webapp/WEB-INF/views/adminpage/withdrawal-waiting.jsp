<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>

 <main id="main">
      <article id="admin-user">
        <form class="search-user__form" id="form-search-user" method="get" action="withdrawal">
          <input type="hidden" name="page" value="1" />
          <ul class="search-bar">
          	 <li>총 선택금액:<span></span><li> 
     		 <li><button type="button" class="btn__search" id="btn-withdrawal" onclick="">선택 승인</button><li>
     		 <li><button type="button" class="btn__search" id="btn-withdrawal" onclick="location.href='/admin/withdrawal'">승인 완료 목록</button><li>
	          <li>
		        <select class="search__select" name="opt">
					<option value="" selected disabled="disabled">검색조건</option>
					<option value="호스트번호" ${'호스트번호' eq param.opt ? 'selected' : ''}>호스트번호</option>
					<option value="호스트이름" ${'호스트이름' eq param.opt ? 'selected' : ''}>호스트이름</option>
				</select>
	          </li>
	          <li>
		        <input
		              type="text"
		              class="search-user"
		              name="value"
		              value="${param.value }"
		          />
		          <button type="button" class="btn__search" id="btn-search-user">검색</button>
	          </li>
          </ul>
        </form>
		<table class="user-list-table">
			<colgroup>
				<col style="width: 8%;">
				<col style="width: 8%;">
				<col style="width: 15%;">
				<col style="width: 15%;">
				<col style="width: 11%;">
				<col style="width: 8%;">
				<col style="width: 13%;">
				<col style="width: 16%;">
			
			</colgroup>
			<thead>
				<tr>
					<th class="style"><input type='checkbox' name='withdrawal'  value='selectall' class="selectAll"/>전체선택</th>
					<th class="style">호스트번호</th>
					<th class="style">호스트이름</th>
					<th class="style">금액</th>
					<th class="style">예금주</th>
					<th class="style">계좌번호</th>
					<th class="style">은행</th>
					<th class="style">승인</th>
					<th class="style">출금신청일</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td class="text-center" colspan="6">사용자 없음.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="withdrawal" items="${list }" varStatus="loop">
				<tr>
					<td><input type="checkbox" name="withdrawal" id="${withdrawal.withdrawalNo }" value="${withdrawal.withdrawalNo }"></td>
					<td>${withdrawal.hostNo }</td>
					<td>${withdrawal.hostName }</td>
					<td id="amount-${withdrawal.withdrawalNo }"><fmt:formatNumber value="${withdrawal.amount }" pattern="#,###" />원</td>
					<td>${withdrawal.accountHolderName }</td>
					<td>${withdrawal.accountNumber }</td>
					<td>${withdrawal.bankName }</td>
					<td><button class="btn__modal" onclick="">승인하기</button></td>
					<td><fmt:formatDate value="${withdrawal.createdDate }" pattern="yyyy.MM.dd"/></td>
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
						href="withdrawal?page=${pagination.prevPage }" 
						data-page="${pagination.prevPage }"
					>
						<i class="fas fa-chevron-left"></i>
					</a>
				</li>

				<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
					<li class="page__num ${pagination.pageNo eq num ? 'active' : '' }">
						<a 
							class="page-link" 
							href="withdrawal?page=${num }" 
							data-page="${num }"
						>
						${num }
						</a>
					</li>	    			
				</c:forEach>

				<li class="page__next ${pagination.existNext ? '' : 'disabled' }">
					<a 
						class="page-link" 
						href="withdrawal?page=${pagination.nextPage }" 
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



$(function(){
    $("[type=checkbox][name=withdrawal]").on("change", function(){ //0
        var check = $(this).prop("checked"); //1
        //전체 체크
        if($(this).hasClass("selectAll")){ //2
            $("[type=checkbox][name=withdrawal]").prop("checked", check);

        //단일 체크
        }else{ //3
            var all = $("[type=checkbox][name=withdrawal].selectAll");
            var allcheck = all.prop("checked")
            if(check != allcheck){ //3-1
                var len = $("[type=checkbox][name=withdrawal]").not(".selectAll").length; //3-2
                var ckLen = $("[type=checkbox][name=withdrawal]:checked").not(".selectAll").length; //3-2
                if(len === ckLen){ //3-3
                    all.prop("checked", true);
                }else{
                    all.prop("checked", false);
                }
            }
        }
    });
});


//$("input[name='telecom']:checked").val();

</script>