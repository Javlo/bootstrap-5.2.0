<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div ${previewAttributes}><a class="external-link ${comp.style} btn btn-${empty param.btntype?'secondary':param.btntype}" href="${link}" ${globalContext.openFileAsPopup?' target="_blank"':''}>${label}</a></div>