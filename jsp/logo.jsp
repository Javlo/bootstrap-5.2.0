<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${not empty info.logoRawUrl}"><a class="navbar-brand logo d-flex align-items-center" href="${info.rootURL}"><img src="${info.logoRawUrl}" alt="${info.globalTitle}" /></a></c:if>
<c:if test="${empty info.logoRawUrl}"><a class="navbar-brand logo d-flex align-items-center" href="${info.rootURL}">${info.globalTitle}</a></c:if>	
