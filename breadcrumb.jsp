<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><ol class="breadcrumb" itemscope itemtype="https://schema.org/BreadcrumbList">
<c:forEach var="page" items="${info.pagePath}" varStatus="status"></c:forEach>
<li class="item" itemprop="itemListElement" itemscope itemtype="https://schema.org/ListItem">
  <a href="${page.url}" itemprop="item">
    <span itemprop="name">${page.info.label}</span>
  </a>
</li>  
</c:forEach>
</ol>