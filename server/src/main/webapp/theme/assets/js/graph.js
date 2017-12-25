$(function () {
	if(!$('#graph').length) return;
	
    $('#graph').highcharts({
       
     title: {
         text: 'Monthly',
         x: -20 //center
     },
     subtitle: {
         text: 'Source: webbook',
         x: -20
     },
     xAxis: {
         categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
             'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
     },
     yAxis: {
         title: {
             text: 'Number'
         },
         plotLines: [{
             value: 0,
             width: 1,
             color: '#808080'
         }]
     },
     tooltip: {
         valueSuffix: ''
     },
     legend: {
         layout: 'vertical',
         align: 'right',
         verticalAlign: 'middle',
         borderWidth: 0
     },
     series: window.graphData
    });
});