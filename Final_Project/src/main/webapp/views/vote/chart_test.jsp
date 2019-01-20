<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart(){
	var data = google.visualization.arrayToDataTable([
			['제목', '득표수', { role: 'style' }],
			['', 23, 'color: #76A7FA']
		]);
	
	var options = {
			chartArea: {
// 		        width: 300,
// 		        height: 50,
		        bar: {groupWidth: "100%"}},
			hAxis : {
				minValue: 0},
		    legend: { position: "none" }
	};
	
	var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
	chart.draw(data, options);
	}
</script>
</head>

<body>
<!--Div that will hold the pie chart-->
<div id="chart_div"></div>
</body>
</html>