<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>	
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>
	<ul class="products button">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<li class="item-${status.index+1}">
				<a class="btn ${page.name == info.page.name?'btn-primary':'btn-secondary'}" href="${page.url}">${not empty page.title?page.title:page.name}</a>
			</li>
		</c:forEach>
	</ul>
</c:if>