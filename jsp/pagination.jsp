<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><c:if test="${pagination.maxPage > 1}"><div class="text-center">
<c:set var="filterParam" value="" />
<c:if test="${not empty multimediaFilter}">
	<c:set var="filterParam" value="&filterKey=${multimediaFilter.hashCode}" />
</c:if>
<ul class="pagination justify-content-center">	
	<li class="page-item previous${pagination.page > 1 && pagination.maxPage > 1?'':' disabled'}"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${pagination.page-1}&key=${pagination.key}${filterParam}">&laquo;</a></li>	
	<c:if test="${empty param['short']}">
		<c:set var="from" value="${pagination.page-3}" />
		<c:set var="to" value="${pagination.page+3}" />	
		<c:if test="${from > 3}">
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=1&key=${pagination.key}${filterParam}">1</a></li>
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=2&key=${pagination.key}${filterParam}">2</a></li>
			<fmt:formatNumber var="softPage" value="${from/2}" maxFractionDigits="0" />
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${softPage}&key=${pagination.key}${filterParam}">...</a></li>
		</c:if>
		<c:if test="${from <= 3}">
			<c:set var="from" value="1" />
		</c:if>
		<c:set var="listTo" value="${to}" />	
		<c:if test="${listTo >= pagination.maxPage}">
			<c:set var="listTo" value="${pagination.maxPage}" />
		</c:if>
		<c:set var="selected" value=" class=${info.template.selectedClass}" />
		<c:forEach var="i" begin="${from}" end="${listTo}" step="1" varStatus ="status">
			<li class="page-item ${pagination.page == i?'active':''}"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${i}&key=${pagination.key}${filterParam}">${i}</a></li>
		</c:forEach>
		<c:if test="${to <= pagination.maxPage-3}">
			<fmt:formatNumber var="softPage" value="${to+((pagination.maxPage-to)/2)}" maxFractionDigits="0" />
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${softPage}&key=${pagination.key}${filterParam}">...</a></li>
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${pagination.maxPage-1}&key=${pagination.key}${filterParam}">${pagination.maxPage-1}</a></li>
			<li class="page-item"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${pagination.maxPage}&key=${pagination.key}${filterParam}">${pagination.maxPage}</a></li>
		</c:if>
	</c:if>
	<li class="page-item next${pagination.page < pagination.maxPage && pagination.maxPage > 1?'':' disabled'}"><a class="page-link" href="${info.currentURL}?webaction=view.pagination&page=${pagination.page+1}&key=${pagination.key}${filterParam}">&raquo;</a></li>
</ul>
</div>
</c:if>
