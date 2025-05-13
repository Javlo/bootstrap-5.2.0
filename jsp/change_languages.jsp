<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" 
%><div class="language">
<c:forEach var="lg" items="${info.languages}">
<a class="${lg == info.language?'active':'unactive'} btn btn-default" lang="${lg}" title="${lg}" href="${info.languageURLs[lg]}">${lg}</a>
</c:forEach></div>