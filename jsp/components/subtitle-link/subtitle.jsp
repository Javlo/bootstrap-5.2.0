<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><nav>
  <c:if test="${not empty value}"><h2>${value}</h2></c:if>  
  <ul>
  	<c:set var="downLink" value="" />
	<c:forEach items="${links}" var="link" varStatus="status"><c:if test="${link.level ==  '2'}">
		<c:if test="${empty downLink}"><c:set var="downLink" value="${link.url}" /></c:if>
		<li class="${status.index==0?'first':''}"><a href="${link.url}" class="js-scroll-trigger"><span>${link.label}</span></a></li></c:if>
	</c:forEach>
  </ul>
  <c:if test="${style == 'down-link'}">
  	<div class="down-link mb-3 mt-3 text-center"><a class="js-scroll-trigger" href="${downLink}"><i class="fas fa-angle-double-down"></i></a></div>
  </c:if>
</nav>