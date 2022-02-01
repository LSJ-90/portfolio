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
		<div class="col-5">
			<div class="row mt-3">
				<div class="col-12">
					<div class=chart>
						<canvas id="line-chart-daily" width="200" height="110"></canvas>
					</div>
				</div>
				<div class="col-12">
					<div class=chart>
						<canvas id="line-chart-monthly" width="200" height="110"></canvas>
					</div>
				</div>
			</div>
		
			<div class=chart>
				<canvas id="bar-chart-horizontal" width="200" height="40"></canvas>
			</div>
		</div> 
		<div class="col-7">
				<div class="row mt-3">
					<div class="withdrawal">
						<div class="mt-3 text-end">
							<button type="button" class="btn btn-dark" onclick="creatingModal()">출금신청</button>
						</div>
					</div>
				</div>
				<div class="row mb-3 mt-3">
					<div class="col">
						<div class="row mb-3">
							<div class="col">
								<strong>출금신청내역</strong>
						 			<table class="table table-bordered border-dark">
									 <colgroup>
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th class="style">출금신청일</th>
											<th class="style">금액</th>
											<th class="style">상태</th>
											<th class="style">예금주</th>
											<th class="style">은행</th>
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
				</div> <!-- 출금신청내역 리스트 -->
				
				
				<div class="row mb-3 mt-3">
					<div class="col">
						<div class="row mb-3">
							<div class="col">
							<strong>매출테이블</strong>
						 		<table class="table caption-top border-dark table-bordered">
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
				</div> <!-- 매출 리스트 -->
		
		
			
				
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
					<form id="withdrawal-form" method="post" action="/host/withdrawal">
						<input type="hidden" name="hostNo" id="hostNo" value="0">
						<input type="hidden" name="hostingType" id="hostingType" value="0">
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
							<label class="form-label mb-3" for="title"><span>출금액(출금액은 현재 보유액 이하로만 입력하실 수 있습니다.) 현재 보유액 : <strong id="accumulatedMoney"></strong>원</span></label>
							<input type="text" class="form-control" name="amount" id="amount" maxlength="30">
						</div>
					 </div>
				</form>
      			</div>
      			<div class="modal-footer">
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="withFormsubmit">신청</button>
        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      			</div>
    		</div>
  		</div>
	</div>
	
	
</div> <!-- 컨테이너 -->
  </body>
<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



const hostNo = "${savedHost.no }";

$('#withFormsubmit').click(function() {
	var amount = $.trim($(":input[name=amount]").val());
	if (amount) {
		$("#withdrawal-form").trigger("submit");
	} else {
		alert("출금액을 입력하세요");					
	}
	
});


$(document).ready(function() {
	getWithdrawalList();
	getTransactionList();
});

function getWithdrawalList(page) {
	
			$.ajax({
				type: 'POST',
				url : "/host/withdrawalList.do", //서비스 주소 
				data : { //서비스 처리에 필요한 인자값
					page : page,
					hostNo : hostNo
				},
				success : function(result) {
					const list = result['list'];
					const pagination = result['pagination'];
					var data = "";
					var block = "";

					
					console.log(pagination);
					console.log(JSON.stringify(list));
					// 테이블의 row를 삽입하는 부분
					for (var i = 0; i < list.length; i++) {
						data += "<tr>";
						data += "<td>" + list[i].createdDate + "</td>";
						data += "<td>" + numberWithCommas(list[i].amount) + "원</td>";
						
						if (list[i]['status']== 'N') {
							data += "<td>승인대기</td>";
							} else {
								data += "<td>승인완료</td>";
							}
						data += "<td>" + list[i].accountHolderName + "</td>";
						data += "<td>" + list[i].bankName + "</td>";
						data += "</tr>";
					}
					$("#dataSection1").html(data);

					// 이전버튼 활성화 여부를 결정하는 부분
					if (pagination['prevPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawalList("
								+ (pagination['beginPage'] - 1)
								+ ")'> < </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
					}

					// 번호를 표시하는 부분
					for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
						if (page !== i) {
							block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawalList("
									+ i + ")'>" + (i) + "</a></li>";
						} else {
							block += "<li class='page-item disabled'><a class='page-link'>"
									+ (i) + "</a></li>";
						}
					}

					if (pagination['nextPage']) {
						block += "<li class='page-item'><a class='page-link' href='javascript:getWithdrawalList("
								+ (pagination['endPage'] + 1)
								+ ")'>  > </a></li>";
					} else {
						block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
					}
					
					$("#paginationBox1").html(block);
				}
			})
}





function getTransactionList(page) {
	
	$.ajax({
		type: 'POST',
		url : "/host/transactionList.do", //서비스 주소 
		data : { //서비스 처리에 필요한 인자값
			page : page,
			hostNo : hostNo
		},
		success : function(result) {
			const list = result['list'];
			const pagination = result['pagination'];
			var data = "";
			var block = "";

			
			console.log(pagination);
			console.log(list);
			// 테이블의 row를 삽입하는 부분
			for (var i = 0; i < list.length; i++) {
				data += "<tr>";
				data += "<td>" + list[i].createdDate + "</td>";
				
				if (list[i]['type'] == '1') {
					data += "<td>입금</td>";
				data += "<td style='color:red'> +" + numberWithCommas(list[i].amount) + "원</td>";
					} else {
						data += "<td>출금</td>";
				data += "<td style='color:blue'> -" + numberWithCommas(list[i].amount) + "</td>";
					}
				data += "</tr>";
			}
			$("#dataSection2").html(data);

			// 이전버튼 활성화 여부를 결정하는 부분
			if (pagination['prevPage']) {
				block += "<li class='page-item'><a class='page-link' href='javascript:getTransactionList("
						+ (pagination['beginPage'] - 1)
						+ ")'> < </a></li>";
			} else {
				block += "<li class='page-item disabled'><a class='page-link'> < </a></li>";
			}

			// 번호를 표시하는 부분
			for (var i = pagination['beginPage']; i <= pagination['endPage']; i++) {
				if (page !== i) {
					block += "<li class='page-item'><a class='page-link' href='javascript:getTransactionList("
							+ i + ")'>" + (i) + "</a></li>";
				} else {
					block += "<li class='page-item disabled'><a class='page-link'>"
							+ (i) + "</a></li>";
				}
			}

			if (pagination['nextPage']) {
				block += "<li class='page-item'><a class='page-link' href='javascript:getTransactionList("
						+ (pagination['endPage'] + 1)
						+ ")'>  > </a></li>";
			} else {
				block += "<li class='page-item disabled'><a class='page-link'> > </a></li>";
			}
			
			$("#paginationBox2").html(block);
		}
	})
}
























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
		$('#accName').val("${savedHost.accountHolderName}");
		$('#bankName').val("${savedHost.bankName}");
		$('#hostAcc').val("${savedHost.accountNumber}");
		$('#hostNo').val("${savedHost.no}");
		$('#hostingType').val("${savedHost.hostingType}");
		console.log("${savedHost.accumulatedMoney}");
		$('#accumulatedMoney').text("${savedHost.accumulatedMoney}");
		withdrawalModal.show();
}



</script>

</html>