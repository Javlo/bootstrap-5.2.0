<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<c:if test="${fn:length(info.page.parents)>0}">
<c:set var="pos" value="1" />
<ol itemscope itemtype="https://schema.org/BreadcrumbList">
<c:forEach var="page" items="${info.page.parents}" varStatus="status">
  <li itemprop="itemListElement" itemscope
      itemtype="https://schema.org/ListItem">
    <a itemprop="item" href="${page.url}">
        <span itemprop="name">${page.info.label}</span></a>
    	<meta itemprop="position" content="${pos}" /><c:set var="pos" value="${pos+1}" />
  </li>
</c:forEach>
</ol>
</c:if>