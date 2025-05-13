<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><ul class="${param.ulclass}">
<c:set var="depth" value="0" />
<c:forEach var="line" items="${lines}">
	<c:forEach begin="${depth+1}" end="${line.depth}" varStatus="loop"><ul></c:forEach><c:forEach begin="${line.depth+1}" end="${depth}" varStatus="loop"></ul></c:forEach><c:set var="depth" value="${line.depth}" />	
	<li class="${param.liclass}"><c:if test="${empty line.prefix}">${line.text}</c:if><c:if test="${not empty line.prefix}"><strong>${line.prefix}</strong>${line.text}</c:if></li>
</c:forEach>
<c:forEach begin="0" end="${depth}" varStatus="loop"></ul></c:forEach>	
</ul>