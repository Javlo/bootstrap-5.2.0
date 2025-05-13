<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${fn:length(resources)>0}"><div class="${param.caption?'with-caption':'without-caption'}">
<c:if test="${not empty title}"><h2>${title}</h2></c:if>
<div class="glide" id="glide-${compid}">
<div class="glide__track" data-glide-el="track">
<div class="glide__slides">
  <c:forEach var="resource" items="${resources}" varStatus="status">
  	<div class="glide__slide item${status.index==0?' active':' unactive'}">
  	  <jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="slide" />
      <img alt="${resource.title}" src="${newURL}" />
      <c:if test="${!resource.staticInfo.emptyInfo && param.caption}"> 
      <c:if test="${not empty resource.staticInfo.title || not empty resource.staticInfo.description || not empty resource.staticInfo.copyright}">
      <div class="caption d-none d-md-block container">
      	<c:if test="${not empty resource.staticInfo.title}"><p class="title">${resource.staticInfo.title}</p></c:if>
      	<c:if test="${not empty resource.staticInfo.description}"><p class="description">${resource.staticInfo.description}</p></c:if>
      	<c:if test="${not empty resource.staticInfo.copyright}"><span class="copyright">&copy; ${resource.staticInfo.copyright}</span></c:if>
      </div>     
      </c:if></c:if>
    </div>
  </c:forEach>
  </div>
  
  <div class="glide__bullets" data-glide-el="controls[nav]">
   <c:forEach var="resource" items="${resources}" varStatus="status">
   <button class="glide__bullet" data-glide-dir="=${status.index}"></button>
   </c:forEach>
  </div>
  
</div>
</div>
</div>
<c:if test="${empty glideJsInsered}">
	<c:set var="glideJsInsered" value="true" scope="request" />
	<script src="${info.rootTemplateURL}/lib/glide/glide.min.js"></script>
	<link rel="stylesheet" href="${info.rootTemplateURL}/lib/glide/css/glide.all.css" />
</c:if>
<script>
if (typeof Glide != "undefined") {
	new Glide('#glide-${compid}').mount();
} else {
	document.addEventListener("DOMContentLoaded", function(event) { 
		new Glide('#glide-${compid}').mount();
	});
}
</script></c:if>