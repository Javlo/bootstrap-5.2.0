<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:if test="${not empty param.nextCalendar && empty param.ajaxNextCalendar}">
<div class="calendar-wrapper ${fields.cssclass}">
<div class="calendar-group calendar-group-size-${param.nextCalendar+1}  align-items-center ajax-group " id="calendar-group-${compid}">
<div class="next">
	<c:url var="previousURL" value="${info.currentAjaxURL}" context="/">
		<c:param name="calendar" value="true" />
		<c:param name="calzone" value="calendar-group-${compid}" />
		<c:param name="calkey" value="${calendar.previousKey}" />
		<c:param name="comp-id" value="${compid}" />
		<c:param name="step" value="${-param.nextCalendar}" />
		<c:param name="webaction" value="calendar.updatecalendargroup" />
	</c:url>
	<a class="btn btn-standard ajax" href="${previousURL}"><i class="fas fa-caret-left" aria-hidden="true"></i></a>	
</div>
<div class="calendar-group align-items-center calendar-list">
</c:if>
<div class="calendar small-calendar">	
	<c:if test="${empty param.nextCalendar}">
	<div class="btn-group pull-right" role="group">	
		<c:url var="previousURL" value="${info.currentURL}" context="/"><c:param name="calendar" value="true" /><c:param name="calkey" value="${calendar.previousKey}" /></c:url>
		<c:url var="nextURL" value="${info.currentURL}" context="/"><c:param name="calendar" value="true" /><c:param name="calkey" value="${calendar.nextKey}" /></c:url>	
		<a class="btn btn-standard" href="${previousURL}"><i class="fas fa-caret-left" aria-hidden="true"></i></a>
		<a class="btn btn-standard" href="${nextURL}"><i class="fas fa-caret-right" aria-hidden="true"></i></a>
	</div></c:if>
	
	<h2>${calendar.label}</h2>	
	
	<table>
		<thead>
			<tr>
				<c:forEach var="day" items="${calendar.days}">
					<th>${day.extraShortLabel}</th>
				</c:forEach> 
			</tr>
		</thead>
		<tbody>
			<c:forEach var = "w" begin = "0" end = "5" varStatus="wstatus">
				<tr class="week-${wstatus.index+1}">
				<c:forEach var = "d" begin = "0" end = "6" varStatus="dstatus">
					<c:set var="icals" value="${calendar.monthEvents[calendar.daysBloc[w][d].monthDay]}" />
					<td class="${calendar.daysBloc[w][d].active?'active':'unactive'} ${calendar.daysBloc[w][d].toDay?'today':'nottoday'} ${empty icals || !calendar.daysBloc[w][d].active || fn:length(icals)==0?'empty':'notempty'} day-${dstatus.index+1}">
						<div class="day-number">${calendar.daysBloc[w][d].monthDay}</div>												
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
		</tbody>		
	</table>
</div>
<c:if test="${not empty param.nextCalendar && (empty param.ajaxNextCalendar || param.ajaxNextCalendar>0)}">
	<c:set var="calId" value="subcal_${compid}_${empty param.ajaxNextCalendar?param.nextCalendar:param.ajaxNextCalendar}" />
	<div id="${calId}" class="subcal cal-${empty param.ajaxNextCalendar?param.nextCalendar:param.ajaxNextCalendar}">...
	<c:url var="ajaxURL" value="${info.currentAjaxURL}" context="/">
		<c:param name="webaction" value="calendar.updatecalendar" />
		<c:param name="calzone" value="${calId}" />
		<c:param name="comp-id" value="${compid}" />
		<c:param name="calkey" value="${calendar.nextKey}" />
		<c:if test="${empty param.ajaxNextCalendar}">
			<c:param name="ajaxNextCalendar" value="${param.nextCalendar-1}" />
		</c:if><c:if test="${not empty param.ajaxNextCalendar}">
			<c:param name="ajaxNextCalendar" value="${param.ajaxNextCalendar-1}" />
		</c:if>
	</c:url>
	<script>ajaxRequest("${ajaxURL}");</script></div>
</c:if>
<c:if test="${not empty param.nextCalendar && empty param.ajaxNextCalendar}">
<c:url var="nextURL" value="${info.currentAjaxURL}" context="/">
	<c:param name="calendar" value="true" />
	<c:param name="calzone" value="calendar-group-${compid}" />
	<c:param name="calkey" value="${calendar.nextKey}" />
	<c:param name="comp-id" value="${compid}" />
	<c:param name="step" value="${param.nextCalendar}" />
	<c:param name="webaction" value="calendar.updatecalendargroup" />
</c:url>
</div>
<div class="previous">
<a class="btn btn-standard ajax" href="${nextURL}"><i class="fas fa-caret-right" aria-hidden="true"></i></a>
</div>
</div>
<c:if test="${!contentContext.ajax}">
<div class="calendar-legend row justify-content-center">
	<div class="col-3"><div class="icon empty">&nbsp;</div> ${i18n.view['global.available']}</div>
	<div class="col-3"><div class="icon notempty">&nbsp;</div> ${i18n.view['global.unavailable']}</div>
</div></c:if>
</div>
</c:if>
