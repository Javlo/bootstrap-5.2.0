<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<nav aria-label="breadcrumb" class="breadcrumb-parent">
<c:set var="parent" value="" />
<c:forEach var="page" items="${pages}" varStatus="status"><c:if test="${page.realContent && page.id != info.currentPage.id}"><c:set var="parent" value="${page}" /></c:if></c:forEach>

<c:if test="${not empty parent && !parent.root}">
<a href="${parent.url}"><i class="bi bi-chevron-double-left"></i> ${parent.titleOrSubtitle}</a>
</c:if> 

</nav>
