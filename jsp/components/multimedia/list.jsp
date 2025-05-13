<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row multimedia large clickable-multimedia">  
<c:forEach var="resource" items="${resources}" varStatus="status">
	
	<c:set var="display" value="false" />
	<c:if test="${status.index >= (pagination.page-1)*pagination.pageSize || pagination.pageSize == 0}">
		<c:if test="${status.index < (pagination.page)*pagination.pageSize || pagination.pageSize == 0}">
			<c:set var="display" value="true" />
		</c:if>
	</c:if>
	
	<c:if test="${!display}">
	<div class="item hidden preview">
		<a href="${resource.URL}" title="${i18n.view['global.enlargeimage']}" rel="${resource.relation}" onclick="sendAction('${resource.accessURL}');" lang="en" data-width="${resource.size.width}" data-height="${resource.size.height}">
			download
		</a>
	</div>	
	</c:if>
	
	<c:if test="${display}">
	<div class="col-xs-6 col-md-3 preview"><a title="${resource.title}" class="thumbnail" href="${resource.URL}" rel="${resource.relation}" data-width="${resource.size.width}" data-height="${resource.size.height}"><img  alt="${resource.title}" src="${resource.previewURL}" /></a></div>         
     </c:if>
     
	</c:forEach>
</div>
<jsp:include page="../../pagination.jsp"></jsp:include>
	