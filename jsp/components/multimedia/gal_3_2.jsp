<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><div class="row multimedia ${param.large?'large':''} clickable-multimedia"> 
<c:set var="localImageNumber" value="1" /> 
<c:set var="mediaLineNumber" value="1" />

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
	<div class="col-md-${mediaLineNumber%2==0?'6':'4'} col-6 preview mb-3"><div class="thumbnail">
		<a data-caption="${resource.allInfoText}" title="${i18n.view['global.enlargeimage']}" href="${resource.URL}" rel="${resource.relation}" data-width="${resource.size.width}" data-height="${resource.size.height}" data-pswp-width="${resource.size.width}" data-pswp-height="${resource.size.height}">
		<c:if test="${mediaLineNumber%2==0}">
			<c:if test="${localImageNumber==2}">
				<c:set var="localImageNumber" value="0" />
				<c:set var="mediaLineNumber" value="${mediaLineNumber+1}" />
			</c:if>			
			<jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="bloc-6-2" />
		</c:if><c:if test="${mediaLineNumber%2!=0 && localImageNumber!=0}">
			<c:if test="${localImageNumber==3}">
				<c:set var="localImageNumber" value="0" />
				<c:set var="mediaLineNumber" value="${mediaLineNumber+1}" />
			</c:if>
			<jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="bloc-4-2" />
		</c:if>	
		
		<c:set var="localImageNumber" value="${localImageNumber+1}" />
		<img id="img-${compid}-${status.index}" class="rounded img-responsive" data-caption="${resource.allInfoText}" alt="${resource.allInfoText} - ${i18n.view['global.enlargeimage']}" src="${newURL}" />		
		</a>
	</div>
	</div>         
     </c:if></c:forEach>
</div>
<jsp:include page="../../pagination.jsp"></jsp:include>