<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${not empty link}"><a href="${link}"></c:if>
<div class="count">
<span class="odometre-${compid} hours time" id="hours-odometre-${compid}">0</span>
<span class="sep">:</span>
<span class="odometre-${compid} minutes time" id="minutes-odometre-${compid}">0</span>
<span class="sep">:</span>
<span class="odometre-${compid} seconds time" id="seconds-odometre-${compid}">0</span>
<c:if test="${not empty label}"><div class="label">${label}</div></c:if>
</div>
<c:if test="${not empty link}"></a></c:if>
<script type="text/javascript">
var initPodoValue${compid} = ${second};
var podo${compid} = document.querySelectorAll('.odometre-${compid}');
document.addEventListener("DOMContentLoaded", function(event) { 	
	document.querySelectorAll('.odometre-${compid}').forEach(function(element) {
		od = new Odometer({
		el: element,
		value: 0,
		format: '',
		theme: 'default',
		duration: 800,
		animation: ''
		});
	});
});
setInterval(function(){
	initPodoValue${compid} = initPodoValue${compid}-1;
	document.querySelector('#hours-odometre-${compid}').innerHTML = Math.trunc(initPodoValue${compid}/60/60);
	document.querySelector('#minutes-odometre-${compid}').innerHTML = Math.trunc(initPodoValue${compid}/60/60*60)-Math.trunc(initPodoValue${compid}/60/60)*60;
	document.querySelector('#seconds-odometre-${compid}').innerHTML = 1+initPodoValue${compid}-Math.trunc(initPodoValue${compid}/60/60)*60*60-(Math.trunc(initPodoValue${compid}/60/60*60)-Math.trunc(initPodoValue${compid}/60/60)*60)*60;
	}, 1000);

</script>