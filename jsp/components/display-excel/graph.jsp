<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table" style="table-layout: fixed;">

  <c:forEach var="average" items="${averageList}">
    <tr>
      <th ${average.largeLabelCount?'colspan="2"':'style="max-width: 50%;"'}>${average.label}</th>

      <c:if test="${average.largeLabelCount}">
        </tr><tr>
      </c:if>

      <td ${average.largeLabelCount?'colspan="2"':'style=""'}>

        <c:if test="${average.type == 1}">
          <div class="graph bar">
            <div class="bar-in" style="width: ${average.average/field.averageMax*100}%">
            <div class="bar-label" style="max-width: ${average.average/field.averageMax*100}%"> <fmt:formatNumber value="${average.average}" pattern="#.#"/><c:if
              test="${not empty field.averageMax}"> /${field.averageMax}</c:if></div>
          </div>
          </div>
        </c:if>
        <c:if test="${average.type == 2}">
          <c:forEach var="c" items="${average.sortedCount}">
           <div class="graph bar">
              <div class="bar-in" style="width: ${c.value/average.countMax*100}%">
             <div class="bar-label">
                <div class="result-line">${c.key} - <b><fmt:formatNumber value="${c.value/average.countMax}" type="percent"/></b></div>
              </div>
            </div>
           </div>

          </c:forEach>
        </c:if>

      </td>
    </tr>
  </c:forEach>

  <tbody>

  </tbody>

</table>
