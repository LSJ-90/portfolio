<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<style>

/* Modal */

.modal-content {
  padding: 30px 20px;
  width: 800px;
  background-color: var(--color-white);
  border: 1px solid var(--color-form-gray);
  border-radius: 10px;
}

.modal__title {
  font-size: 20px;
  padding-bottom: 15px;
  margin-bottom: 20px;
  border-bottom: 1px solid var(--color-form-gray);
}

.questionDate {
  font-size: 15px;
  font-weight: var(--weight-light);
  padding: 0 5px;
  margin-bottom: 5px;
}

.qna-date {
  font-weight: var(--weight-regular);
  padding-left: 15px;
  margin-left: 15px;
  border-left: 1px solid var(--color-form-gray);
}

.host-info {
  text-align: center;
  padding: 20px;
  margin: 10px 0;
}

.host__type {
  font-weight: var(--weight-light);
  margin-bottom: 5px;
}

.host__name {
  font-size: 18px;
}

.modal-question {
  margin: 40px 0;
}

.question__title {
  text-align: center;
  background-color: var(--color-header-gray);
  height: 45px;
  padding: 10px 0;
}

.question__content {
  padding: 20px;
  font-weight: var(--weight-light);
  border-bottom: 1px solid var(--color-faq-text-gray);
}

.answer__textarea {
  width: 100%;
  height: 150px;
  border: 1px solid var(--color-form-gray);
  padding: 10px;
  border-radius: 5px;
}

.answer__title {
  text-align: center;
  height: 45px;
  padding: 10px 0;
  border-top: 2px solid var(--color-black);
}

.answer-btn {
  margin-top: 20px;
  text-align: center;
}

.btn__answer {
  background-color: var(--color-black);
  font-family: var(--font-family-spoqa);
  color: var(--color-white);
  font-size: 14px;
  font-weight: var(--weight-light);
  width: 350px;
  height: 40px;
}

</style>

<main id="main">
  <article id="admin-user">
  
 <!-- 숙소 리뷰 -->
    <article id="accommo-review">
      <h1 class="section__title">리뷰</h1>
      <table class="user-list-table">
        <colgroup>
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
          <col style="width: 10%" />
        </colgroup>
        <thead>
          <tr>
            <th>회원이름</th>
            <th>청결도</th>
            <th>의사소통</th>
            <th>정확도</th>
            <th>위치</th>
            <th>내용</th>
            <th>작성일</th>
            <th>삭제여부</th>
            <th>답변</th>
          </tr>
        </thead>
			<tbody>
				<c:choose>
					<c:when test="${empty reviewList }">
						<tr>
							<td style="height:200px;" colspan="11">등록된 리뷰가 없습니다</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="review" items="${reviewList }" varStatus="loop">
							<tr class="text-middle">
								<td>${review.userName }</td>
								<td>${review.cleanlinessStar }</td>
								<td>${review.communicationStar }</td>
								<td>${review.accuracyStar }</td>
								<td>${review.locationStar }</td>
								<td class="text-overflow">${review.content }</td>
								<td><fmt:formatDate value="${review.createdDate }" pattern="yyyy.MM.dd"/></td>
								<td>${review.deleted }</td>
									<c:choose>
									<c:when test="${review.answered eq 'N'}">
										<td>
											<button class="btn__modal" id="creatingmodal" 
											onclick="creatingModal(${review.no })">
												답변 대기
											</button>
										</td>
									</c:when>
									<c:otherwise>
										<td>
											<button class="btn__modal" id="creatingmodal" 
											onclick="creatingModal(${review.no })">
												답변 수정
											</button>
										</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
      </table>
      
	<!-- 숙소 페이지네이션 -->      
     <!-- 페이지 내비게이션 표시 -->
		<c:if test="${pagination.totalRecords gt 0 }">
			<div id="pagination">
	  			<ul class="pagination__list">
	    			<li class="page__prev ${pagination.existPrev ? '' : 'disabled' }">
	      				<a class="page-link" href="review?page=${pagination.prevPage }" data-page="${pagination.prevPage }">
	      				 <i class="fas fa-chevron-left"></i>
	      				</a>
	    			</li>
	
	    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
		    			<li class="page__num ${pagination.pageNo eq num ? 'active' : '' }">
		    				<a class="page-link" href="review?page=${num }" data-page="${num }">${num }</a>
		    			</li>	    			
	    			</c:forEach>
	
	    			<li class="page__next ${pagination.existNext ? '' : 'disabled' }">
	      				<a class="page-link" href="review?page=${pagination.nextPage }" data-page="${pagination.nextPage }">
	      				 <i class="fas fa-chevron-right"></i>
	      				</a>
	    			</li>
	  			</ul>
			</div>
		</c:if>		

