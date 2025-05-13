<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h2>${title}</h2>
</c:if>
<div class="children-link numbered round-number">
<ul>
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
	<li><a class="${child.selected?'active':'unactive'}${popup?' popup ':''} ${contentArea?' content-area-only ':''}${child.layouts} child-${child.position}" href="${child.url}" title="${child.fullLabel}" data-name="${child.page.name}">
		<span class="number">${child.position}</span><span class="number-label">${child.fullLabel}</span>
	</a></li>
</c:if></c:forEach>
</ul>
</div>
</c:if>