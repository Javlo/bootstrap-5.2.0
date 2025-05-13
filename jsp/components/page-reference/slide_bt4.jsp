<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><div id="carousel-${compid}" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
  <c:set var="active" value=' class="active"' />  
  <c:forEach items="${pages}" var="page" varStatus="status">  	
  	<c:if test="${fn:length(page.images)>0}">
    	<li data-target="#carousel-${compid}" data-slide-to="${status.index}"${active}></li>
    	<c:set var="active" value='' />
    </c:if>
  </c:forEach>
  </ol>
  <div class="carousel-inner">  
  <c:set var="active" value=' active' />
  <c:forEach items="${pages}" var="page" varStatus="status">
	<c:if test="${fn:length(page.images)>0}">
		<c:set var="image" value="${page.images[0]}" />
  		<div class="carousel-item${active}">
  		<c:set var="active" value='' />  
  				<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="slide" />			
  				<jv:changeFilter var="smURL" url="${image.url}" filter="reference-list" newFilter="slide-sm" />
      			<a href="${page.url}">
      			<picture>
      			<source media="(max-width: 767px)" srcset="${smURL}" />
      			<img class="d-block w-100" alt="${page.title}" src="${newURL}" /></a>
      			</picture>      		
	     		<div class="carousel-caption">
	   			  <h2>${page.title}</h2>
	   			  <c:if test="${not empty page.description && page.description != 'no desc'}"><p>${page.description}</p></c:if>
	   			  <p><a class="btn btn-primary btn-lg" href="${page.url}">${not empty page.linkLabel?page.linkLabel:i18n.view['global.moreinfo']}</a>	   			  
	 			</div>  			      
    	</div>
    </c:if>
  </c:forEach>
  </div>
  <a class="carousel-control-prev carousel-control" href="#carousel-${compid}" role="button" data-slide="prev">
    <i class="fas fa-angle-left" aria-hidden="true"></i>
    <span class="sr-only" lang="en">Previous</span>
  </a>
  <a class="carousel-control-next carousel-control" href="#carousel-${compid}" role="button" data-slide="next">
    <i class="fas fa-angle-right" aria-hidden="true"></i>    
    <span class="sr-only" lang="en">Next</span>
  </a>
</div>
<script>document.addEventListener("DOMContentLoaded", function(event) {$('#carousel-${compid}').carousel()});</script>