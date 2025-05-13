<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%> 
<div class="board">

<c:if test="${not empty title}"><div class="title"><h2>${title}</h2></div></c:if>
<div class="body">
<c:forEach items="${pages}" var="page" varStatus="status">
	<c:if test="${param.link}">
		<a href="${page.linkOn}">
	</c:if>
	  <c:set var="image" value="${null}" />
	  <c:if test="${fn:length(page.images)>0}">
	     <c:set var="image" value="${page.images[0]}" />
		<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="board" />		
	  </c:if>     
	  <div class="row">
	  <c:if test="${status.index%2==0}">
	  <div class="col-sm-6 col">
	  	<div class="image">
	  		<c:if test="${not empty newURL}"><figure><img src="${newURL}" alt="${image.description}" /></figure></c:if>
	  	</div>
	  </div>	  
	  </c:if>
	  <div class="col-sm-6 col">
	  	<div class="text">	   
      	<h3>${page.title}</h3>
      	<c:if test="${param.link}">
	    	</a>
	    </c:if>
      	<c:if test="${not empty page.description && page.description != 'no desc'}"><p>${page.xhtmlDescription}</p></c:if>
      	<c:if test="${page.realContent}"><p><a class="btn btn-secondary" href="${page.url}">${not empty page.linkLabel?page.linkLabel:i18n.view['global.moreinfo']} &raquo;</a></p></c:if>
      	</div>
     </div>
      <c:if test="${status.index%2!=0}">
	  <div class="col-sm-6 col">
	  	<div class="image">
	  		<c:if test="${not empty newURL}"><figure><img src="${newURL}" alt="${image.description}" /></figure></c:if>
	  	</div>
	  </div>	  
	  </c:if>
	  </div>    
    </c:forEach>
</div></div>
