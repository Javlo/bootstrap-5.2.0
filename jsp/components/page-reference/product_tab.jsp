<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if test="${fn:length(pages)>0}">
  <jsp:include page="title.jsp" />
	<c:set var="pageRef" value="${comp}" />
	<div class="d-flex align-items-stretch">

		<div class="nav flex-column nav-pills me-3" id="tabs-${compid}" role="tablist" aria-orientation="vertical">
			<c:forEach items="${pages}" var="page" varStatus="status">
				<button class="nav-link ${status.index==0?'active':''}" id="tab-${compid}-${status.index}" data-bs-toggle="pill" data-bs-target="#content-${compid}-${status.index}" type="button" role="tab" aria-controls="content-${compid}" aria-selected="true">
					<c:if test="${param.number}">
						<span class="position-number">${status.index+1}.</span>
					</c:if>
					${page.title}
				</button>
			</c:forEach>
		</div>

		<div class="tab-content d-flex align-items-stretch" id="content-${compid}">
			<c:forEach items="${pages}" var="page" varStatus="status">
				<div class="tab-pane fade  ${status.index==0?'show active':''}" id="content-${compid}-${status.index}" role="tabpanel" aria-labelledby="v-pills-home-tab" tabindex="${status.index}">
					<div class="in-wrapper d-flex flex-column justify-content-between">
						<div class="content">
							<p>${page.description}</p>
							<c:set var="image" value="${null}" />
							<c:if test="${fn:length(page.images)>0 && param.image}">
								<c:set var="image" value="${page.images[0]}" />
							</c:if>
							<c:if test="${not empty image}">
								<figure>
									<a ${popup?'class="popup" ':''} title="${page.titleForAttribute}" href="${page.linkOn}" ${globalContext.openExternalLinkAsPopup && !page.linkRealContent?'target="_blank"':''}> <img class="img-responsive" src="${image.url}" class="frame" alt="${image.description}" />
									</a>
								</figure>
							</c:if>
						</div>
						<c:if test="${page.realContent}">
							<div class="link">
								<a href="${page.linkOn}" title="${i18n.view['global.read-more']}"><i class="bi bi-arrow-right-circle"></i></a>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>
		</div>

	</div>

</c:if>
