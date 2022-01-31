<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

	 
</head>
<body>
<div class="container">
<canvas id="myChart" width="250" height="100"></canvas>
<canvas id="lineChart" width="500" height="200"></canvas>
<canvas id="pie-chart" width="250" height="100"></canvas>

</div>
</body>
<script type="text/javascript">
new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
        data: [2478,5267,734,784,433]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});

new Chart(document.getElementById("myChart"), {
	type: 'bar', 
	data: { labels: ['감','오렌지','사과'], 
		datasets: [{ label: '과일 판매량', 
			backgroundColor: ['rgba(255, 99, 132, 0.2)',  'rgba(255, 159, 64, 0.2)',  'rgba(75, 192, 192, 0.2)'],
			borderColor: ['black',
				'rgb(255, 99, 132)',
		      'rgb(255, 205, 86)'],
			data: [4 ,10, 5,] }] }, });
			
			
			
var ctx = document.getElementById('lineChart');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
		labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
		datasets: [{
			label: '# of Votes',
			data: [12, 19, 3, 5, 2, 3],
			backgroundColor: [
					'rgba(0, 0, 0, 0)'
			],
			borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
			],
			borderWidth: 2
		}]
	},
	options: {
		responsive: false,
		tooltips: {
			enabled: false
		},
		hover: {
			animationDuration: 0
		},
		animation: {
			duration: 1,
			onComplete: function () {
				var chartInstance = this.chart,
					ctx = chartInstance.ctx;
				ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
				ctx.fillStyle = 'purple';
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
		}
	}
});			

</script>
</html>