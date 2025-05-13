<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%>
<c:if test="${empty url}">need file...</c:if>
<div class="card ${previewCSS}" id="${previewID}">
  <div class="row">
    <div class="col-md-3 card-image-zone">
      <jv:changeFilter var="newURL" url="${imagePreview}" filter="list" newFilter="height-4" />
      <img src="${newURL}" class="w-100">
    </div>
    <div class="col card-text-zone">
        <h${contentContext.titleDepth+1} class="card-title">${label}</h${contentContext.titleDepth+1}>
        <c:if test="${not empty description}"><div class="card-text">${description}</div></c:if>
        <a href="${url}" class="btn btn-primary" ${globalContext.openFileAsPopup?' target="_blank"':''}>${fileName}</a>
    </div>
  </div>
</div>
