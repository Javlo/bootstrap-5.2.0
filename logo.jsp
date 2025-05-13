<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${empty info.logoUrl}"><a href="${info.rootURL}" class="${not empty param.cssClass?param.cssClass:''}">${info.globalTitle}</a></c:if>
<c:if test="${not empty info.logoUrl}"><a href="${info.rootURL}" class="${not empty param.cssClass?param.cssClass:''}"><img alt="${info.globalTitle}" src="${info.logoUrl}" /></a></c:if>