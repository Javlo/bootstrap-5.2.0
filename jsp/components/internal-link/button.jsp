<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%>
<c:if test="${!previousSame}">
  <div class="container internal-link-container">
  <div class="internal-link-group">
</c:if>
<a href="${url}" id="${previewID}" class="${comp.style} ${previewCSS} btn" ${previewData}>${label}</a>
<c:if test="${!nextSame}">
  </div></div>
</c:if>
