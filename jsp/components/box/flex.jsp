<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>

<c:if test="${empty boxBloc}">
    <c:set var="boxBloc" value="${fn:indexOf(comp.style, 'box') >= 0}" scope="request" />
</c:if>
<c:if test="${boxBloc}">
<c:if test="${!closeBox}">
<c:if test="${contentContext.previewEditionMode}"><div ${previewAttributes}>[OPEN BOX] - <b>${comp.style}</b></div></c:if>
<div class="box ${comp.style}"><div class="box-container">
</c:if>
<c:if test="${closeBox}">
<c:if test="${contentContext.previewEditionMode}"><div ${previewAttributes}>[CLOSE BOX]</div></c:if>
</div></div> <!-- close box -->
</c:if>
</c:if>

<c:if test="${!boxBloc}">
<c:if test="${!closeBox}">
  <c:if test="${contentContext.previewEditionMode}">
    <div id="${comp.sectionId}"  class="card-header border-0 _box_open"><div id="${previewID}" class="${previewClass}" ${previewData}>[OPEN BOX]</div></div>
  </c:if>

  <c:if test="${not empty titleBox}"><h${contentContext.titleDepth+1} class="box-title">{titleBox}</h${contentContext.titleDepth+1}></c:if>

  <div class="box-flex d-flex ${comp.style} ${manualCssClass} ${cssClass}">
</c:if><c:if test="${closeBox}">
</div>

  <c:if test="${contentContext.previewEditionMode || not empty footerBox}">
    <div class="card-footer _box_open"><div id="${previewID}" class="${previewClass}" ${previewData}>${not empty footerBox?footerBox:'[CLOSE BOX]'}</div></div>
  </c:if>


</c:if>
</c:if>

<c:if test="${closeBox}">
    <c:set var="boxBloc" value="" scope="request" />
</c:if>
