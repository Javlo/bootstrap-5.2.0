 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${not empty title}"><h2>${title}</h2></c:if>
<div class="row cols2"><c:forEach items="${pages}" var="page" varStatus="status">
		<div class="col-md-6 col-sm-12 page-item">
		<a href="${page.linkOn}" class="card${popup?' popup':''}">
			<c:if test="${fn:length(page.images)>0}">
				<c:set var="image" value="${page.images[0]}" />		
				<img class="card-img-top" src="${image.url}" alt="" />
			</c:if> 
			<div class="card-body">
				<c:if test="${page.contentDate && comp.displayDate}"> <div class="badge badge-info">${page.contentDateValue}</div></c:if>
				<h5 class="card-title">${page.title}</h5>
				<c:if test="${not empty page.description && page.description != 'no desc'}">
				<p class="card-text"><span class="text">${page.description}</span></p>
				</c:if>
			</div> 
		</a>
	</div>
	<c:if test="${status.count % 2 == 0 && status.count>1}"></div><div class="row cols2"></c:if>
	</c:forEach>
</div>
