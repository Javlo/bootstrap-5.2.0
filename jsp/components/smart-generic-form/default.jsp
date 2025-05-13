<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
 %><div class="smart-form ${openEvent?'open-event':'close-event'}" id="ac-${compid}"> 
<c:if test="${not empty msg.message}"><div class="alert alert-${msg.bootstrapType}" role="alert">${msg.message}</div></c:if>
<c:if test="${empty valid}">
<c:if test="${not empty comp.title}"><h2>${comp.title}</h2></c:if>
<c:if test="${fn:length(fields)>0}">
<form id="form-${compid}" method="post" action="${info.virtualCurrentURL}#ac-${compid}" ${comp.file?' enctype="multipart/form-data"':''} role="form" onchange="form${compid}Change()">
<jsp:include page="basic.jsp"></jsp:include>
<c:if test="${!validForm}">
<c:forEach var="localField" items="${fields}">
	<c:if test="${localField.type != 'hidden'}">
	<c:set var="field" value="${localField}" scope="request" />	
	<jsp:include page="field.jsp" />
	</c:if>
</c:forEach>
</c:if>

<c:if test="${comp.captcha && !validForm}">
<jsp:include page="captcha.jsp" />
</c:if>

<c:if test="${not empty ci18n['message.required']}">
	<p class="required">${ci18n['message.required']}</p>
</c:if>

<c:if test="${!validForm}">
<div class="form-group action text-right">
	<c:if test="${!editForm}">
	<button type="submit" class="btn btn-primary">${i18n.view['global.send']}</button>
	</c:if><c:if test="${editForm}">
	<button type="submit" class="btn btn-primary">${i18n.view['global.update']}</button>
	</c:if>
</div>
</c:if>
</form>
</c:if>
</c:if>
</div>

<jsp:include page="condition.jsp" />