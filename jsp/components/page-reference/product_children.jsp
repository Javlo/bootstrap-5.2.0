<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if
	test="${fn:length(pages)>0}">
	<c:set var="cols" value="6" /><c:if test="${not empty param.cols}"><c:set var="cols" value="${param.cols}" /></c:if>
	<c:set var="row" value="0" /><c:if test="${not empty param.row}"><c:set var="row" value="${param.row}" /></c:if>
	<c:set var="cssClass" value="screamer" /><c:if test="${not empty param.cssClass}"><c:set var="cssClass" value="${param.cssClass}" /></c:if>
	<c:set var="filter" value="bloc-4-4" /><c:if test="${not empty param.row}"><c:set var="filter" value="bloc-${cols}-${row}/" /></c:if>
	<c:set var="titleTag" value="h3" /><c:if test="${not empty param.titleTag}"><c:set var="titleTag" value="${param.titleTag}" /></c:if>
	<c:set var="noimage" value="false" /><c:if test="${not empty param.noimage}"><c:set var="noimage" value="true" /></c:if>
	<c:set var="subtitle" value="false" /><c:if test="${not empty param.subtitle}"><c:set var="subtitle" value="true" /></c:if>
	<c:set var="onlyRealContent" value="false" /><c:if test="${not empty param.onlyRealContent}"><c:set var="onlyRealContent" value="${param.onlyRealContent}" /></c:if>
	<c:set var="onlyVisible" value="false" /><c:if test="${not empty param.onlyVisible}"><c:set var="onlyVisible" value="${param.onlyVisible}" /></c:if>
	<c:set var="linkOn" value="true" /><c:if test="${not empty param.linkOn}"><c:set var="linkOn" value="${param.linkOn}" /></c:if>
	<c:set var="colNumber" value="0" />		
	<div class="list row ${renderer}">
		<c:forEach items="${pages}" var="page" varStatus="status">		
		<c:set var="colNumber" value="${colNumber+cols}" />
		<c:set var="tagClass" value="" />
		<c:forEach items="${page.tags}" var="tag">
		<c:set var="tagClass" value="${tagClass} tag-${tag}" />
		</c:forEach>
		<div class="${page.selected?'active':'unactive'} ${cssClass} col-sm-${cols} ${cols==4?'col-xs-6 ':''}${cols==2?'col-xs-4 ':''}row-${row} ${page.name}${tagClass}">
			<!-- portfolio item -->
			<div class="wrapper item-${status.index+1}">
			<c:if test="${not empty page.image && !noimage}"><jv:changeFilter var="newURL" url="${page.image.url}" filter="reference-list" newFilter="${filter}" /><figure><img class="img-responsive" src="${newURL}"  alt="${page.image.description}" /></figure></c:if>
			<c:if test="${param.nochidren}"><a ${page.linkOn != page.url && linkOn?'target="_blanck"':''} title="${page.title}" href="${linkOn?page.linkOn:page.url}"></c:if>
			<div class="box">
				<c:set var="subtitleHTML" value='<span class="subtitle">${page.subTitle}</span>' />
				<c:if test="${!param.nochidren}"><a ${page.linkOn != page.url && linkOn?'target="_blanck"':''} title="${page.title}" href="${linkOn?page.linkOn:page.url}"></c:if>				
				<${titleTag}>${page.title}${subtitle?subtitleHTML:''}</${titleTag}>
				<c:if test="${!param.nochidren}"></a></c:if>
				<c:if test="${not empty page.description && empty param.shortList}"><p class="description">${page.description}</p></c:if>				
				<c:if test="${fn:length(page.children)>0 && empty param.nochidren}">
					<ul class="children">
						<c:forEach items="${page.children}" var="child" varStatus="childStatus">
							<c:if test="${not empty child.title && (child.realContent || !onlyRealContent)}"><c:if test="${child.visible || !onlyVisible}"><li class="${child.technicalTitle}"><a href="${child.url}">${child.title}</a></li></c:if></c:if>
						</c:forEach>
					</ul>
				</c:if>			
			<c:if test="${not empty title}"><h5>${title}</h5></c:if>
			</div><c:if test="${param.nochidren}"></a></c:if></div>
		</div>		
		<c:if test="${colNumber >= 12}">
			</div><div class="list row ${renderer}">
			<c:set var="colNumber" value="0" />
		</c:if>
		</c:forEach>
	</div>
</c:if>