<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if
	test="${fn:length(pages)>0}">	
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>
	<div class="row">
		<c:forEach items="${pages}" var="page" varStatus="status">
			<c:set var="image" value="${null}" />
			<c:if test="${fn:length(page.images)>0}">
				<c:set var="image" value="${page.images[0]}" />
			</c:if>	
			<c:set var="style" value="" />
			<c:set var="cssClass" value="" />
			<c:if test="${page.color.filled}">			
				<c:set var="style" value=' style="background-color: ${page.color.HTMLCode}; color: ${page.color.text.HTMLCode};"' />
				<c:set var="cssClass" value=" page-color color-${page.color.dark?'dark':'ligth'}" />	
			</c:if>		 
			<div class="item-${status.index+1} col-sm-4${cssClass}">
				<a title="${page.title}" href="${page.linkOn}" class="item${popup?' popup':''}">	
				<div class="thumbnail">													
					<figure>
						<jv:changeFilter var="newURL" url="${image.url}" filter="reference-list" newFilter="bloc-6-4" />
						<img class="img-responsive" src="${newURL}" class="frame" alt="${image.description}" />						
					</figure>
				</div>											
				<div class="caption"${style}>
					<span class="title">${page.label}</span>
					<span class="deco"><i class="fas fa-search"></i></span>					
				</div>			
				</a>				
				</div>
				<c:if test="${status.index+1 % 3 == 0}"></div><div class="row"></c:if>
		</c:forEach>
	</div>
</c:if>