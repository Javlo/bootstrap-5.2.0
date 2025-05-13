<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%>
<jsp:include page="title.jsp" />
<div class="auto-row">
<c:forEach items="${pages}" var="page" varStatus="status">
	<a href="${page.linkOn}" class="auto-col card${popup?' popup':''} ${page.id == info.page.id?' active':' unactive'}">
		<c:if test="${fn:length(page.images)>0}">
			<c:set var="image" value="${page.images[0]}" />
			<jv:changeFilter var="imgURL" url="${image.url}" filter="reference-list" newFilter="card" />
			<img class="card-img-top" src="${imgURL}" alt="" />
		</c:if>
		<div class="card-body">
			<c:if test="${page.contentDate}"> <p class="card-text"><small class="text-muted date">${page.contentDateValue}</small></p></c:if>
			<h${contentContext.titleDepth+1} class="card-title">${page.title}</h${contentContext.titleDepth+1}>
			<c:if test="${not empty page.description && page.description != 'no desc'}">
			<p class="card-text"><span class="text">${page.description}</span></p>
			</c:if>
			<c:if test="${fn:length(page.taxonomy)>0}"> <p class="card-text"><small class="text-muted taxonomy">
				<c:set var="sep" value="" />
				<c:forEach var="taxonomyItem" items="${page.taxonomy}">
					<span class="item"><span class="sep">${sep}</span><span class="text">${taxonomyItem.label}</span>
					<c:set var="sep" value=", " />
				</c:forEach>
			</small></p></c:if>
		</div>
	</a>
</c:forEach>
</div>
