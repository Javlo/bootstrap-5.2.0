<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty param.shortList}">
		<div class="short">
	</c:if>	
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>	
	<c:if test="${fn:length(taxonomyList)>0}">
		<div class="taxonomy"><c:forEach var="taxo" items="${taxonomyList}">
			<div class="badge badge-secondary name-${taxo.name}">${taxo.label}</div>
			</c:forEach></div>
	</c:if>
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>
	<ul class="products">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<c:set var="image" value="${null}" />
			<c:if test="${fn:length(page.images)>0 && param.image}">
				<c:set var="image" value="${page.images[0]}" />
			</c:if>
			<c:set var="style" value="" />
			<c:set var="cssClass" value="" />
			<c:if test="${page.color.filled}">
				<c:set var="style" value='style="background-color: ${page.color.HTMLCode}; color: ${page.color.text.HTMLCode};"' />
				<c:set var="cssClass" value=" page-color color-${page.color.dark?'dark':'ligth'}" />	
			</c:if>
			<li class="item-${status.index+1} ${status.index%2==0?'odd':'even'} ${page.toTheTopLevel>0?'top':''}${cssClass}" ${style}>
				<div class="thumbnail">
				<c:if test="${globalContext.collaborativeMode && not empty page.creator}">
						<div class="authors">${page.creator}</div>
					</c:if>
					<c:if test="${page.contentDate}"><span class="date">${page.date}</span></c:if>
					<h3><a title="${page.titleForAttribute}" href="${page.linkOn}">${page.title}</a></h3>
					<figure>
						<a title="${page.titleForAttribute}" href="${page.linkOn}">
							<img class="img-responsive" src="${image.url}" class="frame" alt="${image.description}" />
						</a>
					</figure>
				<div class="caption">
					<c:if test="${not empty page.description && empty param.shortList}">
						<p class="description">${page.description}</p>
					</c:if>
				</div></div></li>
		</c:forEach>
	</ul>
	<c:if test="${not empty param.shortList}">
		</div>
	</c:if>
</c:if>