<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" 
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" 
%>
<c:if test="${!previousSame}"><div class="member-list ${comp.style}"></c:if>
<div ${previewAttributes}>
<div class="card member" itemscope itemtype="http://schema.org/Person">
  <div class="card-header"><span itemprop="name">${name.value}</span><c:if test="${not empty category.values}"><c:forEach var="item" items="${category.values}"><span class="badge pull-right">${item}</span></c:forEach></c:if></div>
  <div class="card-body">
  	<div class="row">
  	<c:if test="${not empty logo.previewURL}"><div class="col-sm-4">	
		<figure><img src="${logo.previewURL}" alt="${name.value}" itemprop="image" class="img-thumbnail" /></figure>	
	</div></c:if>
  	<div class="col-sm-${empty logo.previewURL?'12':'8'}">  	
  	<c:set var="countField" value="0" />
  	<c:if test="${not empty email.value}"><c:set var="countField" value="${countField+1}" /><div class="form-group"><div class="input-group input-group-lg">
 		 <abbr title="${email.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-at"></i></div></abbr>
  		<div class="form-control" itemprop="email">${email.viewXHTMLCode}</div>
	</div></div></c:if>
	<c:if test="${not empty phone.displayValue}"><c:set var="countField" value="${countField+1}" /><div class="form-group"><div class="input-group input-group-lg">
 		 	<abbr title="${phone.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-phone" aria-hidden="true"></i></div></abbr>
 		 	<div class="form-control"><a href="tel:${phone.value}">${phone.displayValue}</a></div>
 	</div></div></c:if>	
    <c:if test="${not empty fax.displayValue}"><c:set var="countField" value="${countField+1}" /><div class="form-group"><div class="input-group input-group-lg">
 		 <abbr title="${fax.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-fax" aria-hidden="true"></i></div></abbr>
 		 <div class="form-control">${fax.displayValue}</div>
 	</div></div></c:if>
    <c:if test="${not empty web.viewXHTMLCode}"><c:set var="countField" value="${countField+1}" /><div class="form-group"><div class="input-group input-group-lg">
 		 <abbr title="${web.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-globe" aria-hidden="true"></i></div></abbr>
 		 <div class="form-control">${web.viewXHTMLCode}</div>
 	</div></div></c:if>
 	<c:if test="${not empty address.value || not empty postalcode.value}"><c:set var="countField" value="${countField+1}" /><div class="form-group"><address class="input-group input-group-lg free">
 		 <abbr title="${address.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-home" aria-hidden="true"></i></div></abbr>
 		 <div class="form-control">
 		 	<c:if test="${not empty address.value}">${address.displayValue}</c:if>
 		 	<c:if test="${not empty postalcode.value}"><br />${postalcode.value} ${city.value}</c:if>
 		 </div>
 	</address></div></c:if>
 	<c:if test="${not empty moreinfo.displayValue && countField < 3}">
	<p>${moreinfo.displayValue}</p>
	</c:if>	
	</div>	
	</div>
	<c:if test="${not empty moreinfo.displayValue  && countField >= 3}">
	<div class="row">
	<div class="col-12 moreinfo">
	<div class="input-group input-group-lg free">
 		 <abbr title="${moreinfo.label}" class="input-group-prepend"><div class="input-group-text"><i class="fas fa-info" aria-hidden="true"></i></div></abbr><p class="form-control">${moreinfo.displayValue}</p>
	</div>
	</div>
	</div>	
	</c:if>
  </div>
 </div>
</div><c:if test="${!nextSame}"></div> <!-- /teamList --></c:if>