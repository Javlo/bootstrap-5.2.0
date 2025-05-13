<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%><c:set var="idHTML" value='id="${previewID}" ' /><a ${not empty previewID?idHTML:''}class="btn btn-${empty param.btntype?'secondary':param.btntype} internal-link ${previewCSS}" href="${url}">${label}</a>