<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
<style type="text/css">


.faq-title {
  font-family: "Spoqa Han Sans Neo", sans-serif;
  font-size: 15px;
  padding: 3px 0;
}

.faq-content {
  font-family: "Spoqa Han Sans Neo", sans-serif;
  font-size: 12px;
  padding: 3px 0;
}

.faq  {border: 1px solid #888; height: 400px; padding : 5px;}
.faq-box {padding : 5px;}

.content-box > textarea { height: 450px; }


.qna {
	height: 780px;
	width: 550px;
  cursor: pointer;
}

.front, .back {
  display: flex;
	height: 780px;
	width: 550px;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.front {
  border: 1px solid #888; 
}

.front:hover {
  bottom: 1px;
  left: 1px;
  box-shadow: 0px 0px 3px 1px #000;
}

.back {
  border: 1px solid #888; 
  display: none;
 
}

.back:hover {
	bottom: 1px;
  left: 1px;
  box-shadow: 0px 0px 3px 1px #000;
}



</style>   
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row mt-3">
		<div class="qna-list col-7">
						F A Q
						<div class="faq"> 
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 대금 수령까지 걸리는 시간	
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. HOGE는 게스트가 숙소에 체크인한 후 24시간이 지나면 호스트에게 예약 대금을 지급합니다. 
									단, 대금이 실제로 계좌에 입금되기까지 걸리는 시간은 은행과 대금 수령 방법에 따라 다릅니다.
									</span>
								</div>
							</div>
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 게스트가 취소하면 대금 수령은 어떻게 되나요?
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. 게스트가 (체크인 전이나 숙박 도중에) 예약을 취소하면 호스트의 환불 정책에 따라 자동으로 환불이 제공되지만, 
									몇 가지 예외 사항이 있습니다.
									</span>
								</div>
							</div>
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 어떻게 많은 게스트에게 노출되게 할 수 있을까요?
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. 필터설정은 검색 순위 알고리즘은 게스트에게는 여행에 완벽한 숙소를 찾아주고 
									호스트에게는 숙소에 알맞은 게스트를 찾아주는 역할을 합니다. 검색 태그를 추가해주세요.
									</span>
								</div>
							</div>
						</div>
		
		
		
					<div class="qna-box">
					<c:choose>
						<c:when test="${empty qnaList }">
						<div class="row">
							<div class="p-5">
								<p class="text-center order-font">작성된 QnA가 없습니다.</p>
							</div>
						</div>
						</c:when>
						<c:otherwise>
						<div class="row mt-3">
							<div class="col mt-2">
								<span style="margin-left: 5px;">
								총 ${totalRecords }건의	상담내역이 있습니다.
								</span>
							</div>
							<div>
								<div class="accordion accordion-flush m-3" id="faqlist" style="border-top:1px solid #d5d5d5; border-bottom:1px solid #d5d5d5;">
									<c:forEach var="qna" items="${qnaList }" varStatus="loop">
									<div class="accordion-item">
										<div class="row pt-1">
											<div class="col-2 mt-1 text-center">
												<span style="font-weight: bold;">${qna.category }</span>
											</div>
											<div class="col-4 mt-1 text-center">
												<span>${qna.title }</span>
											</div>
											<div class="col-3 mt-1 text-center">
												<span style="font-weight: bold;">
												<fmt:formatDate value="${qna.questionDate }" pattern="yyyy.MM.dd"/>
												</span>
											</div>
											<div class="col-2 mt-1 text-end">
												<span style="font-weight: bold;">
												<c:choose>
													<c:when test="${qna.answered eq 'N'}">
													답변 대기
													</c:when>
													<c:otherwise>
													답변 완료
													</c:otherwise>
												</c:choose>
												</span>
											</div>
											<div class="col-1 mt-1 text-end">
												<h2 class="accordion-header"
													id="faq-heading-qna">
													<button class="accordion-button collapsed" type="button"
														data-bs-toggle="collapse"
														data-bs-target="#faq-content-${qna.no }">
													</button>
												</h2>
											</div>
										</div>
										<div id="faq-content-${qna.no }"
											class="accordion-collapse collapse" data-bs-parent="#faqlist">
											<div class="accordion-body">
												<strong>Q. </strong>${qna.content }
											</div>
											<div class="accordion-body">
												<c:choose>
													<c:when test="${qna.answered eq 'N'}">
													<strong>답변 대기 중입니다.</strong>
													</c:when>
													<c:otherwise>
													<strong>A. </strong>답입니다
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
						</c:otherwise>
					</c:choose>
						
						
						
					</div><!-- qna-box -->
					
<c:if test="${pagination.totalRecords gt 0 }">
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mb-3">
			<div class="col">
				<nav>
		  			<ul class="pagination justify-content-center">
		    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="qna?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="qna?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="qna?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    			</li>
		  			</ul>
				</nav>
			</div>
		</div>
	</c:if>		
	</div>  <!-- qna-list -->
								
				<div class="preqna col-5 mt-4">
				  <div class="qna">
				    <div id="front" class="front" onclick="openQnA()">
				      <h1>문의하기</h1>
				    </div>
				    <div id="back" class="back p-4">
				    <div>
				<form id="qna-form" method="post" action="/host/qna-insert.do">
					<input type="hidden" name="hostNo" value="100">
					<div>
						<div class="category-list-box p-3 ">
							<label class="form-label mb-3" for="title"><strong>문의 카테고리</strong></label>
							<select id="select-box" class="m-1" name="category">
								<option disabled selected value="">문의사유를 선택해 주세요</option>
								<option value="정산">정산</option>
								<option value="호스트정보변경">호스트 정보 변경</option>
								<option value="호스트탈퇴">호스트 탈퇴</option>
								<option value="게스트신고">게스트 신고</option>
								<option value="불편사항">불편사항</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="row mb-3 mt-2 order-font">
						<div class="title-box mb-3">
							<label class="form-label mb-3" for="title"><strong>문의 제목</strong></label>
							<input type="text" class="form-control" name="title" id="title" maxlength="30">
						</div>
						<div class="content-box mb-2">
							<label class="form-label mb-3" for="content"><strong>문의 내용</strong></label>
	    					<textarea class="form-control" name="content" id="content" rows="3" maxlength=""></textarea>
						</div>
						<div class="mt-3 text-end">
							<button type="submit" class="btn btn-dark">등록</button>
						</div>
					 </div>
				</form>
			
			
					</div>
				</div>
			</div>
		</div>
	</div> <!-- row -->
</div> <!-- 컨테이너 -->
  
</body>
<script type="text/javascript">
function openQnA() {
	console.log("엥");
	  $("#front").hide();
	  $("#back").show();
};

</script>
</html>