<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%>
<h2>linked</h2>
<h3>${taxonomy.linkedRoot.name}</h3>
<ul>
<c:forEach var="child" items="${taxonomy.linkedRoot.children}">
	<li>${child.name} #${fn:length(child.children)}
	<ul>
	<c:forEach var="subChild" items="${child.children}">
	<li>${subChild.name} #${fn:length(subChild.children)}
	</c:forEach>
	</ul>
	</li>
</c:forEach>
</ul>

<!-- <h2>linked</h2> -->
<%-- <c:forEach var="child" items="${taxonomy.root.children}"> --%>
<%-- <div>${child.name}</div> --%>
<%-- </c:forEach> --%>
