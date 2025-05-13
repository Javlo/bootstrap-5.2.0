<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:url var="openmapURL" value="https://www.openstreetmap.org/search">
<c:param name="query" value="${value}" />
</c:url>${value} <a href="${openmapURL}" target="_blank"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></a>