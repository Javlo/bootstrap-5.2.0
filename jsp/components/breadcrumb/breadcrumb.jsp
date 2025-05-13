<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<nav aria-label="breadcrumb">
<ol class="breadcrumb">
<c:forEach var="page" items="${pages}" varStatus="status">
<li class="breadcrumb-item" itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
  <c:if test="${page.realContent }"><a href="${page.url}" itemprop="url"><span itemprop="title">${page.info.label}</span></a></c:if>
  <c:if test="${!page.realContent }"><span itemprop="title">${page.info.label}</span></c:if>
</li>  
</c:forEach>
</ol>
</nav>
