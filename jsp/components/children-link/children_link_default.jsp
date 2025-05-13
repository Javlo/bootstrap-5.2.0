<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${fn:length(children)>0}">
<c:if test="${not empty title}">
	<h2>${title}</h2>
</c:if>


<div class="list-group mb-3 list-group-flush" id="navbarChildrenLink${compid}">
	<c:forEach var="child" items="${children}" varStatus="status">
  <a href="${child.url}" class="${popup?'popup ':''}${child.selected?' active ':''}list-group-item list-group-item-action ${status.index % 2 == 0?'odd':'even'}" aria-current="true">

      <h5 class="mb-1">${child.fullLabel}</h5>
      <c:if test="${not empty child.description}"><p class="mb-1">${child.description}</p></c:if>

  </a>
  </c:forEach>
</div>

</c:if>
