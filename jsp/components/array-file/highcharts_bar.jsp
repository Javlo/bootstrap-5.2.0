<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>

<div id="container-${compid}"></div>

<script>
    var chart = Highcharts.chart('container-${compid}', {

    chart: {
        type: 'column'
    },

    title: {
        text: '${summary}'
    },

    legend: {
        align: 'right',
        verticalAlign: 'middle',
        layout: 'vertical'
    },

    xAxis: {
        categories: [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array[0])-1}">${sep}'${array[0][i]}'<c:set var="sep" value="," /></c:forEach>],
        labels: {
            x: -10
        }
    },

    yAxis: {
        allowDecimals: true,
        title: {
            text: '${legend}'
        }
    },

	<c:set var="sepX" value="" />	
    series: [	
	<c:forEach var="j" begin="1" end="${fn:length(array)-1}">
	${sepX}{
        name: '${array[j][0]}',
        data: [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array[0])-1}">${sep}${array[j][i].doubleValue}<c:set var="sep" value="," /></c:forEach>]
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