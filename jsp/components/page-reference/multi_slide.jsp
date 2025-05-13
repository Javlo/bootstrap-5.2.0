<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><div class="${param.size}-slide multi-slide">
	<div class="commands">
		<a class="previous btn btn-default" id="previous" href="#previous">
		<i class="bi bi-arrow-left-short"></i>
		<span class="text" lang="en">${vi18n['global.previous']}</span>
		</a>
		<a class="next btn btn-default" id="next" href="#next">
		<i class="bi bi-arrow-right-short"></i>
		<span class="text" lang="en">${vi18n['global.next']}</span>
		</a>
	</div>
	<div id="${param.size}-slide-${compid}" class="slideshow-container">
		<div class="slideshow-row">
			<c:forEach items="${pages}" var="page" varStatus="status">
				<c:set var="image" value="${null}" />
				<div class="slideshow-item">
					<div class="slideshow-item-content">
						<c:if test="${page.link}">
							<a href="${page.linkOn}">
						</c:if>
						<c:if test="${fn:length(page.images)>0 && param.image}">
							<c:set var="image" value="${page.images[0]}" />
							<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="${empty param.imageFilter?'bloc-4-4':param.imageFilter}" />
							<img alt="${page.title}" src="${newURL}" />
						</c:if>
						<div class="text">
							<div class="text-wrapper">
								<c:if test="${page.contentDate}">
									<p class="date">${page.modificationDate}</p>
								</c:if>
								<h2>${page.title}</h2>
								<c:if test="${not empty page.xhtmlDescription && page.xhtmlDescription != 'no desc'}">
									<p class="description">${page.xhtmlDescription}</p>
								</c:if>
							</div>
						</div>
						<c:if test="${page.link}">
							</a>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<script>
	document.addEventListener("DOMContentLoaded",
			function(event) {
				var slideshow = createSlideshow(".${param.size}-slide",
						".slideshow-row", ".slideshow-item",
						".slideshow-item-content");
				$("#previous").click(function(e) {
					e.preventDefault();
					slideshow.previous();
					schedule(false);
					return false;
				});
				$("#next").click(function(e) {
					e.preventDefault();
					slideshow.next();
					schedule(false);
					return false;
				});
			});
</script>