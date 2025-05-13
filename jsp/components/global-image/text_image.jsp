<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
<div ${previewAttributes}>
<div class="row img-${comp.id}">
<div class="col-md-6">
<c:choose>
<c:when test="${link eq '#'}">
<figure>
<span class="nolink">
<img src="${previewURL}" srcset="${smURL} (max-width: 640px), ${lgURL} 2x" alt="${file.title}" />
<c:if test="${not empty file.title}"><figcaption>${file.title}</figcaption></c:if>
</span>
</figure>
</c:when>
<c:otherwise>
<figure>
<c:set var="rel" value="${fn:startsWith(url,'http://')?'external':'shadowbox'}" />
<c:set var="rel" value="${fn:endsWith(url,'.pdf')?'pdf':rel}" />
<a rel="${rel}" class="${type}" href="${url}" title="${not empty label?cleanLabel:cleanDescription}">
	<c:set var="imageWidthTag" value='width="${imageWidth}" ' />
	<img ${not empty imageWidth?imageWidthTag && filter!='raw':''}src="${previewURL}" alt="${not empty description?cleanDescription:cleanLabel}" />
</a>
</figure>
</c:otherwise>
</c:choose>

</div><div class="col-md-6 text">${text}</div>
</div>
</div>

<script>document.addEventListener("DOMContentLoaded", function(event) { 
	initPhotoSwipeFromDOM('.img-${comp.id} a');	
});</script>