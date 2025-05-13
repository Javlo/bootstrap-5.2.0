<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><c:if test="${empty countInfoBloc}">
<c:set var="countInfoBloc" value="0" />
</c:if>
<c:set var="countInfoBloc" value="${countInfoBloc+1}" />
<div class="h100 item info-bloc ${not empty imagehover.previewURL || blackwhite.value?'hover-bloc':''} ${!nextSame?'last':''} ${!previousSame?'first':''} ${arrow.value || arrowActive?'arrow-bloc':'not-arrow-bloc'}">
<div class="row h100"><div class="h100 col-${colWidth<3?'lg':'md'}-${arrow.value || arrowActive?'10':'12'}">
<div class="bloc ${not empty image.previewURL?'image':'no-image'} ${border.value?'infobloc-border':'infobloc-no-border'} ${info.pageName == refpage.value?'active':'not-active'} ${background.value?'infobloc-background':'infobloc-no-background'} ${decoimg.value?'decorative-image':'information-image'}">
<c:if test="${empty title.value && info.previewEdit}">EMPTY</c:if>
<c:if test="${not empty link.URL}"><a href="${link.URL}" title="${link.title}"></c:if>
	  <c:if test="${not empty image.previewURL}">
	  	 <c:set var="imageUrl" value="${image.previewURL}" />
	  	 <c:if test="${decoimg.value}">
			   <c:remove var="imageUrl" />
			   <c:if test="${blackwhite.value}"><jv:changeFilter var="imageUrl" url="${image.previewURL}" filter="infobloc" newFilter="bloc-header-bw" /></c:if>
			   <c:if test="${!blackwhite.value}"><jv:changeFilter var="imageUrl" url="${image.previewURL}" filter="infobloc" newFilter="bloc-header" /></c:if>
		</c:if>
		 <img class="hover-hidden img-${comp.style}" src="${imageUrl}" alt="${image.alt}" />
	     <c:if test="${not empty imagehover.previewURL}">
	     	<c:set var="imageHoverUrl" value="${imagehover.previewURL}" />
	     	<c:if test="${decoimg.value}"><c:remove var="imageHoverUrl" /><jv:changeFilter var="imageHoverUrl" url="${imagehover.previewURL}" filter="infobloc" newFilter="bloc-header" /></c:if>
	     	<img class="hover-show img-${comp.style}" src="${imageHoverUrl}" alt="${imagehover.alt}" />
		 </c:if>
		 <c:if test="${blackwhite.value}">
			<c:set var="imageUrl" value="${image.previewURL}" />
			<c:if test="${decoimg.value}"><c:remove var="imageUrl" /><jv:changeFilter var="imageUrl" url="${image.previewURL}" filter="infobloc" newFilter="bloc-header" /></c:if>
			<c:if test="${!decoimg.value}"><c:remove var="imageUrl" /><jv:changeFilter var="imageUrl" url="${image.previewURL}" filter="infobloc" newFilter="infobloc-bw" /></c:if>
			<img class="hover-show img-${comp.style}" src="${imageUrl}" alt="${imagehover.alt}" />
		 </c:if>
	  </c:if><c:if test="${not empty chartitle.value}">
	  <div class="head-circle">
	  	<span>${chartitle.value}</span>
	  </div>
	  </c:if>      
      <h${contentContext.titleDepth+1}>${title.displayValue}</h${contentContext.titleDepth+1}>
      <c:if test="${not empty body.value}">${body.value}</c:if>
 <c:if test="${not empty link.URL}"></a></c:if>       
</div></div>
<c:if test="${arrow.value}"><c:set var="arrowActive" value="true" scope="request" /><div class="arrow col-${width.value<3?'lg':'md'}-2 align-item-center align-self-center">
	<i class="fas fa-arrow-right d-none d-${width.value<3?'lg':'md'}-block arrow-right"></i>
	<i class="fas fa-arrow-down d-${width.value<3?'lg':'md'}-none arrow-down"></i>
</div></c:if>
<c:if test="${!arrow.value && arrowActive}"><c:set var="arrowActive" value="false" scope="request" /><div class="arrow col-${width.value<3?'lg':'md'}-2  align-self-center">
	<i class="fas fa-check d-none d-${width.value<3?'lg':'md'}-block arrow-right"></i>
	<i class="fas fa-check d-${width.value<3?'lg':'md'}-none arrow-down"></i></div>
</c:if></div>
</div>