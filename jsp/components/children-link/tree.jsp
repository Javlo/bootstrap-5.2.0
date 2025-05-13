<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h3>${title}</h3>
</c:if>
<c:set var="localcompid" value="${compid}" />
<div class="tree-view" id="tree-${localcompid}"><jsp:include page="tree_rec.jsp?depth=1" /></div>
</c:if>
<script>
document.addEventListener("DOMContentLoaded", function(event) {
	$('#tree-${localcompid}').treeview();
});
</script> 