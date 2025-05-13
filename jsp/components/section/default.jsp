<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"
%>
<c:if test="${empty boxBloc}"><c:set var="boxBloc" value="${fn:indexOf(comp.style, 'box') >= 0}" scope="request" /></c:if>

<c:if test="${boxBloc}">
  <c:if test="${!closeBox}">
    <c:if test="${contentContext.previewEditionMode}"><div ${previewAttributes}>[OPEN SECTION] - <b>${comp.style != null?comp.style:''}</b></div></c:if>
    <div class="section ${comp.style}" style="${cssStyle}"><div class="section-container">
  </c:if>
  <c:if test="${closeBox}">
    <c:if test="${contentContext.previewEditionMode}"><div ${previewAttributes}>[CLOSE SECTION]</div></c:if>
    </div></div> <!-- close box -->
  </c:if>
</c:if>

<c:if test="${!boxBloc}">
  <c:if test="${!closeBox}">
    <div id="${comp.htmlId}" class="content-section layout-${comp.containerLayout} color-${comp.containerColor} ${comp.fix?'fix-background':'flex-background'} ${comp.parallax?'parallax':'no-parallax'} section-${comp.style} ${cssClass}">
    <c:if test="${contentContext.previewEditionMode}">
      <div id="${previewID}" class="${previewClass}" style="${cssStyle}">${not empty titleBox?titleBox:'SECTION'}</div>
    </c:if>
    <c:set var="style" value="style=\"${cssStyle}\"" />
    <c:if test="${not empty backgroundImage}">
      <c:if test="${!comp.parallax}">
        <c:set var="style" value="style=\"background-image: url('${backgroundImage.previewURL}'); background-size: 100%; ${cssStyle}\"" />
      </c:if>
    </c:if>
    <div class="section-body" ${style}>
    <div class="section-content">
    <c:if test="${not empty backgroundImage && comp.parallax}">
      <img class="img-parallax" src="${backgroundImage.previewURL}" alt="" />
    </c:if>
  </c:if><c:if test="${closeBox}">
  </div></div>
  <c:if test="${contentContext.previewEditionMode || not empty footerBox}">
    <div class="section-footer"><div id="${previewID}" class="${previewClass}">${not empty footerBox?footerBox:'/SECTION'}</div></div>
  </c:if>
  </div>
</c:if>
</c:if>

<c:if test="${closeBox}">
  <c:set var="boxBloc" value="" scope="request" />
</c:if>
