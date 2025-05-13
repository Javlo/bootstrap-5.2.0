<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
	%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${interactive}">
  <jsp:include page="filter.jsp" />
</c:if>

<c:if test="${not empty title}">
  <h2>${title}</h2>
  <c:set var="title" value="" scope="request" />
</c:if>

<div class="row">
  <div class="col-md-3">
  <div id="calendar"></div>
  </div>
  <div class="col">
      <jsp:include page="table.jsp" />
  </div>
</div>

<script>
  document.addEventListener('DOMContentLoaded', () => {
    const options = {
      type: 'default',
      theme: 'light',
      date: {
        min: '${info.currentDateRFC3339}'
      },
      settings: {
        lang: '${info.language}',
        range: {
          disableAllDays: true,
            enabled: [<c:forEach items="${pages}" var="page" varStatus="status">${sep}<c:set var="sep" value="," />'${page.timeRange.startDateBean.sortableDate}:${page.timeRange.endDateBean.sortableDate}'</c:forEach>]
        },
        visibility: {
          theme: 'light',
        }
      },
      actions: {
        clickDay(e, dates) {
          let myTable = document.getElementById('table-${compid}');
          jQuery(myTable).bootstrapTable('refreshOptions', {
            url: '${jsonUrl}&date='+dates[0]
          });
        },
      },
    };
    const calendar = new VanillaCalendar('#calendar', options);
    calendar.init();
  });
</script>
