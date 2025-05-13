<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<a class="media multimedia" href="${link}" rel="rel-${compid}" data-caption="${title}">
<c:if test="${not empty image}">
	<figure>
	<img src="${image}" alt="${title}" title="${label}" />
	<div class="layer"><i class="far fa-play-circle"></i></div>
	</figure> 
</c:if>
<c:if test="${empty image}">
	<figure>
	<img class="mr-3" src="${previewURL}" alt="${title}" title="${label}" />
	<div class="layer"><i class="far fa-play-circle"></i></i></div>
	</figure>
</c:if>

<div class="media-body">
<c:if test="${!empty label}">
    <h${contentContext.titleDepth+1} class="mt-0">${label}</h${contentContext.titleDepth+1}>
    <c:if test="${not empty shortDate || not empty location}"><p>
    <c:if test="${not empty shortDate}"><span class="shortDate">${shortDate}</span><c:if test="${not empty location}"> - </c:if></c:if>
    <c:if test="${not empty location}"><span class="location">${location}</span> </c:if></p></c:if>
</c:if>
<span class="badge badge-secondary">${i18n.view['media.video']}</span>
</div>
</a>