<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}"><c:if test="${not empty title}"><c:set var="currentPageCached" value="${contentContext.currentPageCached}" /><h3>${title}</h3></c:if>
<c:set var="localCompid" value="${compid}" />
<div id="tab-${compid}" class="children-link-tab">
<ul class="nav nav-tabs" role="tablist" id="tabs-${localCompid}">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
<li class="nav-item">
	<a ${status.index == 0?' class="active nav-link"':'class="nav-link"'} href="#child-${localCompid}-${status.index}" role="tab" data-toggle="tab" data-bs-toggle="tab" aria-selected="${status.index == 0?'true':'false'}" id="tab-${child.id}-${localCompid}">
		${child.fullLabel}
	</a>
</li>
</c:if></c:forEach>
</ul>
<div class="tab-content" id="tab-content-${localCompid}">
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
<div class="tab-pane fade in${status.index == 0?' active show':''}" id="child-${localCompid}-${status.index}" id="tab-${child.id}-${localCompid}">
<jsp:setProperty name="contentContext" property="currentPageCached" value="${child.page}" />
<jsp:include page="/jsp/view/content_view.jsp?area=${contentContext.area}" />
</div></c:if></c:forEach>
</div></div><jsp:setProperty name="contentContext" property="currentPageCached" value="${currentPageCached}" /><c:set var="compid" value="${localCompid}" />
</c:if>