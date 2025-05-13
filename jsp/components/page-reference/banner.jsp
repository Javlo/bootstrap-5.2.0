<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>	
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>
	<div class="products button d-sm-flex justify-content-between flex-wrap ml-n3 mr-n3">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<div class="item-${status.index+1} flex-fill pl-3 pr-3 mb-3">
				<a class="btn btn-outline-info btn-rounded waves-effect btn btn-shadow btn-${page.selected?'':'outline-'}info${popup?' popup':''} page ${page.selected?'active':'unactive'} w-100" href="${page.url}">
				<c:if test="${not empty page.font}">${page.font}</c:if>
				${not empty page.title?page.title:page.name}
				</a>
			</div>
		</c:forEach>
	</div>
</c:if>