<!-- 모달창 -->
		<div class="modal fade" id="modal-answering" tabindex="-1" aria-labelledby="문의상세" aria-hidden="true">
	  		<div class="modal-dialog modal-lg">
	    		<article class="modal-content">
		          <header class="modal-title">
		            <p class="modal__title">리뷰 상세</p>
		          </header>
		          <main class="modal-main">
		            <p class="questionDate">
		              <span>등록일</span
		              ><span class="qna-date" id="reviewDate"></span>
		            </p>
		            <div class="host-info">
		              <p class="host__type" id="userName"></p>
		            </div>
		            <table class="user-list-table">
		              <colgroup>
		                <col style="width: 15%" />
		                <col style="width: 15%" />
		                <col style="width: 15%" />
		                <col style="width: 15%" />
		              </colgroup>
		              <thead>
		                <tr>
		                  <th>청결도</th>
				            <th>의사소통</th>
				            <th>정확도</th>
				            <th>위치</th>
		                </tr>
		              </thead>
		              <tbody>
		                <tr>
		                  <td id="cleanlinessStar"></td>
		                  <td id="communicationStar"></td>
		                  <td id="accuracyStar"></td>
		                  <td id="locationStar"></td>
		                </tr>
		              </tbody>
		            </table>
		            <div class="modal-question">
		              <p class="question__title" id="title">
		              </p>
		              <p class="question__content" id="content">
		              </p>
		            </div>
		            <form
		              id="answer-form"
		              method="post"
		              action="/host/review-answer-insert"
		            >
		              <input type="hidden" name="reviewNo" value="" />
		              <input type="hidden" name="hostNo" value="${savedHost.no}" />
		              <input type="hidden" name="hostingType" value="${savedHost.hostingType}" />
		              <p class="questionDate" id="modified"></p>
		              <div class="modal-answer">
		                <p class="answer__title">답변</p>
		                <textarea
		                  class="answer__textarea"
		                  name="answerContent"
		                  id="answerContent"
		                ></textarea>
		              </div>
		              <div class="answer-btn">
		                <button
		                  type="button"
		                  class="btn__answer"
		                  id="answer-btn"
		                  data-bs-dismiss="modal"
		                >
		                  답변 등록
		                </button>
		              </div>
		            </form>
		          </main>
		        </article>
						
	  		</div>
		</div>
    </article>
  </article>
</main>

<script type="text/javascript">
$(function(){
	
	activeMenu('리뷰관리');
	})

function creatingModal(no) {
	
	let answeringModal = new bootstrap.Modal(document.getElementById('modal-answering'), {
		keyboard: false
	
	});
	
	$.getJSON('/host/review-answer.do', {no:no}, function(reviewDto) {
	
			$("#reviewDate").text(reviewDto.createdDate);
			
			$("#cleanlinessStar").text(reviewDto.cleanlinessStar);
			$("#communicationStar").text(reviewDto.communicationStar);
			$("#accuracyStar").text(reviewDto.accuracyStar);
			$("#locationStar").text(reviewDto.locationStar);
			
			$("#content").text(reviewDto.content);
			$('input[name=reviewNo]').attr('value', reviewDto.no);
			
			if (reviewDto.deleted=='Y') {	
				
			$("#title").text("리뷰 내용 - 삭제된 리뷰입니다");
			} else {
				$("#title").text("리뷰 내용");
			}
			
			if (reviewDto.answerContent!=null) {				
			$("#answerContent").text(reviewDto.answerContent);
			$("#answer-btn").text('답변 수정');
			} else {
				$("#answer-btn").text('답변 등록');
			}
			if (reviewDto.answered=='Y') {				
				$("#modified").text( '답변등록일: ' + reviewDto.answerCreatedDate);
			}
		
	});

	answeringModal.show();
}


$("#answer-btn").click(function() {
	
//검색옵션값과 입력값을 조회한다.
var reviewNo = $(":input[name=reviewNo]").val();
var value = $(":input[name=answerContent]").val();

console.log(reviewNo);
console.log(value);
		$("#answer-form").trigger("submit");
	
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


  


</script>


</body>
</html>