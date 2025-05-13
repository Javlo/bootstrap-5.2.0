<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<div class="images multimedia clickable-multimedia"><div class="preview">
  <c:forEach var="resource" items="${resources}" varStatus="status">
    <c:if test="${status.index==0}">
    <a rel="rel-${compid}" href="${resource.URL}" data-caption="${resource.title}" data-width="${resource.size.width}" data-height="${resource.size.height}"><img src="${resource.previewURL}" alt="${resources[0].title}" />
    <div class="layer">
  	<c:if test="${not empty title}"><h${contentContext.titleDepth+1} class="title">${title}</h${contentContext.titleDepth+1}></c:if>
  	<span class="deco"><i class="fas fa-camera" aria-hidden="true"></i></span>
  	</div>
    </a>
    </c:if>
    <c:if test="${status.index>0}">
    <a rel="rel-${compid}" href="${resource.URL}" style="display: none;" data-caption="${resource.title}" data-width="${resource.size.width}" data-height="${resource.size.height}" data-pswp-width="${resource.size.width}" data-pswp-height="${resource.size.height}">${resource.name}</a>
    </c:if>
  </c:forEach>

</div></div>
