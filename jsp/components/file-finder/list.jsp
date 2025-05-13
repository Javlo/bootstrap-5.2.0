<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<c:if test="${fn:length(files)>0}">
<jsp:include page="title.jsp" />
  <ul>
    <c:forEach var="file" items="${files}" varStatus="status">
      <li><a href="${file.URL}">${file.title}</a></li>
    </c:forEach>
  </ul>
</c:if>
