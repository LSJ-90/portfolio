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

.content-box > textarea { height: 400px; }

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
		<div class="qna-list col">
						자주 묻는 질문
						<div class="faq"> 
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 질문1
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. 답변1
									</span>
								</div>
							</div>
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 질문2
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. 답변2
									</span>
								</div>
							</div>
							<div class="faq-box">
								<div class="faq-title">
									<span>
									Q. 질문3
									</span>
								</div>
								<div class="faq-content">
									<span>
									A. 답변3
									</span>
								</div>
							</div>
						</div>
						<div class="row mt-3">
							<div class="withdrawal">
								<div class="mt-3 text-middle">
									<button type="button" class="btn btn-dark" onclick="creatingModal()">문의하기</button>
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
				</div>  <!-- qna-list -->
								
			
			
			<div class="modal fade" id="modal-creating-qna" tabindex="-1" aria-labelledby="출금신청" aria-hidden="true">
		  		<div class="modal-dialog modal-lg">
		    		<div class="modal-content">
		      			<div class="">
		        			<h5 class="modal-title" id="exampleModalLabel">1:1 관리자 문의</h5>
		      			</div>
		      			<div class="">
							<form id="qna-form" action="/host/qna">
							<input type="hidden" name="orderNo" value="">
						<div>
							<div class="category-list-box p-3 ">
							<label class="form-label mb-3" for="title"><strong>문의 카테고리</strong></label>
							<select id="select-box" class="m-1" name="category">
								<option disabled selected value="">문의사유를 선택해 주세요</option>
								<option value="로그인">로그인</option>
								<option value="회원정보변경">회원 정보 변경</option>
								<option value="결제취소">결제취소</option>
								<option value="호스트신고">호스트 신고</option>
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

function creatingModal() {
	
	let qnaModal = new bootstrap.Modal(document.getElementById('modal-creating-qna'), {
		keyboard: false
	
	});
	qnaModal.show();
}


</script>

</html>