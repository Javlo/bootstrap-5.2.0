<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="quicklink col-md-2 col-sm-6 col-xs-6 row-2 ${comp.style}">
<div ${previewAttributes}><div class="wrapper"><a class="box" href="${link}" ${globalContext.openFileAsPopup?' target="_blank"':''}><h4>${label}</h4></a></div></div>
</div>