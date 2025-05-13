<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h2>${title}</h2>
</c:if>
<div class="links children-link numbered ${param.numbered?'numbered':''} d-sm-flex justify-content-between flex-wrap ml-n3 mr-n3">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
	<div class="flex-fill pl-3 pr-3">
		<a class="btn btn-outline-info btn-rounded waves-effect btn btn-shadow btn-${child.selected?'':'outline-'}info${popup?' popup':''} ${child.layouts} child-${child.position} ${child.selected?'active':'unactive'} w-100" href="${child.url}">
			<c:if test="${param.numbered}"><span class="number">${child.position}</span></c:if>
			<c:if test="${not empty child.font}">${child.font}</c:if>
			${child.fullLabel}
		</a>
	</div>
</c:if></c:forEach>
</div>
</c:if> 