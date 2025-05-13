<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%>
<c:if test="${empty titleDepth}">
  <c:set var="titleDepth" value="${contentContext.titleDepth+1}" scope="request" />
</c:if>
<c:if test="${not empty title}">
  <c:if test="${empty linkTitle}">
  <h${titleDepth}>${title}</h${titleDepth}>
  </c:if><c:if test="${not empty linkTitle}">
  <h${titleDepth}><a href="${linkTitle}">${title}</a></h${titleDepth}>
  </c:if>
  <c:set var="titleDepth" value="${titleDepth+1}" scope="request" />
</c:if>

