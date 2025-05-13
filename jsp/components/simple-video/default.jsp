<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="${not empty param.background?'background-video':'thumbnail'}">
  <video id="vid${compid}" data-autoresize="fit" ${not empty param.controls?'controls':''} ${not empty param.autoplay?'autoplay':''} ${not empty param.autoplay && empty param.controls?'loop':''} poster="${previewURL}">
    <source type="video/mp4" src="${url}" />
  </video><c:if test="${not empty label}">
  <div class="caption">${label}</div></c:if>
</div>
