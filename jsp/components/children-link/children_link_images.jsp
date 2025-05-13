<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${fn:length(children)>0}"><c:if test="${not empty title}"><h3>${title}</h3></c:if>
<div class="row links images children-link">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
	<div class="col-12 col-md-6 item" ><a class="${popup?'popup ':''}" href="${child.url}" title="${child.fullLabel}">
	<figure>
	<jv:changeFilter var="newURL" url="${child.image.previewURL}" filter="list" newFilter="reference-list" />	
	<img class="img-responsive" src="${child.image.previewURL}" alt="${child.image.description}" />
	<figcaption>${child.fullLabel}</figcaption>
	</figure>	
	</a></div>
</c:if></c:forEach>
</div>
</c:if> 