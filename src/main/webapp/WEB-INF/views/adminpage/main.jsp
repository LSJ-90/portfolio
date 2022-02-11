<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
  	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	 
	 
	 <style type="text/css">
	 
	 .today-list-box {
	  height:200px; background: pink; padding: 20px 20px; border: 1px solid rgba(201, 203, 207, 0.2);
	  border-radius:16px; box-shadow: inset 0 0 8px #dep13a;
	 }
	 
	 .todo-list-box {
	 height:524px; background: rgba(201, 203, 207, 0.2); border-radius:16px; 
	 padding: 20px 20px; border: 1px solid rgba(201, 203, 207, 0.2);
	 }
	 
	 .count {font-size: 22px; color: red;}
	 
	 .chartbox {margin: 0 10px; background: rgba(100, 102, 255, 0.2); border: 1px solid rgba(201, 203, 207, 0.2); border-radius:16px; box-shadow: inset 0 0 8px #dep13a;
	 }
	 .today-box {eight:100px; margin: 0 10px; background: pink; border: 1px solid rgba(201, 203, 207, 0.2); border-radius:16px;
	 }
	 
	 </style>
	 
	 
</head>
<body>
<div class="container">
	<div class="row mb-3">
		<div class="col-12">
		<h5>최근 1년간 월별 순이익</h5>
		<canvas id="myChart" width="400" height="80"></canvas>
			<div class="today-box">
						입금액
						<span class="count" id="todayOrder">8,000,000</span>
						원
						출금신청액
						<span class="count" id="todayOrder">5,000,000</span>
						원
						예상순이익
						<span class="count" id="todayOrder">3,000,000</span>
						원
						누적액
						<span class="count" id="todayOrder">580,000,000</span>
						원
			</div>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-6">
			<div class="row mb-3">
				<div class="chartbox col mt-1">
					<h5>일별 가입자수</h5>
					<canvas id="lineChart" width="600" height="200"></canvas>
				</div>
			</div>
			<div class="row mb-3">
				<div class="chartbox col mt-1">
					<h5>일별 거래금액 </h5>
					<canvas id="transactionAmountChart" width="600" height="200"></canvas>
				</div>
			</div>
		</div>
		<div class="col-6">
			<div class="row mb-3">
			<div class="col-4 mt-1 mb-3">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						회원 활동
					</div>
					<div class="col-12">
						신규 회원
	                    <span class="count" id="todayJoinMember">0</span>
						명
					</div>
					<div class="col-12">
						회원 탈퇴
	                    <span class="count" id="todayJoinMember">0</span>
						명
					</div>
					<div class="col-12">
						숙소 리뷰
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						체험 리뷰
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				</div>
			</div>
		</div>
		<div class="col-4 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						결제 내역
					</div>
					<div class="col-12">
						신규 결제
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						결제 취소
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
					<div class="col-12">
						출금 신청
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>
			<div class="col-4 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						승인 대기 
					</div>
					<div class="col-12">
						숙소 등록
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						체험 등록
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
					<div class="col-12">
						프로모션 등록
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>
		<div class="col-4 mt-1">
			<div class="today-list-box">
				<div class="row">
					<div class="col-12">
						답변 미완료 문의 
					</div>
					<div class="col-12">
						회원 문의
						<span class="count" id="todayOrder">0</span>
						건
					</div>
					<div class="col-12">
						호스트 문의
	                    <span class="count" id="todayCanceledOrder">0</span>
						건
					</div>
				
				</div>
			</div>
		</div>

			</div>
		</div>
	</div>
	
	

		
	

</div> <!-- container -->
</body>
<script type="text/javascript">
mainActive();

getUserNumberGraph();
getTransactionAmountChart();
getProfitAmountPerMonth();

