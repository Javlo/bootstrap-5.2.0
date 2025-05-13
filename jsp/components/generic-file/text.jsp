<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<c:if test="${empty url}">need file...</c:if>
<a href="${url}" class="link-file-text ${previewCSS}" id="${previewID}" ${globalContext.openFileAsPopup?' target="_blank"':''}>
  <div class="image">
  	<c:choose>
  		<c:when test = "${ext == 'pdf'}">
            <i class="fas fa-file-pdf"></i>
         </c:when>
         <c:when test = "${ext == 'doc' || ext == 'docx'}">
            <i class="fas fa-file-word"></i>
         </c:when>
         <c:when test = "${ext == 'xls' || ext == 'xlsx'}">
            <i class="fas fa-file-excel"></i>
         </c:when>
         <c:when test = "${ext == 'ppt' || ext == 'pptx'}">
            <i class="fas fa-file-powerpoint"></i>
         </c:when>
          <c:when test = "${ext == 'mp3' || ext == 'wav'}">
            <i class="fas fa-file-audio"></i>
         </c:when>
          <c:when test = "${ext == 'zip' || ext == 'jar'}">
            <i class="fas fa-file-archive"></i>
         </c:when>
          <c:otherwise>
            <i class="fas fa-file"></i>
         </c:otherwise>
  	</c:choose>
  	<i class="fas fa-file-download"></i>
  </div>	
  <c:if test="${not empty label}"><div class="label">${label}</div></c:if>
  <c:if test="${not empty description}"><div class="description">${description}</div></c:if>
</a>
