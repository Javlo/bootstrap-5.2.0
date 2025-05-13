<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h2>${title}</h2>
</c:if>
<div class="links children-link numbered ${param.numbered?'numbered':''}">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
	<a class="btn btn-${child.selected?'':'outline-'}secondary${popup?' popup':''} ${child.layouts} child-${child.position} ${child.selected?'active':'unactive'}" href="${child.url}">
		<c:if test="${param.numbered}"><span class="number">${child.position}</span></c:if>
		${child.fullLabel}
	</a>
</c:if></c:forEach>
</div>
</c:if> 