function getUserNumberGraph() {
	let dateList = [];
	let userNumberList = [];
	
	
	$.ajax({
		url:"user-number-graph",
		type:"get",
		dataType:"json",
		success:function(data) {
			console.log(data);
			for (let  i = 0; i<data.length; i++) {
				dateList.push(data[i].label);
				userNumberList.push(data[i].data);
			}
			
			new Chart(document.getElementById('lineChart'), {
				 type: 'line',
				 data: {
					 labels: dateList,
					 datasets: [{
						 data: userNumberList,
						 label: "가입자 수",
						 backgroundColor: [
								'rgba(0, 0, 0, 0)'
							],
						 borderColor: [
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 99, 132, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(153, 102, 255, 1)'
							],
						 borderWidth: 2
					 }]
				 },
				 options: {
						responsive: false,
						animation: {
							onComplete: function () {
								var chartInstance = this.chart,
									ctx = chartInstance.ctx;
								ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
								ctx.fillStyle = 'black';
								ctx.textAlign = 'center';
								ctx.textBaseline = 'bottom';

								this.data.datasets.forEach(function (dataset, i) {
									var meta = chartInstance.controller.getDatasetMeta(i);
									meta.data.forEach(function (bar, index) {
										var data = dataset.data[index];							
										ctx.fillText(data, bar._model.x, bar._model.y - 5);
									});
								});
							}
						},
						scales: {
							yAxes: [{
								ticks: {
									beginAtZero: true,
									stepSize : 2,
									fontSize : 14,
								}
							}]
						},
						 legend: {
						      display: false
						   }
					}
			});
		},
		error:function(){
			alert("실패");
		}
		
		
	})//ajax
}//그래프 가져오기
function getTransactionAmountChart() {
	let dateList = [];
	let transactionList = [];
	
	
	$.ajax({
		url:"admin-transaction-graph",
		type:"get",
		dataType:"json",
		success:function(data) {
			console.log(data);
			for (let  i = 0; i<data.length; i++) {
				dateList.push(data[i].label);
				transactionList.push(data[i].data);
			}
			
			new Chart(document.getElementById('transactionAmountChart'), {
				 type: 'line',
				 data: {
					 labels: dateList,
					 datasets: [{
						 data: transactionList,
						 label: "가입자 수",
						 backgroundColor: [
								'rgba(0, 0, 0, 0)'
							],
						 borderColor: [
								'rgba(54, 162, 235, 1)',
								'rgba(255, 99, 132, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)',
								'rgba(153, 102, 255, 1)'
							],
						 borderWidth: 2
					 }]
				 },
				 options: {
						responsive: false,
						animation: {
							onComplete: function () {
								var chartInstance = this.chart,
									ctx = chartInstance.ctx;
								ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
								ctx.fillStyle = 'black';
								ctx.textAlign = 'center';
								ctx.textBaseline = 'bottom';

								this.data.datasets.forEach(function (dataset, i) {
									var meta = chartInstance.controller.getDatasetMeta(i);
									meta.data.forEach(function (bar, index) {
										var data = dataset.data[index];							
										ctx.fillText(data, bar._model.x, bar._model.y - 5);
									});
								});
							}
						},
						scales: {
							yAxes: [{
								ticks: {
									beginAtZero: true,
									fontSize : 14,
								}
							}]
						},
						 legend: {
						      display: false
						   }
					}
			});
		},
		error:function(){
			alert("실패");
		}
		
		
	})//ajax
}//그래프 가져오기

function getProfitAmountPerMonth() {
	let dateList = [];
	let profitList = [];
	
	
	$.ajax({
		url:"admin-profit-graph",
		type:"get",
		dataType:"json",
		success:function(data) {
			console.log(data);
			for (let  i = 0; i<data.length; i++) {
				dateList.push(data[i].label);
				profitList.push(data[i].data);
			}
	


new Chart(document.getElementById("myChart"), {
	type: 'bar', 
	data: { labels: dateList, 
		datasets: [{ label: '월별 순이익', 
			backgroundColor: ['rgba(255, 99, 132, 0.2)',  'rgba(255, 159, 64, 0.2)',  'rgba(75, 192, 192, 0.2)', 'rgba(255, 99, 132, 0.2)',
			      'rgba(255, 159, 64, 0.2)',
			      'rgba(255, 205, 86, 0.2)',
			      'rgba(75, 192, 192, 0.2)',
			      'rgba(255, 159, 64, 0.2)',
			      'rgba(255, 205, 86, 0.2)',
			      'rgba(75, 192, 192, 0.2)',
			      'rgba(54, 162, 235, 0.2)',
			      'rgba(153, 102, 255, 0.2)',
			      'rgba(201, 203, 207, 0.2)'],
			borderColor: ['rgb(255, 99, 132)',
				'rgb(255, 99, 132)',
		      'rgb(255, 205, 86)'],
			data: profitList }] },
			options: {
				animation: {
					onComplete: function () {
						var chartInstance = this.chart,
							ctx = chartInstance.ctx;
						ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						ctx.fillStyle = 'black';
						ctx.textAlign = 'center';
						ctx.textBaseline = 'bottom';

						this.data.datasets.forEach(function (dataset, i) {
							var meta = chartInstance.controller.getDatasetMeta(i);
							meta.data.forEach(function (bar, index) {
								var data = dataset.data[index];							
								ctx.fillText(data, bar._model.x, bar._model.y - 5);
							});
						});
					}
				},
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true,
							fontSize : 14,
							
						}
					}]
				},
				 legend: {
				      display: false
				   },

			}
			});
		},
		error:function(){
			alert("실패");
		}
		
		
	})//ajax
}//그래프 가져오기



</script>
</html>