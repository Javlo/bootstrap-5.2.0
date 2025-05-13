<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div ${previewAttributes}><a class="generic-file ${comp.style} btn btn-standard" href="${url}" ${globalContext.openFileAsPopup?' target="_blank"':''}>${label}</a></div>