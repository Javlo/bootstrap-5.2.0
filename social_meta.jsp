<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%><meta property="og:site_name" content="${info.globalTitle}" />
<meta property="og:type" content="website" />
<meta property="og:title" content="${info.pageTitleForAttribute}" />
<meta property="og:url" content="${info.currentAbsoluteURL}" />
<c:if test="${empty info.page.info.description}">
	<meta property="og:description" content="${i18n.view['default.description']}" />
</c:if>
<c:if test="${not empty info.page.info.description}">
	<meta property="og:description" content="${info.pageDescription}" />
</c:if>
<meta name="twitter:card" content="summary" />
<meta name="twitter:title" content="${info.pageTitleForAttribute}" />
<meta name="twitter:site" content="${info.globalTitle}" />
<meta name="twitter:creator" content="${info.globalTitle}" />
<c:if test="${empty info.page.info.description}">
	<meta name="twitter:description" content="${i18n.view['default.description']}" />
</c:if>
<c:if test="${not empty info.page.info.description}">
	<meta name="twitter:description" content="${info.pageDescriptionForAttribute}" />
</c:if>
<c:if test="${not empty info.facebookImageUrl}">
   	<meta itemprop="image" content="${info.facebookImageUrl}" />
	<meta property="og:image" content="${info.facebookImageUrl}" />
	<meta property="og:image:width" content="1200" />
	<meta property="og:image:height" content="630" />
	<meta name="twitter:image" content="${info.facebookImageUrl}" />
</c:if>