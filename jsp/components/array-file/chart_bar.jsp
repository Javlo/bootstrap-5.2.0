<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div>
	<canvas id="myChart"></canvas>
</div>

<script>
	const ctx = document.getElementById('myChart');

	new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array[0])-1}">${sep}'${array[0][i]}'<c:set var="sep" value="," /></c:forEach>],
			datasets : [ {
				label : '${summary}',
				data : [<c:set var="sep" value="" /><c:forEach var="i" begin="1" end="${fn:length(array[0])-1}">${sep}${array[1][i].doubleValue}<c:set var="sep" value="," /></c:forEach>],
				borderWidth : 1
			} ]
		},
		options : {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		}
	});
</script>
