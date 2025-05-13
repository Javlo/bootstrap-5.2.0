<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><a href="${url}" id="${previewID}" class="card ${comp.style} ${previewCSS}" ${previewData}>
<c:if test="${not empty page.image}">
	<jv:changeFilter var="newURL" url="${page.image.previewURL}" filter="standard" newFilter="bloc-6-4" />
	<img src="${newURL}" class="card-img-top" alt="${page.image.description}" />
</c:if>
<c:if test="${not empty textLabel || not empty page.description.text}">
<div class="card-body">
	<c:if test="${not empty textLabel}"><h${contentContext.titleDepth+1}>${page.titleOrSubtitle}</h${contentContext.titleDepth+1}></c:if>
	<c:if test="${not empty page.description.text}"><p class="card-text">${page.description}</p></c:if>
</div>
</c:if>
<div class="card-footer text-center">
	<c:if test="${not empty param.font}"><span class="deco"><i class="${param.font}"></i></span></c:if>
	${label}
</div>
</a>