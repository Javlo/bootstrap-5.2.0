<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:set var="resourceDescription" value="" /><c:if test="${not empty file.title}"><c:set var="resourceDescription" value="${file.title}" /></c:if>
<div class="modal picture-modal" id="md${file.id}"><div class="modal-dialog modal-lg"><div class="modal-content"><div class="modal-header">
<div class="row"><div class="col-sm-2"><div class="commands">
<a href="${url}" target="_blank" class="btn btn-default btn-download" role="button" id="previous${file.id}" title="${i18n.view['global.download']}"><span class="glyphicon glyphicon-picture" aria-hidden="true"></span></a>
</div></div>
<div class="col-sm-8"><h3 class="modal-title">${not empty description?cleanDescription:label}</h3></div>
<div class="col-sm-2"><button type="button" class="btn btn-default btn-close pull-right" data-dismiss="modal" aria-label="Close"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button></div>
</div></div>      
<div class="modal-body"><div class="thumbnail"><c:set var="resourceURL" value="${largeURL}" /><img class="img-fluid" src="${resourceURL}" alt="${file.title}" />
<div class="caption"><c:if test="${not empty file.shortDate}"><span class="date"><span class="glyphicon glyphicon-calendar" aria-hidden="true"></span> ${file.shortDate}</span></c:if>	        
<c:if test="${not empty file.position || not empty file.location}"><p class="position"><c:if test="${not empty file.position}">
<a href="https://google.com/maps/?q=${file.position}&z=8" target="_blanck" class="btn btn-default"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></a></c:if>
<c:if test="${not empty file.location}"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> </c:if>${file.location}</c:if></p>
<c:if test="${not empty file.copyright}"><p class="copyright">${file.copyright}</p></c:if>
<c:if test="${not empty file.description}"><p class="description">${file.description}</p></c:if>        
</div></div></div></div></div></div>