<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h2>${title}</h2>
</c:if>


<div class="glide glide-multi" id="glide-${compid}">
	<div class="glide__track" data-glide-el="track">	
		<div class="glide__slides">		
    		<c:forEach var="child" items="${children}" varStatus="status">
    		
    			<a class="glide__slide ${popup?'popup ':''}nav-link${child.selected?' active':''}" href="${child.url}">
    			
    				<jv:changeFilter var="newURL" url="${child.image.previewURL}" filter="list" newFilter="bloc-2-2" />	
					<img class="img-fluid" src="${newURL}" alt="${child.image.description}" />
					
					<div class="text-wrapper">${child.fullLabel}</div>
    			
    			
    			</a>
    		
			</c:forEach>
		</div>
		<div class="glide__arrows" data-glide-el="controls">
			<button class="glide__arrow glide__arrow--left" data-glide-dir="<"><i class="fas fa-angle-left"></i></button>
			<button class="glide__arrow glide__arrow--right" data-glide-dir=">"><i class="fas fa-angle-right"></i></button>
		</div>
	</div>
</div>
</c:if> 

<script>
{
	const GLIDE_OPTIONS = {
		perView: 4
	}
	if (typeof Glide != "undefined") {
		new Glide('#glide-${compid}', GLIDE_OPTIONS).mount();
	} else {
		document.addEventListener("DOMContentLoaded", function(event) { 
			new Glide('#glide-${compid}', GLIDE_OPTIONS).mount();
		});
	}
}
</script>