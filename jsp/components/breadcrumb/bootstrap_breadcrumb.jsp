<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:set var="start" value="0" /><c:if test="${not empty comp.value}"><c:set var="start" value="${comp.value}" /></c:if>
<nav aria-label="breadcrumb" role="navigation">
<ol class="breadcrumb">
<c:forEach var="page" items="${pages}" varStatus="status"><c:if test="${status.index>=start}"> 
<li class="breadcrumb-item" itemscope itemtype="http://data-vocabulary.org/Breadcrumb" aria-current="page">
<c:if test="${page.realContent || page.root}">
  <a href="${page.url}" itemprop="url">
    <span itemprop="title">${page.info.label}</span>
  </a>
</c:if><c:if test="${!page.realContent && !page.root}">
  <span class="nolink">
    <span itemprop="title">${page.info.label}</span>
  </span>
</c:if>
</li></c:if>  
</c:forEach>
</ol>
</nav>