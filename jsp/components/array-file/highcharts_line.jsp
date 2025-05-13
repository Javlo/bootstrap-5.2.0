<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>

<div id="container-${compid}"></div>

<script>
    var chart = Highcharts.chart('container-${compid}', {

   

    title: {
        text: '${summary}'
    },

    legend: {
    	layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },
    
    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },          
        }
    },
    
    xAxis: {
    	categories: [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array)-1}">${sep}${array[i][0]}<c:set var="sep" value="," /></c:forEach>]
    },

    yAxis: {
        allowDecimals: true,
        title: {
            text: '${legend}'
        }
    },

	<c:set var="sepX" value="" />	
    series: [	
	<c:forEach var="j" begin="1" end="${fn:length(array[0])-1}">
	${sepX}{
        name: '${array[0][j]}',
        data: [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array)-1}">${sep}${array[i][j].doubleValue}<c:set var="sep" value="," /></c:forEach>]
    }<c:set var="sepX" value="," />	
	</c:forEach>
	],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    align: 'center',
                    verticalAlign: 'bottom',
                    layout: 'horizontal'
                },
                yAxis: {
                    labels: {
                        align: 'left',
                        x: 0,
                        y: -5
                    },
                    title: {
                        text: null
                    }
                },
                subtitle: {
                    text: null
                },
                credits: {
                    enabled: false
                }
            }
        }]
    }
});
</script>