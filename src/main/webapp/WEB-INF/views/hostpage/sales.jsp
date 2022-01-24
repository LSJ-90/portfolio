<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class=chart>
			<canvas id="line-chart-daily" width="200" height="100"></canvas>
		</div>
		<div class=chart>
			<canvas id="line-chart-monthly" width="200" height="100"></canvas>
		</div>
		<div class=chart>
			<canvas id="bar-chart-horizontal" width="200" height="50"></canvas>
		</div>
	</div> 
		<div class="col-7">
				<div class="row mt-3">
					<div class="withdrawal">
						<div class="mt-3 text-end">
							<button type="submit" class="btn btn-dark">출금신청</button>
						</div>
					</div>
				</div>
			<div class= "sales-table">
				<table class="table caption-top border-dark table-bordered">
			  <caption>매출 테이블</caption>
				 <colgroup>
					<col width="10%">
					<col width="25%">
					<col width="15%">
					<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th class="style">No.</th>
						<th class="style">거래일</th>
						<th class="style">거래유형</th>
						<th class="style">거래액</th>
					</tr>
				</thead>
			  <tbody>
			    <tr>
			   <td class="style">ddddd</td>		
			   <td class="style">ddddd</td>		
			   <td class="style">ddddd</td>		
			   <td class="style">ddddd</td>		
			    </tr>
			  </tbody>
			</table>
			
			
			</div>			
				</div>
				
			
		
		</div>
				
	</div> <!-- row -->
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
          backgroundColor: ["#f19bc3","#aefcf8"],
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
	        borderColor: "#3cba9f",
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
	        borderColor: "#f59090",
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
</script>

</html>