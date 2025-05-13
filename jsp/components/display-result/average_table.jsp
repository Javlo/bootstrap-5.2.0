<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${info.rootTemplateURL}/lib/chartjs/chart.js"></script>
<script src="${info.rootTemplateURL}/lib/chartjs/plugin/chartjs-plugin-annotation.min.js"></script>

<h1>${title}</h1>

<c:set var="color1" value="rgba(0, 128, 0, 0.4)" />
<c:set var="border1" value="rgba(0, 128, 0, 0.8)" />
<c:set var="color2" value="rgba(0, 255, 255, 0.4)" />
<c:set var="border2" value="rgba(0, 255, 255, 0.8)" />
<c:set var="color3" value="rgba(255, 255, 0, 0.4)" />
<c:set var="border3" value="rgba(255, 255, 0, 0.8)" />
<c:set var="color4" value="rgba(247, 110, 17, 0.4)" />
<c:set var="border4" value="rgba(247, 110, 17, 0.8)" />
<c:set var="color5" value="rgba(255, 0, 0, 0.4)" />
<c:set var="border5" value="rgba(255, 0, 0, 0.8)" />

<c:set var="gray1" value="rgba(160, 160, 160, 0.6)" />
<c:set var="grayborder1" value="rgba(80, 80, 80, 0.6)" />

<div class="average table">

<div class="row" style="font-size: 0.9em">
		<hr />
		<div class="row justify-content-between mb-3">			
			<div style="text-transform: capitalize;" class="col-2 legend">${vi18n['global.legend']}</div>		
			<div class="col-2" style="text-align: center; background-color: ${color1}; border: 1px ${border1} solid;">
				3.75 <i class="bi bi-arrow-right-short"></i> 5
			</div>
			<div class="col-2" style="text-align: center; background-color: ${color3}; border: 1px ${border3} solid;">
				3.25 <i class="bi bi-arrow-right-short"></i> 3.74
			</div>
			<div class="col-2" style="text-align: center; background-color: ${color5}; border: 1px ${border5} solid;">
				0 <i class="bi bi-arrow-right-short"></i> 3.25
			</div>
		</div>
		<hr />
	</div>

<table class="table" style="font-size: 1.3em;">
<tr>
	<td>&nbsp;</td>
	<th style="text-align: center; font-weight: normal;">${fields.fileTitle}</th>
	<c:if test="${not empty averageNotSort2}">
		<th style="text-align: center; font-weight: normal;">${fields.fileTitle2}</th>
		<th style="text-align: center; font-weight: normal;"><i class="bi bi-plus-slash-minus"></i></th>
	</c:if>
</tr>
<tbody>
<c:set var="total" value="0" />
<c:set var="total2" value="0" />
<c:set var="totalSize" value="${fn:length(averageNotSort)}" />
<c:forEach var="entry" items="${averageNotSort}">
<c:set var="backgroundColor" value="${color1}" />
<c:if test="${entry.value<3.75 && entry.value>=3.25}"><c:set var="backgroundColor" value="${color3}" /></c:if>
<c:if test="${entry.value<3.25}"><c:set var="backgroundColor" value="${color5}" /></c:if>

<tr>
<th style="font-weight: normal;">${fn:replace(entry.key, '#', ' ')}</th>

<c:if test="${not empty averageNotSort2}">
	<c:set var="value2" value="${averageNotSort2[entry.key]}" />
	<c:set var="backgroundColor2" value="${color1}" />
	<c:if test="${entry.value<3.75 && entry.value>=3.25}"><c:set var="backgroundColor2" value="${color3}" /></c:if>
	<c:if test="${entry.value<3.25}"><c:set var="backgroundColor2" value="${color5}" /></c:if>
	<td style="background-color: ${backgroundColor2}; padding: 3px 6px; color: #656565; text-align: center; vertical-align: middle; opacity: 0.6;"><fmt:formatNumber pattern="###.##" type="number" value="${value2}" /></td>	
	<c:set var="total2" value="${total2+value2}" />
</c:if>

<td style="background-color: ${backgroundColor}; padding: 3px 6px; color: #656565; text-align: center; vertical-align: middle;"><fmt:formatNumber pattern="###.##" type="number" value="${entry.value}" /></td>
<c:set var="total" value="${total+entry.value}" />

<c:if test="${not empty averageNotSort2}">
	<c:set var="value2" value="${averageNotSort2[entry.key]}" />
	<td style="padding: 3px 6px; color: #656565; text-align: center; vertical-align: middle;"><fmt:formatNumber pattern="###.##" type="number" value="${value2-entry.value}" /></td>
</c:if>

</tr>
</c:forEach>
<tr>
	<td>&nbsp;</td>
	<c:if test="${not empty averageNotSort2}">
		<th style="padding: 3px 6px; color: #656565; text-align: center; vertical-align: middle; opacity: 0.6;">
			<fmt:formatNumber pattern="###.##" type="number" value="${total2/totalSize}" />
		</th>
	</c:if>
	<th><fmt:formatNumber pattern="###.##" type="number" value="${total/totalSize}" /></th>
	<c:if test="${not empty averageNotSort2}">
		<th style="padding: 3px 6px; color: #656565; text-align: center; vertical-align: middle; opacity: 0.6;">
			<fmt:formatNumber pattern="###.##" type="number" value="${total2/totalSize-total/totalSize}" />
		</th>
	</c:if>
</tr>
</tbody>
</table>
<div class="d-flex flex-row-reverse bd-highlight">
		<i class="bi bi-person-fill"></i>
		<div class="participants">${participants}&nbsp;</div>
	</div>
</div>