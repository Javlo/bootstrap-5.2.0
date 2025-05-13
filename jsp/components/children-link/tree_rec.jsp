<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<ul class="links">
<c:forEach var="child" items="${children}" varStatus="status">
	<li class="${child.layouts} node-${param.depth} ${child.selected?'selected':'unselected'} ${param.depth>0?'block-close':'block-open'}"><a class="tree-command" href="${child.url}">${child.fullLabel}</a>
	<c:if test="${not empty child.description && not empty child.description.text || not empty child.image}">
		<div class="info-wrapper row">
		<c:if test="${not empty child.image}"><div class="col-1 align-self-center"><img class="img-thumbnail" src="${child.image.previewURL}" alt="${child.image.description}" /></div></c:if>	
		<c:if test="${not empty child.description}"><div class="col align-self-center"><div class="description">${child.description.html}</div></div></c:if>
		</div>
	</c:if>
	<c:if test="${fn:length(child.children) > 0}">
		<c:set var="children" value="${child.children}" scope="request" />
		<jsp:include page="tree_rec.jsp?depth=${param.depth+1}" />
	</c:if>
	</li>
</c:forEach>
</ul>

