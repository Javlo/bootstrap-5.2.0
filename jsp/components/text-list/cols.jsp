<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:forEach var="line" items="${lines}">
	<div class="row ${param.cssclass}">
	<div class="col-sm-3"><c:if test="${not empty line.prefix}"><h3>${line.prefix}</h3></c:if></div>
	<div class="col-sm-9">${line.text}</div>
	</div>
</c:forEach>	
