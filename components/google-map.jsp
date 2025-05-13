<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%>
<c:if test="${empty social.google.apiKey}">
<div class="alert alert-danger">${comp.type} : no google api key defined in social module.</div>
</c:if><c:if test="${not empty social.google.apiKey}"><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%><div id="map" class="google-map map"></div>
 	<script type="text/javascript">
		var geocoder;
		var map;
		var address ="${address.value}";
		function initMap() {
			geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(0, 0);
			var myOptions = {
			zoom: ${zoom.value},
			center: latlng,
			mapTypeControl: true,
			mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
			navigationControl: true,
			mapTypeId: google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById("map"), myOptions);
			if (geocoder) {
			geocoder.geocode( { 'address': address}, function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
				if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {
				map.setCenter(results[0].geometry.location);
		
					var infowindow = new google.maps.InfoWindow(
						{ content: '<b>'+address+'</b>',
						size: new google.maps.Size(150,50)
						});
		
					var marker = new google.maps.Marker({
						position: results[0].geometry.location,
						map: map, 
						title:address
					}); 
					google.maps.event.addListener(marker, 'click', function() {
						infowindow.open(map,marker);
					});
		
				} else {
					alert("No results found");
				}
				} else {
				alert("Geocode was not successful for the following reason: " + status);
				}
			});
			}
		}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=${social.google.apiKey}&callback=initMap"
		async defer></script>	
</div></c:if>