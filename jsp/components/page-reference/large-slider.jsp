<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${fn:length(pages)>0}">
	<div id="carousel-${compid}" class="slide ${param.caption?'with-caption':'without-caption'}">
		<c:if test="${not empty title}">
			<h2>${title}</h2>
		</c:if>

		<div id="glide-${compid}" class="slide">

			<c:if test="${param.controler}">
			<div class="container">
				<div class="slide-navigation d-flex justify-content-between" data-glide-el="controls[nav]">
					<c:forEach items="${pages}" var="page" varStatus="status">
						<a href="#item-${page.name}" data-glide-dir="=${status.index}">
						<c:if test="${not empty page.font}"><div class="picto">${page.font}</div></c:if>
						<h${contentContext.titleDepth+1}>${page.label}</h${contentContext.titleDepth+1}>
						</a>
					</c:forEach>
				</div>
			</div>
			</c:if>

			<div class="glide__track" data-glide-el="track">
				<div class="glide__slides">
					<c:set var="active" value=' active' />
					<c:forEach items="${pages}" var="page" varStatus="status">
						<c:if test="${fn:length(page.images)>0}">
							<c:set var="image" value="${page.images[0]}" />
							<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="slide" />
							<jv:changeFilter var="smURL" url="${image.url}" filter="reference-list" newFilter="slide-sm" />
							<div class="glide__slide${active}">
								<c:if test="${page.realContent}"><a href="${page.linkOn}"></c:if>
								<c:if test="${!page.realContent}"><span class="no-link"></c:if> <picture>
									<source media="(max-width: 767px)" srcset="${smURL}" />
									<img alt="${page.title}" src="${newURL}" /> </picture>
									<div class="caption">
										<c:if test="${not empty page.description && page.description != 'no desc'}">
											<h3>${page.description}</h3>
										</c:if>
									</div>
								<c:if test="${page.realContent}"></a></c:if>
								<c:if test="${!page.realContent}"></span></c:if>
							</div>
						</c:if>
						<c:set var="active" value='' />
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<c:if test="${empty glideJsInsered}">
		<c:set var="glideJsInsered" value="true" scope="request" />
		<script src="${info.rootTemplateURL}/lib/glide/glide.min.js"></script>
		<link rel="stylesheet" href="${info.rootTemplateURL}/lib/glide/css/glide.all.css" />
	</c:if>
	<script>
		var glideOptions = {
			type : 'carousel',
			perView : 2,
			gap : 150,
			focusAt : 'center'
		}
		console.log("0.glideOptions = ", glideOptions);
		if (typeof Glide != "undefined") {
			new Glide('#glide-${compid}', glideOptions).mount();
		} else {
			document.addEventListener("DOMContentLoaded", function(event) {
				new Glide('#glide-${compid}', glideOptions).mount();
			});
		}
	</script>
</c:if>