<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:if test="${fn:length(pages)==0}"><div class="alert alert-warning">${vi18n['global.no-result']}</div></c:if>

<c:if
	test="${fn:length(pages)>0}">
	<c:if test="${not empty firstPage}">
		<div class="first-page-complete">${firstPage}</div>
	</c:if>
	<c:if test="${not empty title}">
		<h2>${title}</h2>
	</c:if>
  <c:set var="tableId" value="table-${compid}" />
  <c:if test="${not empty param.tableId}">
    <c:set var="tableId" value="table-${param.tableId}" />
  </c:if>
	<table class="table table-striped table-bordered table-sm mt-3 mb-3"
         id="${tableId}"
         data-toggle="table"
         data-pagination="true"
         data-locale="${info.language}"
         data-url="${jsonUrl}"
  >
  <thead>
  <tr>
    <th data-field="title" data-sortable="true">${vi18n['global.title']}</th>
    <th data-field="startDate" data-sortable="true" data-formatter="rangeFormatter">${vi18n['global.date']}</th>
    <th data-field="url" data-formatter="linkFormatter"></th>
  </tr>
  </thead>
</table>
</c:if>

<style>
  table.table tr td {
    width: 1%;
    white-space: nowrap;
    height: auto;
  }
</style>

<script>
  function linkFormatter(value) {
    let mi = "${vi18n['global.moreinfo']}";
    return '<div class="d-flex justify-content-center"><a href="'+value+'" class="btn btn-outline-secondary btn-sm">'+mi+'</a></div>';
  }
  function rangeFormatter(value, row) {
    let date = new Date(value);
    console.log("row sd :",row.startDate);
    console.log("row ed :",row.endDate);
    let startDate = formatDayPart(date.getDate())+'/'+formatDayPart(date.getMonth()+1)+'/'+date.getFullYear();
    let endDate = "";
    if (row.startDate != row.endDate) {
      date = new Date(row.endDate);
      endDate = " - " + formatDayPart(date.getDate())+'/'+formatDayPart(date.getMonth()+1)+'/'+date.getFullYear();
    }
    return startDate + endDate;
  }
  /** utils **/
  function formatDayPart(value) {
    let date = ''+value;
    if (date.length == 1) {
      return '0'+date;
    } else {
      return date;
    }
  }
</script>
