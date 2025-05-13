<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
	%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	$(document).ready(function() {
		$("#calendar").fullCalendar({
			defaultDate: '<fmt:formatDate type="time" value="${info.now}" pattern="yyyy-MM-dd" />',
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: false,
			lang: '${info.contentLanguage}',
			eventLimit: true,
			events: [
				<c:forEach items="${pages}" var="page" varStatus="status"><c:if test="${not empty page.event && not empty page.event.start}">
				{
					title: '${page.title}',
					url : '${page.url}',
					start: '<fmt:formatDate type="time" value="${page.event.start}" pattern="yyyy-MM-dd'T'HH:mm:ss" />'
					<c:if test="${not empty page.event.end}">,end: '<fmt:formatDate type="time" value="${page.event.end}" pattern="yyyy-MM-dd'T'HH:mm:ss" />'</c:if>
				}<c:if test="${!status.last}">,</c:if></c:if></c:forEach>
			]
		});
		toBootstrap($("#calendar"));
	});
</script>
<div id="calendar"></div>
