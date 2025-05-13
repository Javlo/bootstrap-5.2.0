<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>

<c:if test="${empty linkedPage}">
  <div class="alert alert-danger">target page undefined.</div>
</c:if>

<c:if test="${contentContext.edition}">
  <div id="${previewID}" class="alert alert-info ${previewCSS}" ${previewData}>POPUP : ${label}</div>
</c:if>

<c:if test="${not empty linkedPage && !contentContext.edition}">

<div id="modal-${compid}" class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">${label}</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <c:if test="${!param._popup})">
        <jsp:setProperty name="contentContext" property="allLanguage" value="${child.contentLanguage}" />
	    <jsp:setProperty name="contentContext" property="currentPageCached" value="${linkedPage}" />
        <jsp:include page="/jsp/view/content_view.jsp?area=${contentContext.area}&_popup=true" />
        </c:if>
	  </div>
    </div>
  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function(event) {     
	$('#modal-${compid}').modal();
});
</script>

</c:if>