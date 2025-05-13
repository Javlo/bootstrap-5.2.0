<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib
	prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@ taglib
	uri="/WEB-INF/javlo.tld" prefix="jv"%>

<div class="card">
	<div class="card-header">
		<h2>${title.value}</h2>
	</div>
	<div class="card-body">
		<c:if test="${not empty description.value}"><p class="card-text description">${description.value}</p></c:if>
		<c:if test="${not empty objectifs.value}"><p class="card-text objectifs">${objectifs.value}</p></c:if>
		<a href="${page.url}" class="btn btn-primary">${i18n.view['global.moreinfo']}</a>
	</div>
	<div class="card-footer text-muted">
		<i class="far fa-calendar-alt"></i> ${dates.value}
		<c:if test="${cheque.value}"><div class="float-right" title="ch&egrave;que formation"> <i class="fas fa-money-check"></i></div></c:if>
	</div>
</div>