<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${fn:length(pages)>0}"><div id="carousel-${compid}" class="slide ${param.caption?'with-caption':'without-caption'}">
<c:if test="${not empty title}"><h2>${title}</h2></c:if>
<div class="v-gallery">
  	<c:forEach items="${pages}" var="page" varStatus="status">
		<c:if test="${fn:length(page.images)>0}">
			<c:set var="image" value="${page.images[0]}" />
			<div class="item"><a class="in-wrapper" href="${page.url}">  
				<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="vgal" />
				<jv:changeFilter var="smURL" url="${image.url}" filter="reference-list" newFilter="vgal-sm" />
				<picture>
					<source media="(max-width: 767px)" srcset="${smURL}" />
					<img class="d-block w-100" alt="${page.title}" src="${newURL}" />
				</picture>
				<div class="caption">
					<h2>${page.title}</h2>  			  
				</div>
			</a></div>
		</c:if>
	</c:forEach>
  </div>
</div>
</c:if>