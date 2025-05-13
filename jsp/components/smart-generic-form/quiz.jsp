<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="quiz"><c:if test="${not empty msg}"><div class="alert alert-${msg.bootstrapType}" role="alert">${msg.message}</div></c:if><c:if test="${empty quiz}">
<jsp:include page="default.jsp"></jsp:include>
<h3>${comp.resultTitle}</h3>
<ul class="list-group result">
<c:forEach var="response" items="${status.responses}" varStatus="status">
	<c:set var="cssClass" value="free" />
	<c:set var="icon" value="glyphicon glyphicon-star" />
	<c:if test="${not empty response.responseLabel}">
		<c:set var="cssClass" value="list-group-item-danger" />
		<c:set var="icon" value="glyphicon glyphicon-remove" />
		<c:if test="${response.response eq response.question.response}">
			<c:set var="cssClass" value="list-group-item-success" />
			<c:set var="icon" value="glyphicon glyphicon-ok" />
		</c:if>		
	</c:if>
	<li class="list-group-item ${cssClass}">
	<h${contentContext.titleDepth+1} class="list-group-item-heading"><span class="${icon}" aria-hidden="true"></span> <span class="question">${status.count}.${response.question.label}</span> : <span class="response badge">${response.responseLabel}</span></h${contentContext.titleDepth+1}>
	<c:if test="${not empty response.question.explanation}"><p>${response.question.explanation}</p></c:if>
	 </li>
</c:forEach>
</ul>
<form method="post" action="${info.currentURL}" ${comp.file?' enctype="multipart/form-data"':''}>
<input type="hidden" name="webaction" value="quiz.reset" />
<input type="hidden" name="comp-id" value="${comp.id}" />
<input type="submit" class="btn btn-primary center-block" value="${ci18n['reset']}" />
</form>

</c:if><c:if test="${not empty quiz}">
<h3>${comp.quizTitle}</h3>
<form method="post" action="${info.currentURL}" ${comp.file?' enctype="multipart/form-data"':''}>
<input type="hidden" name="webaction" value="quiz.response" />
<input type="hidden" name="comp-id" value="${comp.id}" />
<c:set var="field" value="${status.response.question}" scope="request" />
<div class="status">
<span class="badge">${status.question}/${fn:length(comp.questions)}</span>
</div>
<div class="row">
<jsp:include page="field.jsp" />
</div>
<c:if test="${not empty ci18n['skip']}"><input type="submit" name="skip" class="btn btn-default pull-right btn-skip" value="${ci18n['skip']}" /></c:if>
<input type="submit" class="btn btn-primary center-block" value="${ci18n['next']}" />

</form>
</c:if></div>