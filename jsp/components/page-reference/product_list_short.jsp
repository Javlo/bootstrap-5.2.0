<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty param.shortList}">
		<div class="short">
	</c:if>	
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>	
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>

	<div class="products short">
	<div class="row">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<c:set var="image" value="${null}" />
			<c:if test="${fn:length(page.images)>0 && param.image}">
				<c:set var="image" value="${page.images[0]}" />
			</c:if>
			<!-- portfolio item -->
			<div class="item-${status.index+1} col-xs-6 col-sm-3"><div class="thumbnail"><c:if test="${not empty image}">
					<c:if test="${not empty param.number && param.number == 'true'}">
					<div class="number">${status.index+1}</div>
					</c:if>				
					<figure>
						<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="reference-list-short" />
						<a ${popup?'class="popup" ':''}title="${page.title}" href="${page.url}"> <img class="img-responsive" src="${newURL}" class="frame" alt="${image.description}" />
						</a>
					</figure>
				</c:if>
				<div class="caption">
					<c:if test="${globalContext.collaborativeMode && not empty page.creator}">
						<div class="authors">${page.creator}</div>
					</c:if>
					<c:if test="${page.contentDate && comp.displayDate}"><span class="date">${page.date}</span></c:if><h3><a title="${page.title}" href="${page.url}">${page.title}</a></h3>
					<c:if test="${not empty page.description && empty param.shortList}">
						<p class="description">${page.description}</p>
					</c:if>
				</div></div></div>
			<!-- / portfolio item -->
			<c:if test="${status.index > 0 && (status.index+1) % 4 == 0 && !status.last}"></div><div class="row"></c:if>
		</c:forEach>
	</div></div>
	<c:if test="${not empty param.shortList}">
		</div>
	</c:if>
</c:if>