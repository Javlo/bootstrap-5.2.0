<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><div class="v-gallery multimedia ${param.large?'large':''} clickable-multimedia">  
<c:forEach var="resource" items="${resources}" varStatus="status"><c:set var="display" value="false" />
	<c:if test="${status.index >= (pagination.page-1)*pagination.pageSize || pagination.pageSize == 0}">
		<c:if test="${status.index < (pagination.page)*pagination.pageSize || pagination.pageSize == 0}">
			<c:set var="display" value="true" />
		</c:if>
	</c:if><c:if test="${!display}">
	<div class="item hidden preview">
		<a href="${resource.URL}" title="${resource.title}" rel="${resource.relation}" onclick="sendAction('${resource.accessURL}');" lang="en" data-width="${resource.size.width}" data-height="${resource.size.height}">
			download
		</a>
	</div>	
	</c:if><c:if test="${display}">
	<div class="item"><div class="thumbnail">
		<a data-caption="${resource.allInfoText}" title="${i18n.view['global.enlargeimage']}" href="${resource.URL}" rel="${resource.relation}" data-width="${resource.size.width}" data-height="${resource.size.height}" data-pswp-width="${resource.size.width}" data-pswp-height="${resource.size.height}">
		<jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="standard" />
		<img id="img-${compid}-${status.index}" class="img-responsive" data-caption="${resource.allInfoText}" alt="${resource.allInfoText} - ${i18n.view['global.enlargeimage']}" src="${newURL}" />		
		</a>
		<c:if test="${not empty resource.title || not empty resource.description}">
			<c:if test="${not empty resource.title}"><h3>${resource.title}</h3></c:if>
			<c:if test="${not empty resource.description}"><p>${resource.description}</p></c:if>
		</c:if>
	</div>
	</div>         
     </c:if></c:forEach>
</div>
<jsp:include page="../../pagination.jsp"></jsp:include>