<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
#static-map-${compid} {
	position: relative;
}
#static-map-${compid} .point {
	position: absolute;
	text-align: center;
}
#static-map-${compid} .point svg {
	width: 32px;
	height: 32px;
}
#static-map-${compid} img {
	width: 100%;
}
</style>

<div id="static-map-${compid}">
	<img src="${map}" alt="map" />
</div>


<script>
	var iconHtml = '<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16"><path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/> </svg>';
	var points = new Map([<c:set var="sep" value="" /><c:forEach var="point" items="${points}">${sep}["${point.key}", [${point.value}]]<c:set var="sep" value="," /></c:forEach>]);

	var topLeft = [${topLeftCoord}];
	var bottomRight = [${bottomRightCoord}];
	
	var mapItem = document.getElementById("static-map-${compid}");
	
	
	function setPointer(latitude, longitude, info) {
		let posY = (latitude-Math.min(topLeft[0], bottomRight[0]))/(Math.abs(bottomRight[0]-topLeft[0]));		
		posY = Math.round(posY*mapItem.offsetHeight);
		if (topLeft[0]>bottomRight[0]) {
			posY = mapItem.offsetHeight-posY;
		}
		
		let posX = (longitude-Math.min(topLeft[1], bottomRight[1]))/(Math.abs(bottomRight[1]-topLeft[1]));
		posX =  Math.round(posX*mapItem.offsetWidth);
		if (topLeft[1]>bottomRight[1]) {
			posX = mapItem.offsetWidth-posX;
		}

		var point = document.createElement("div");
		point.setAttribute("class", "point");
		point.setAttribute("style", "left:"+(posX-16)+"px; top:"+(posY-32)+"px;");
		point.innerHTML = iconHtml+'<div class="info">'+info+'</div>';
		mapItem.appendChild(point);
	}
	
	document.addEventListener("DOMContentLoaded", function(event) { 
		
	});
	
	var img = document.querySelector('#static-map-${compid} img')

	function refreshPoints() {
		points.forEach(function(val, key, map) {
			setPointer(val[0], val[1], key);
		});
	}

	if (img.complete) {
		refreshPoints()
	} else {
		img.addEventListener('load', refreshPoints)
		img.addEventListener('error', function() {
		console.log("error on load image.");
		})
	}
</script>
