<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:choose>    
    <c:when test = "${param.ext == 'pdf'}"><i class="far fa-file-pdf"></i></c:when>
    <c:when test = "${param.ext == 'xls' || param.ext == 'xlsx'}"><i class="far fa-file-excel"></i></c:when>
    <c:when test = "${param.ext == 'doc' || param.ext == 'docx'}"><i class="far fa-file-word"></i></c:when>
    <c:when test = "${param.ext == 'ppt' || param.ext == 'pptx'}"><i class="far fa-file-powerpoint"></i></c:when>
    <c:when test = "${param.ext == 'jpg' || param.ext == 'png'}"><i class="far fa-image"></i></c:when>
    <c:when test = "${param.ext == 'zip'}"><i class="far fa-file-archive"></i></c:when>
    <c:otherwise><i class="far fa-file"></i></c:otherwise>
</c:choose>