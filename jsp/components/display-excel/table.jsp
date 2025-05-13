<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table" style="table-layout: fixed;">

  <c:forEach var="average" items="${averageList}">
    <tr>
      <th>${average.label}</th>
      <td>
        <c:if test="${average.type == 1}">
          <fmt:formatNumber value="${average.average}" pattern="#.#"/> <c:if test="${not empty field.averageMax}">/ ${field.averageMax}</c:if>
        </c:if>
        <c:if test="${average.type == 2}">
          <c:forEach var="c" items="${average.count}">
            <div class="result-line" style="text-wrap: wrap;">${c.key} = <fmt:formatNumber value="${c.value/average.countMax}" type="percent" /></div>
          </c:forEach>
        </c:if>
      </td>
    </tr>
  </c:forEach>

  <tbody>

  </tbody>

</table>
