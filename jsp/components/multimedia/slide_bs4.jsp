<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${fn:length(resources)>0}"><div id="carousel-${compid}" class="carousel slide ${param.caption?'with-caption':'without-caption'}" data-ride="carousel"><div class="wrapper">
<c:if test="${not empty title}"><h2>${title}</h2></c:if>
  <c:if test="${not empty param.carouselindicators}"><ol class="carousel-indicators">  
  <c:forEach var="resource" items="${resources}" varStatus="status">  	
    <li data-target="#carousel-${compid}" data-slide-to="${status.index}"${status.index==0?' class="active"':''}></li>
  </c:forEach>
  </ol></c:if>
  <div class="carousel-inner">  
  <c:forEach var="resource" items="${resources}" varStatus="status">
  	<div class="carousel-item item${status.index==0?' active':''}">
  	  <jv:changeFilter var="newURL" url="${resource.previewURL}" filter="preview" newFilter="slide" />
      <img class="d-block w-100" alt="${resource.title}" src="${newURL}" />
      <c:if test="${!resource.staticInfo.emptyInfo}"> 
      <c:if test="${not empty resource.staticInfo.title || not empty resource.staticInfo.description || not empty resource.staticInfo.copyright}">
      <div class="carousel-caption d-none d-md-block">
      	<c:if test="${not empty resource.staticInfo.title}"><p class="title">${resource.staticInfo.title}</p></c:if>
      	<c:if test="${not empty resource.staticInfo.description}"><p class="description">${resource.staticInfo.description}</p></c:if>
      	<c:if test="${not empty resource.staticInfo.copyright}"><span class="copyright">&copy; ${resource.staticInfo.copyright}</span></c:if>
      </div>     
      </c:if></c:if>
    </div>
  </c:forEach>
  </div>
  <c:if test="${not empty param.carouselcontrol}">
 <a class="carousel-control-prev carousel-control" href="#carousel-${compid}" role="button" data-slide="prev">
    <i class="fas fa-angle-left" aria-hidden="true"></i>
    <span class="sr-only" lang="en">Previous</span>
  </a>
  <a class="carousel-control-next carousel-control" href="#carousel-${compid}" role="button" data-slide="next">
    <i class="fas fa-angle-right" aria-hidden="true"></i>    
    <span class="sr-only" lang="en">Next</span>
  </a>
  </c:if>
</div></div>
<script>document.addEventListener("DOMContentLoaded", function(event) {$('#carousel-${compid}').carousel()});</script></c:if>