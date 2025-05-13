<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>
  <jsp:include page="title.jsp" />
	<ul class="products list"><c:forEach items="${pages}" var="page" varStatus="status">
			<li class="item-${status.index+1}"><a title="${page.title}" href="${page.url}">${page.title}</a></li>
	</c:forEach></ul>
</c:if>
