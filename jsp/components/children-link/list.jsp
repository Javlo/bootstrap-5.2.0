<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children) gt 0}">
<c:if test="${not empty title}"><div class="panel-heading"><h3 class="panel-title">${title}</h3></div></c:if>
<div class="list-group ${page.page.depth == start?' nav nav-sidebar nav-pills':''} list-group"><c:set var="linkIndex" value="1" />	
	<c:forEach var="page" items="${children}" varStatus="status">
		<c:if test="${page.visible}">
			<a href="${page.url}" title="${page.fullLabel}" class="${popup?'popup ':''}list-group-item list-group-item-action ${page.selected ? "active" : "unactive" } ${page.lastSelected ? "final-active " : "not-final-active" }${page.page.name} index-${linkIndex}"><c:set var="linkIndex" value="${linkIndex+1}" />
				${page.fullLabel}</a>	        
		</c:if>				 			
	</c:forEach>
</div>
</c:if>