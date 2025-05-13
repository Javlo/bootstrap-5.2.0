<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${fn:length(resources)>0}"><div id="carousel-${compid}" class="slide ${param.caption?'with-caption':'without-caption'}">
<c:if test="${not empty title}"><h2>${title}</h2></c:if>
<!-- Slideshow 1 -->
<ul class="rslides" id="slider1">
<c:forEach var="resource" items="${resources}" varStatus="status">
<jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="slide" />
<li><img alt="${resource.title}" src="${newURL}"></li>
<c:if test="${!resource.staticInfo.emptyInfo && param.caption}"> 
<c:if test="${not empty resource.staticInfo.title || not empty resource.staticInfo.description || not empty resource.staticInfo.copyright}">
<div class="caption d-none d-md-block">
	<c:if test="${not empty resource.staticInfo.title}"><p class="caption">${resource.staticInfo.title}</p></c:if>
</div>     
</c:if></c:if>
</c:forEach>
</ul>

<script>
function initrs${compid}() {
	//Slideshow 4
	$("#slider4").responsiveSlides({
	  auto: false,
	  pager: false,
	  nav: true,
	  speed: 500,
	  namespace: "callbacks",
	  before: function () {
	    $('.events').append("<li>before event fired.</li>");
	  },
	  after: function () {
	    $('.events').append("<li>after event fired.</li>");
	  }
	});
}
if (window.jQuery) {
	initrs${compid}();
} else {
	document.addEventListener("DOMContentLoaded", function(event) {initrs${compid}()});
}
</script></c:if>