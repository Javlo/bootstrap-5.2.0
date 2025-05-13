<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:set var="latestMonth" value="" /><c:set var="latestDay" value="" /><c:set var="blocIndex" value="1" />
<ul class="timeline multimedia clickable-multimedia">
    <c:forEach var="resource" items="${resources}" varStatus="status">	
	<c:if test="${empty latestMonth || latestMonth != resource.monthDate}">
	<li><div class="tldate">${resource.monthDate}</div></li>
	<c:set var="latestMonth" value="${resource.monthDate}" />
	<c:set var="latestDay" value="" />
	<c:set var="latestType" value="" />
	</c:if>
	<c:if test="${empty latestDay || latestDay != resource.mediumDate || resource.type != latestType}">	
	   <c:if test="${!empty latestDay}"><c:if test="${!resource.video}"></div></c:if></li></c:if>
	   <li class="tl-main-bloc${blocIndex % 2 == 0?' timeline-inverted':''}"><div class="tl-circ"><i class="fas fa-${resource.video?'video-':''}camera" aria-hidden="true"></i>
	   </div><div class="timeline-panel">
	   	<p><small class="text-muted"><i class="glyphicon glyphicon-time"></i> ${resource.fullDate}</small></p>
	   	<c:if test="${!resource.video}"><div class="tl-bloc-container"></c:if>
	   <c:set var="blocIndex" value="${blocIndex+1}" />
	</c:if>      
		<c:if test="${!resource.video}"><div class="tl-bloc"></c:if>
		<div class="tl-heading">
		  <h4>${resource.title}</h4>		  
		</div>
		<div class="tl-body">
		  <c:if test="${!resource.video}">
		  <p class="preview"><a title="${i18n.view['global.enlargeimage']}" class="thumbnail" href="${resource.URL}" rel="${resource.relation}" data-width="${resource.size.width}" data-height="${resource.size.height}" data-pswp-width="${resource.size.width}" data-pswp-height="${resource.size.height}"><img class="img-responsive" data-caption="${resource.allInfoText}" alt="${resource.allInfoText} - ${i18n.view['global.enlargeimage']}" src="${resource.previewURL}" /></a></p>
		  </c:if><c:if test="${resource.video}">
			<div class="thumbnail">
			   <jv:changeFilter var="videoURL" url="${resource.previewURL}" filter="preview" newFilter="hd" />
     		   <video class="afterglow" id="myvideo" width="1280" height="720" data-autoresize="fit" data-skin="${not empty param.skin?param.skin:'light'}" poster="${videoURL}">
   		       <source type="video/mp4" src="${resource.URL}" />
 			   </video><c:if test="${not empty resource.title}">			   
      		   </c:if>
           </div>
		  </c:if>
		</div>	  
		<c:if test="${!resource.video}"></div></c:if>
	  <c:set var="latestDay" value="${resource.mediumDate}" />	
	  <c:set var="latestType" value="${resource.type}" />  
    </c:forEach>
	</li>
  </ul>  