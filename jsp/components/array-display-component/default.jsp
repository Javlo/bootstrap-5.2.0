<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
<ul>
<c:forEach var="item" items="${items}">
<li>
	<c:forEach var="field" items="${item}">
		${field.key}:${field.value} <br />
	</c:forEach>
</li>
</c:forEach>
</ul>