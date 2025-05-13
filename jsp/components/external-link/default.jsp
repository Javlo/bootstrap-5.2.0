<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div ${previewAttributes}><a class="external-link ${comp.style}" href="${link}" ${globalContext.openFileAsPopup?' target="_blank"':''}>${label}</a></div>