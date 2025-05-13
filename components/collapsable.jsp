<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="card">
  <a class="card-header" role="button" data-bs-toggle="collapse" href="#collapse-${compid}" aria-expanded="false" aria-controls="collapse-${compid}">
      <i class="fas fa-caret-right collapse-on caret" aria-hidden="true"></i>
      <i class="fas fa-caret-down collapse-off caret" aria-hidden="true"></i>
    ${title.value}</a>
    <div class="collapse" id="collapse-${compid}">
  		<div class="card-body">
   			<div class="card-text">${body.viewXHTMLCode}</div>
   		</div>
   	</div>
</div>