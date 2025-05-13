<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:url var="gmapURL" value="https://www.google.com/maps">
<c:param name="q" value="${value}" />
</c:url><div class="label-group">
<label>${i18n.view['global.location']}</label>
<div class="value">${value} <a href="${gmapURL}" target="_blank"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></a></div>
</div>
