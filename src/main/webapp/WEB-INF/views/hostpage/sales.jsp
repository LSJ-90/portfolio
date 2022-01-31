<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
<style type="text/css">

.chart {margin: 50px 0;}

.sales-table > td {padding:2px 0 !important; text-align:center;}
</style>   
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row mt-3">
		<div class="col-6">
			<div class="row mt-3">
				<div class="col-6">
					<div class=chart>
						<canvas id="line-chart-daily" width="200" height="150"></canvas>
					</div>
				</div>
				<div class="col-6">
					<div class=chart>
						<canvas id="line-chart-monthly" width="200" height="150"></canvas>
					</div>
				</div>
			</div>
		
			<div class=chart>
				<canvas id="bar-chart-horizontal" width="200" height="40"></canvas>
			</div>
		</div> 
		<div class="col-6">
				<div class="row mt-3">
					<div class="withdrawal">
						<div class="mt-3 text-end">
							<button type="button" class="btn btn-dark" onclick="creatingModal()">출금신청</button>
						</div>
					</div>
				</div>
			<div class= "sales-table">
				<table class="table caption-top border-dark table-bordered">
			  <caption>매출 테이블</caption>
				 <colgroup>
					<col width="35%">
					<col width="30%">
					<col width="35%">
				</colgroup>
				<thead>
					<tr>
						<th class="style">거래일</th>
						<th class="style">거래유형</th>
						<th class="style">거래액</th>
					</tr>
				</thead>
			  <tbody>
			   <c:choose>
						<c:when test="${empty transactionList }">
							<tr>
								<td class="text-center" colspan="6">거래정보없음.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="transaction" items="${transactionList }" varStatus="loop">
								<tr class="text-middle">
								<td><fmt:formatDate value="${transaction.createdDate }" pattern="yyyy.MM.dd"/></td>
									<td>${transaction.type eq '1' ? '입금' : '출금'}</td>
									<c:choose>
									<c:when test="${transaction.type eq '1'}">
										<td style="color:red;">+ ${transaction.amount }</td>
									</c:when>
									<c:otherwise>
										<td style="color:blue;">- ${transaction.amount }</td>
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
				
	</div> <!-- row -->
	
	
	<div class="modal fade" id="modal-creating-withdrawal" tabindex="-1" aria-labelledby="출금신청" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel">출금 신청</h5>
      			</div>
        			<strong class="p-3">최소 출금가능액은 50,000원 입니다.</strong>
      			<div class="modal-body">
					<form id="qna-form" action="/host/qna">
					<input type="hidden" name="orderNo" value="">
					<div class="row mb-3 mt-2 order-font">
					
					<div class="mb-3">
						<label class="form-label">은행 선택</label>
							<select class="form-control" id="bankName" name="bankName">
								<option value="농협">농협</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="기업은행">기업은행</option>
								<option value="하나은행">하나은행</option>
								<option value="대구은행">대구은행</option>
								<option value="부산은행">부산은행</option>
								<option value="우체국">우체국</option>
								<option value="SC제일은행">SC제일은행</option>
								<option value="광주은행">광주은행</option>
								<option value="경남은행">경남은행</option>
								<option value="수협">수협</option>
								<option value="케이뱅크">케이뱅크</option>
							</select>
					</div>
					<div class="mb-3">
						<label class="form-label">예금주 입력</label>
						<input type="text" class="form-control" id="accName" name="accountHolderName" />
					</div>
					<div class="mb-3">
						<label class="form-label">계좌번호 입력</label>
						<input type="text" class="form-control" id="hostAcc" name="accountNumber" />
					</div>
						<div class="title-box mb-3">
							<label class="form-label mb-3" for="title"><strong>출금액(출금액은 현재 보유액 이하로만 입력하실 수 있습니다.) 현재 보유액 : xxx.xxxx원</strong></label>
							<input type="text" class="form-control" name="title" id="title" maxlength="30">
						</div>
					 </div>
				</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">신청</button>
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	
	
</div> <!-- 컨테이너 -->
  </body>
<script type="text/javascript">
new Chart(document.getElementById("bar-chart-horizontal"), {
    type: 'horizontalBar',
    data: {
      labels: ["여성", "남성"],
      datasets: [
        {
          label: "booking rate by gender",
          backgroundColor: ["black","black"],
          data: [2478,5267]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: '성별 예약자 비율'
      }
    }
});


new Chart(document.getElementById("line-chart-daily"), {
	  type: 'line',
	  data: {
	    labels: [21,22,23,24,25,26,27,28],
	    datasets: [ { 
	        data: [168,170,178,190,203,276,408,547],
	        label: "거래금액",
	        borderColor: "black",
	        fill: false
	      }
	      
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '일별 입금 거래금액 변화'
	    }
	  }
	});
	
new Chart(document.getElementById("line-chart-monthly"), {
	  type: 'line',
	  data: {
	    labels: ["jan","feb","march","apr","may","june"],
	    datasets: [ { 
	        data: [150,170,190,100,250,408],
	        label: "거래금액",
	        borderColor: "black",
	        fill: false
	      }
	      
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	      text: '월별 입금 거래금액 변화'
	    }
	  }
	});	
	
	

function creatingModal() {
	
	let withdrawalModal = new bootstrap.Modal(document.getElementById('modal-creating-withdrawal'), {
		keyboard: false
	
	});
		withdrawalModal.show();
}



</script>

</html>