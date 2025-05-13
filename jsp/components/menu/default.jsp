<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if test="${fn:length(page.children) gt 0}">
	<c:if test="${page.info.depth >= start}">
		<c:if test="${not empty title && !param.rec}">
			<div class="panel-heading">
				<h3 class="panel-title">${title}</h3>
			</div>
		</c:if>
		<ul class="panel-title menu${page.info.depth == start?' nav nav-sidebar nav-pills':''}">
			<c:set var="linkIndex" value="1" />
			<c:forEach var="page" items="${page.children}" varStatus="status">
				<c:if test="${page.info.visible || allPages}">
					<c:if test="${page.info.depth <= end && (page.visible || allPages)}">
						<li class="depth-${page.info.depth} ${page.selected ? "active" : "not-active" } ${page.lastSelected ? "final-active " : "not-final-active" }${page.name} index-${linkIndex}">
							<c:set var="linkIndex" value="${linkIndex+1}" />
							<a href="${page.url}" title="${page.info.title}">
								<span>${page.info.label}</span> <i class="bi bi-caret-left"></i>
							</a>
							<c:if test="${page.selected}"><c:set var="page" value="${page}" scope="request" /><jsp:include page="default.jsp?rec=true" /></c:if>
						</li>
					</c:if>
				</c:if>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${page.info.depth < start}">
		<c:forEach var="page" items="${page.children}" varStatus="status">
			<c:if test="${page.selected}">
				<c:set var="page" value="${page}" scope="request" />
				<jsp:include page="default.jsp" />
			</c:if>
		</c:forEach>
	</c:if>
</c:if>