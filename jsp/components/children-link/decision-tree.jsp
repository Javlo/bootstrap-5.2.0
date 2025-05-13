<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><c:if
	test="${fn:length(children)>0}">
<h2 class="text-center">${title}</h2>
<div class="container"><div class="row justify-content-md-center">
<c:forEach items="${children}" var="page" varStatus="status">
	<div class="col-sm-3">
	<a title="${page.fullLabel}" href="${page.url}">
	<div class="card text-center">
	<jv:changeFilter var="newURL" url="${page.image.previewURL}" filter="list" newFilter="card" />
    <c:if test="${not empty page.image}"><img class="card-img-top" src="${newURL}" alt="${page.image.description}" /></c:if>
  	<div class="card-body ${not empty page.description?"with-descriptino":"title-only"}">
    	<h3 class="card-title">${page.fullLabel}</h3>
    	<c:if test="${not empty page.description}">
    	<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    	</c:if>    	
  	</div>
  	<c:if test="${status.index > 1 && status.index % 4 == 0}">
  	<div class="w-100"></div>
  	</c:if>
</div></div>
</c:forEach>
</div></div></c:if>