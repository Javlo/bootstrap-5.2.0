<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div class="breadcrumb-arrow-wrapper">
<div class="container">
	<div class="breadcrumb-arrow">
		<c:forEach var="page" items="${pages}" varStatus="status">
		<div class="item">
		<c:if test="${page.realContent}"><a href="${page.url}"></c:if>
		<c:if test="${!page.realContent}"><span class="nolink"></c:if>
			<span class="breadcrumb__inner">
				<span class="breadcrumb__title" itemprop="name">${page.info.label}</span>
			</span>
		<c:if test="${page.realContent}"></a></c:if>
		<c:if test="${!page.realContent}"></span></c:if>
		</div>
		</c:forEach>
	</div>
</div>
</div>