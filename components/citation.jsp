<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="well">
<c:if test="${not empty title.value}"><span class="title">${title.value}</span></c:if>
<c:if test="${not empty citation.value}"><p>${citation.displayValue}</p></c:if>
<c:if test="${not empty signature.value}"><span class="signature">${signature.value}</span></c:if>
</div>