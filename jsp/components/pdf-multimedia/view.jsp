<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:forEach var="resource" items="${resources}" varStatus="status">
<c:if test="${resource.id == param.resourceId}">
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
<div class="row">
  <div class="col-sm-12 col-md-12">
    <div class="thumbnail">      
      <img src="${resource.URL}" alt="${resourceDescription}" />
      <div class="caption">
        <h3>${resource.title}</h3>        
        <p><a href="${info.currentURL}" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-arrow-left"></span></a></p>
      </div>
    </div>
  </div>
</div>	
</c:if>
</c:forEach>