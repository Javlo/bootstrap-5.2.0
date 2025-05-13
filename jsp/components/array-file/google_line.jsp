<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<div id="gbar-${compid}" style="width: 100%; height: 500px;"></div>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = google.visualization.arrayToDataTable([	
    	<c:forEach var="j" begin="0" end="${fn:length(array)-1}">${sepX}
        [<c:set var="sep" value="" /><c:forEach var="i" begin="0" end="${fn:length(array[0])-1}">${sep}<c:set var="cellValue" value="'${array[j][i].value}'" />${i>0&&j>0?array[j][i].doubleValue:cellValue}<c:set var="sep" value="," /></c:forEach>]<c:set var="sepX" value="," />	            
    	</c:forEach>
    ]);

    var options = {          
        title: '${summary}',            
        backgroundColor: 'transparent'
    };

    var chart = new google.visualization.LineChart(document.getElementById('gbar-${compid}'));

    chart.draw(data, options);

  }
</script>
