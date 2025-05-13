<%@ page contentType="text/html" pageEncoding="UTF-8"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><div id="search-result">
<h1>${i18n.view['search.element-found']} '${searchResult.query}'  : ${fn:length(searchList)}</h1>
<div class="list-group">	
<c:forEach items="${searchList}" var="result">
<a class="list-group-item list-group-item-action flex-column align-items-start" href="${result.url}">
<div class="d-flex w-100 justify-content-between">
  <p class="mb-1">${result.title}</p>
  <c:if test="${not empty result.dateString}"><small>${result.dateString}</small></c:if>
</div>
<c:if test="${not empty result.description}"><p class="mb-1">${result.description}</p></c:if>
</a>
</c:forEach>
</div>
</div>