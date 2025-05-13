<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${empty param.resourceId}"><div class="multimedia smallblocs clickable-multimedia">
<c:set var="blocSize" value="1" />
<c:if test="${not empty param.blocSize}">
<c:set var="blocSize" value="${param.blocSize}" />
</c:if>
<c:set var="colSize" value="${blocSize}" />  
<c:set var="rowSize" value="${blocSize}" />
<div class="row">
<c:set var="size" value="${fn:length(resources)}" />
<c:forEach var="resource" items="${resources}" varStatus="status">	
	<c:url var="resourceURL" value="${resource.URL}" context="/"></c:url>
	<c:if test="${not empty param.noshadow}">
		<c:url var="resourceURL" value="${info.currentURL}">
			<c:param name="resourceId" value="${resource.id}" />
		</c:url>
	</c:if>
	<c:set var="resourceDescription" value="" />
	<c:if test="${not empty resource.title}">
		<c:set var="resourceDescription" value="${resource.title}" />
		<c:if test="${not empty resource.location}">
			<c:set var="resourceDescription" value="${resourceDescription} - ${resource.location}" />
		</c:if>
		<c:if test="${not empty resource.shortDate}">
			<c:set var="resourceDescription" value="${resourceDescription} - ${resource.shortDate}" />
		</c:if>
	</c:if>

	<c:set var="display" value="false" />
	<c:if test="${status.index >= (pagination.page-1)*pagination.pageSize || pagination.pageSize == 0}">
		<c:if test="${status.index < (pagination.page)*pagination.pageSize || pagination.pageSize == 0}">
			<c:set var="display" value="true" />
		</c:if>
	</c:if>
	<c:set var="relAttribute" value='rel="${resource.relation}"' />
	<c:if test="${!display}">
	<div class="item hidden preview">
		<a data-initindex="${status.index+1}" data-width="900" data-height="1274" href="${resourceURL}" id="lnk${resource.id}" title="${resourceDescription}">${i18n.view['global.download']}</a>
	</div>	
	</c:if>
	
	<c:if test="${display}">
	<div class="item col-md-${colSize} col-xs-${colSize<3?colSize*2:6} mb-3">
	<div class="${not empty param.btmodal?'preview-bt':'preview'}">	
	<div class="wrapper"><a data-initindex="${status.index+1}" data-width="900" data-height="1274" data-pswp-width="900" data-pswp-height="1274" class="thumbnail" id="lnk${resource.id}" href="${resourceURL}" title="${i18n.view['global.enlargeimage']}" data-caption="${title} (${resource.name})" ${not empty param.btmodal?modalAttribute:relAttribute}>	
	<c:set var="filter" value="bloc-${colSize}-${rowSize}" />
	<jv:changeFilter var="newURL" url="${resource.URL}" filter="full" newFilter="width-${colSize}" />
	<img class="img-responsive" src="${newURL}" alt="${resource.title}" />
	</a></div>	
	</div>
	</div>
	</c:if>	
</c:forEach>

</div>
</div>
<jsp:include page="../../pagination.jsp"></jsp:include></c:if>