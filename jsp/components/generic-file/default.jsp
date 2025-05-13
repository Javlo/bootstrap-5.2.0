<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:set var="fontFile" value='<i class="far fa-file"></i>' />
<c:choose>
	<c:when test = "${ext == 'pdf'}">
		<c:set var="fontFile" value='<i class="far fa-file-pdf"></i>' />
	</c:when>
	<c:when test = "${ext == 'doc' || ext == 'docx'}">
		<c:set var="fontFile" value='<i class="far fa-file-word"></i>' />
	</c:when>
	<c:when test = "${ext == 'xls' || ext == 'xlsx'}">
		<c:set var="fontFile" value='<i class="far fa-file-excel"></i>' />
	</c:when>
	<c:when test = "${ext == 'ppt' || ext == 'pptx'}">
		<c:set var="fontFile" value="<i class='far fa-file-powerpoint'></i>" />
	</c:when>
	<c:when test = "${ext == 'mp4' || ext == 'mov' || ext == 'avi' || ext == 'vob' || ext == 'ogg' || ext == 'wnv' || ext == 'mpg' || ext == 'webm'}">
		<c:set var="fontFile" value='<i class="far fa-file-video"></i>' />
	</c:when>
	<c:when test = "${ext == 'jpg' || ext == 'gif' || ext == 'png' || ext == 'bmp' || ext == 'psd' || ext == 'jpeg' || ext == 'tif' || ext == 'tiff'}">
		<c:set var="fontFile" value='<i class="far fa-file-image"></i>' />
	</c:when>
	<c:when test = "${ext == 'zip' || ext == 'gz' || ext == 'rar' || ext == '7z' || ext == 'tar' || ext == 'arj' || ext == 'jar' || ext == 'zz'}">
		<c:set var="fontFile" value='<i class="far fa-file-archive"></i>' />
	</c:when>
</c:choose>
<div ${previewAttributes}><c:if test="${empty label}">need file...</c:if>
<a class="generic-file ${comp.style}" ${globalContext.openFileAsPopup?' target="_blank"':''}" href="${url}">
${fontFile} ${label}
</a></div>