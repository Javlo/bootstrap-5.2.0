<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="thumbnail">
	<video id="vid${compid}" data-autoresize="fit" poster="${previewURL}" muted ${not empty param.loop?'loop ':''}preload="auto">
		<source type="video/mp4" src="${url}" />
	</video>
<div class="caption">
<div class="container">	
<c:if test="${not empty label}"><div class="caption">${label}</div></c:if>
<h1>${info.pageTitle}</h1>
<c:if test="${not empty info.pageDescription}"><p>${info.pageDescription}</p></c:if>
</div></div></div>
<script>
document.querySelector('#vid${compid}').playbackRate = 0.8;
document.querySelector('#vid${compid}').play();
</script>