<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="wizard-list">
<c:forEach var="question" items="${questions}" varStatus="status">
	<div class="wizard-list-item card border-left-success h-100 py-2 mb-3 active">
		<div class="card-body">
			<div class="row no-gutters align-items-center">
				<div class="col-sm-auto mr-2 d-flex justify-content-center">
					<i class="far fa-check-square text-gray-300"></i>
				</div>
				<div class="col-sm mr-2 d-flex justify-content-center">
					<div class="text-xs font-weight-bold text-success text-uppercase mb-1 text-center">${question.label}</div>
				</div>
				<div class="col-sm-auto d-flex justify-content-center">					
				<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  ${question.response.label}
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
</div>