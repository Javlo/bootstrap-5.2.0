<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h3>${title}</h3>
</c:if>
<div id="accordion-${compid}" class="accordion mb-3">
<c:set var="currentPageCached" value="${contentContext.currentPageCached}" />
<c:forEach var="child" items="${children}" varStatus="status"><c:if test="${child.realContent}">
<div class="accordion-item">
	
	<h2 class="accordion-header" id="heading${status.index}-${compid}">
		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.index}-${compid}" aria-expanded="true" aria-controls="collapse${status.index}-${compid}">
			${child.fullLabel}
		</button>
	</h2>
	
	<div id="collapse${status.index}-${compid}" class="accordion-collapse collapse" aria-labelledby="heading${status.index}-${compid}" data-bs-parent="#accordion-${compid}">
      <div class="accordion-body">
        	<jsp:setProperty name="contentContext" property="allLanguage" value="${child.contentLanguage}" />
			<jsp:setProperty name="contentContext" property="currentPageCached" value="${child.page}" />		
			<jsp:include page="/jsp/view/content_view.jsp?area=${contentContext.area}" />

      </div>
    </div>
	
</div>
</c:if></c:forEach>
<jsp:setProperty name="contentContext" property="currentPageCached" value="${currentPageCached}" />
</div> 
</c:if>