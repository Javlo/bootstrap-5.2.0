<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${empty param.resourceId}">
	<div class="multimedia smallblocs clickable-multimedia">
		<c:set var="size" value="${fn:length(resources)}" />
		<c:set var="display" value="true" />
		<c:forEach var="resource" items="${resources}" varStatus="status">
			<c:url var="resourceURL" value="${resource.URL}" context="/"></c:url>
			<c:if test="${not empty param.noshadow}">
				<c:url var="resourceURL" value="${info.currentURL}">
					<c:param name="resourceId" value="${resource.id}" />
				</c:url>
			</c:if>
			<c:set var="resourceDescription" value="" />
			<c:if test="${not empty resource.title}">
				<c:set var="resourceDescription" value="${resource.title}" />
				<c:if test="${not empty resource.location}">
					<c:set var="resourceDescription" value="${resourceDescription} - ${resource.location}" />
				</c:if>
				<c:if test="${not empty resource.shortDate}">
					<c:set var="resourceDescription" value="${resourceDescription} - ${resource.shortDate}" />
				</c:if>
			</c:if>

			<c:set var="relAttribute" value='rel="${resource.relation}"' />
			<c:if test="${!display}">
				<div class="item hidden preview" style="display: none !important;">
					<a data-initindex="${status.index+1}" data-width="900" data-height="1274" data-pswp-width="900" data-pswp-height="1274" href="${resourceURL}" id="lnk${resource.id}" title="${resourceDescription}" data-caption="${title} (${resource.name})"> ${i18n.view['global.download']} </a>
				</div>
			</c:if>
			<c:if test="${display}">
				<div class="${not empty param.btmodal?'preview-bt':'preview'}">
					<div class="pdf-image-wrapper">
						<a data-initindex="${status.index+1}" data-width="900" data-height="1274" data-pswp-width="900" data-pswp-height="1274" class="thumbnail" id="lnk${resource.id}" href="${resourceURL}" title="${i18n.view['global.enlargeimage']}" data-caption="${title} (${resource.name})" ${not empty param.btmodal?modalAttribute:relAttribute}>
						<div class="pdf-mark"><i class="bi bi-play-circle"></i></div>
						<img class="img-responsive" src="${resourceURL}" alt="${resource.title}" />
						</a>
						<c:if test="${not empty title}"><div class="pdf-title">${title}</div></c:if>
					</div>
					<c:set var="display" value="false" />
				</div>
			</c:if>

		</c:forEach>

	</div>
	</c:if>