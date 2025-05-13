<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${fn:length(taxonomyList)>0}">
		<div class="taxonomy"><c:forEach var="taxo" items="${taxonomyList}">
			<div class="badge badge-secondary name-${taxo.name}">${taxo.label}</div>
			</c:forEach></div>
	</c:if>
	<div class="container mt-5 mb-5">
			<c:if test="${not empty title}"><h2>${title}</h2></c:if>
	<ul class="timeline-list">
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
			<li class="item item-${status.index+1} ${status.index%2==0?'odd':'even'} ${page.toTheTopLevel>0?'top':''}${cssClass}" ${style}>
				<div class="thumbnail"><div class="row">
					<div class="col-md-${param.image?'9':'12'} col-caption">
					<div class="caption">
						<c:if test="${globalContext.collaborativeMode && not empty page.creator}">
							<div class="authors">${page.creator}</div>
						</c:if>
						<c:if test="${page.contentDate}">
						<span class="date"><i class="bi bi-calendar"></i> ${page.date}</span>
						</c:if>
						<h3><${page.realContent?'a':'div'} ${popup?'class="popup" ':''}title="${page.titleForAttribute}" href="${page.linkOn}">${page.title}</${page.realContent?'a':'div'}></h3>
						<c:if test="${not empty page.description && empty param.shortList}">
							<p class="description">${page.description}</p>
						</c:if>					
					</div><c:if test="${not empty image}">
						<div class="col-md-3 col-img">
						<figure>
							<a ${popup?'class="popup" ':''}title="${page.titleForAttribute}" href="${page.linkOn}">
								<img class="img-responsive" src="${image.url}" class="frame" alt="${image.description}" />
							</a>
						</figure>
						</div>
					</c:if>
					</div>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
	</div>
</c:if>