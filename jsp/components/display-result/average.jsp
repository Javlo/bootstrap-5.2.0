<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${info.rootTemplateURL}/lib/chartjs/chart.js"></script>
<script src="${info.rootTemplateURL}/lib/chartjs/plugin/chartjs-plugin-annotation.min.js"></script>

<h1>${title}</h1>

<c:set var="color1" value="rgba(0, 128, 0, 0.4)" />
<c:set var="border1" value="rgba(0, 128, 0, 0.8)" />
<c:set var="color2" value="rgba(0, 255, 255, 0.4)" />
<c:set var="border2" value="rgba(0, 255, 255, 0.8)" />
<c:set var="color3" value="rgba(255, 255, 0, 0.4)" />
<c:set var="border3" value="rgba(255, 255, 0, 0.8)" />
<c:set var="color4" value="rgba(247, 110, 17, 0.4)" />
<c:set var="border4" value="rgba(247, 110, 17, 0.8)" />
<c:set var="color5" value="rgba(255, 0, 0, 0.4)" />
<c:set var="border5" value="rgba(255, 0, 0, 0.8)" />

<c:set var="gray1" value="rgba(160, 160, 160, 0.6)" />
<c:set var="grayborder1" value="rgba(80, 80, 80, 0.6)" />

<div class="average">
	<div class="row" style="font-size: 0.9em">
		<hr />
		<div class="row justify-content-between mb-3">			
			<div style="text-transform: capitalize;" class="col-2 legend">${vi18n['global.legend']}</div>		
			<div class="col-2" style="text-align: center; background-color: ${color1}; border: 1px ${border1} solid;">
				3.75 <i class="bi bi-arrow-right-short"></i> 5
			</div>
			<div class="col-2" style="text-align: center; background-color: ${color3}; border: 1px ${border3} solid;">
				3.25 <i class="bi bi-arrow-right-short"></i> 3.74
			</div>
			<div class="col-2" style="text-align: center; background-color: ${color5}; border: 1px ${border5} solid;">
				0 <i class="bi bi-arrow-right-short"></i> 3.25
			</div>
		</div>
		<hr />
	</div>
	
	<canvas id="averageChart" style="height:${100+60*fn:length(average)}px; width:100%"></canvas>
	<div class="d-flex flex-row-reverse bd-highlight">
		<i class="bi bi-person-fill"></i>
		<div class="participants">${participants}&nbsp;</div>
	</div>
	
</div>

<script>
const labels = [
	<c:set var="sep" value="" />
	<c:forEach var="entry" items="${average}">
		${sep}<c:set var="valueParts" value="${fn:split(entry.key, '#')}" /><c:set var="sep2" value="" />[<c:forEach var="part" items="${valueParts}">${sep2}"${part}"<c:set var="sep2" value="," /></c:forEach>]<c:set var="sep" value="," />
	</c:forEach>
  ];
const data = {
  labels: labels,  
  datasets: [{
    axis: 'y',
    label: '${title}',
    data: [<c:set var="sep" value="" /><c:forEach var="entry" items="${average}">${sep}${entry.value}<c:set var="sep" value="," /></c:forEach>],
    fill: false,
    backgroundColor: [
    	<c:set var="sep" value="" /><c:forEach var="entry" items="${average}">${sep}
   			<c:if test="${entry.value>=3.75}"> '${color1}'</c:if>
   			<c:if test="${entry.value<3.75 && entry.value>=3.25}"> '${color3}'</c:if>
   			<c:if test="${entry.value<3.25}"> '${color5}'</c:if><c:set var="sep" value="," /></c:forEach>
    ],
    borderColor: [
    	<c:set var="sep" value="" /><c:forEach var="entry" items="${average}">${sep}
		<c:if test="${entry.value>=3.75}"> '${border1}'</c:if>
   		<c:if test="${entry.value<3.75 && entry.value>=3.25}"> '${border3}'</c:if>
   		<c:if test="${entry.value<3.25}"> '${border5}'</c:if><c:set var="sep" value="," /></c:forEach>
    ],
    borderWidth: 1
  },
  <c:if test="${not empty average2}">
  {
	    axis: 'y',
	    label: 'ref',
	    data: [<c:set var="sep" value="" /><c:forEach var="entry" items="${average2}">${sep}${entry.value}<c:set var="sep" value="," /></c:forEach>],
	    fill: false,
        backgroundColor: [
    	<c:set var="sep" value="" /><c:forEach var="entry" items="${average2}">${sep}'${gray1}'<c:set var="sep" value="," /></c:forEach>
        ],
        borderColor: [
            <c:set var="sep" value="" /><c:forEach var="entry" items="${average2}">${sep}'${grayborder1}'<c:set var="sep" value="," /></c:forEach>
        ],
	    borderWidth: 1
	  },
  </c:if><c:if test="${not empty average3}">
  {
	    axis: 'y',
	    label: 'ref',
	    data: [<c:set var="sep" value="" /><c:forEach var="entry" items="${average3}">${sep}${entry.value}<c:set var="sep" value="," /></c:forEach>],
	    fill: false,
	    borderWidth: 1
	  }
</c:if>],
  
};

const annotation = {
  type: 'line',
  borderColor: 'rgba(60, 60, 60, 0.8)',
  borderDash: [6, 6],
  borderDashOffset: 0,
  borderWidth: 2,
  label: {
    enabled: true,
    content: (ctx) => "${globalAverage}",
    position: 'start'
  },
  scaleID: 'x',
  value: (ctx) => ${globalAverage}
};


/** max=${max} **/
const config = {
    type: 'bar',
    data: data,
    responsive: false,
    options: {
    	maintainAspectRatio: true,
   	    plugins: {
   	      legend: {
   	    	 display: false	
   	      },
   	   	  annotation: {
           annotations: {
        	   annotation
           }
          }
   	    },
   	    scales: {
   	     yAxes: {
	            ticks: {
	                font: {
	                    size: 15,
	                }
	            }
	        },
	        
   	    	<c:if test="${not empty max || not empty min}">
         		x: {
        	 		<c:if test="${not empty min}">min: ${min},</c:if>
        	 		<c:if test="${not empty max}">max: ${max}</c:if>
         		}
   	    	</c:if>
    	 },
		indexAxis: 'y'
   	  }
 };
const stackedBar = new Chart(document.getElementById('averageChart'),config);

</script>
