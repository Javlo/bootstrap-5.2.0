<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${fn:length(pages)>0}">
	<div id="carousel-${compid}" class="slide ${param.caption?'with-caption':'without-caption'}">
    <jsp:include page="title.jsp" />

		<div id="carouselBt${compid}" class="carousel slide">
			<div class="carousel-inner">
				<c:set var="active" value=' active' />
				<c:forEach items="${pages}" var="page" varStatus="status">
					<c:if test="${fn:length(page.images)>0}">
						<c:set var="image" value="${page.images[0]}" />
						<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="slide" />
						<jv:changeFilter var="smURL" url="${image.url}" filter="reference-list" newFilter="slide-sm" />
						<div class="carousel-item${active}">
							<a href="${page.linkOn}">
							<picture>
								<source media="(max-width: 767px)" srcset="${smURL}" />
								<img class="d-block w-100" alt="${page.title}" src="${newURL}" />
							</picture>
							<div class="carousel-caption d-none d-md-block">
								<h5>${page.title}</h5>
								<c:if test="${not empty page.description && page.description != 'no desc'}">
									<p>${page.description}</p>
								</c:if>
							</div>
							</a>
						</div>
					</c:if>
					<c:set var="active" value='' />
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#carouselBt${compid}" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">${vi18n['global.previous']}</span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#carouselBt${compid}" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">${vi18n['global.next']}</span>
			</button>
		</div>
	</div>

	<script>
		function init${compid}() {
			var myCarousel = document.querySelector('#carouselBt${compid}')
			var carousel = new bootstrap.Carousel(myCarousel, {
				interval: 2000
			})
		}
		if (typeof(bootstrap) !== "undefined") {
			init${compid}();
		} else {
			document.addEventListener("DOMContentLoaded", function(event) {
				init${compid}();
			});
		}
	</script>
</c:if>
