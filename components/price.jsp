<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%>

<c:if test="${!previousSame}">
<ul class="list-group list-group-flush price-list">
</c:if>
<li class="list-group-item">
<div id="${previewID}" class="d-flex justify-content-between ${previewClass} align-items-center">
	<div class="info">
		<h3>${title.value}</h3>
		<c:if test="${not empty description.value}"><div class="description">${description.value}</div></c:if>
	</div>
	<div class="price text-nowrap">
		${price.value} &euro;
	</div>
</div>
</li>
<c:if test="${!nextSame}">
</ul>
</c:if>