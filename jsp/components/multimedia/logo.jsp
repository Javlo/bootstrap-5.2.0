<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<div class="multimedia ${param.large?'large':''} logo-multimedia">
	<div class="images-wrapper">
	<c:set var="imageList" value="" />
	<c:forEach var="resource" items="${resources}" varStatus="status"><c:set var="display" value="false" />
		<div class="image-wrapper">
			<jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="logo-gallery" />
			<img id="img-${compid}-${status.index}" class="rounded img-responsive" data-caption="${resource.allInfoText}" alt="${resource.allInfoText} - ${i18n.view['global.enlargeimage']}" src="${newURL}" />
			<c:set var="titleHTML" value="" />		
		</div>
		<c:set var="imageList" value="${imageList}<div class=\"image-wrapper\"><img id=\"img-${compid}-${status.index}\" class=\"rounded img-responsive\" data-caption=\"${resource.allInfoText}\" alt=\"${resource.allInfoText} - ${i18n.view['global.enlargeimage']}\" src=\"${newURL}\" alt=\"${resource.title}\" /></div>" />
	</c:forEach>
	<c:forEach begin="0" end="${((30-fn:length(resources))/fn:length(resources))}">
		${imageList}
	</c:forEach>
</div>
</div>
