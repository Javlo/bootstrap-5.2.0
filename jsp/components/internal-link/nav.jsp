<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div class="nav-item has-treeview ${previewCSS}" id="${previewID}" ${previewData}>
<a href="${url}"  class="${comp.style} nav-link">
	<c:if test="${not empty page.font}">${page.font}</c:if>
	<p>${label}</p>
</a>
</div>