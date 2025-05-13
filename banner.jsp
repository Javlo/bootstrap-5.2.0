<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${empty info.imageHeader}"><jv:imagetransform src="/img/default_banner.jpg" var="banner" filter="main-banner" /><div class="container main-banner"><img src="${banner}" alt="${info.globalTitle}" lang="en" /></c:if>
<c:if test="${not empty info.imageHeader}"><div class="container main-banner"><img src="${info.imageHeader.previewURL}" alt="${info.imageHeader.description}" /></c:if>
<c:if test="${not empty info.logoUrl}"><div class="logo logo-banner"><a href="${info.rootURL}"><img alt="${info.globalTitle}" src="${info.logoUrl}" /><span class="global-title">${info.globalTitle}</span></a><span class="align-reference">&nbsp;</span></div></c:if></div>