<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><div class="mailing">

<c:if test="${not empty title}"><h2>${title}</h2></c:if>

<form method="post" action="${info.currentUrl}">

<c:if test="${name}">
<div class="row">
<div class="col-sm-6">
<div class="form-group">
	<label for="firstname">${i18n.view['field.firstname']}</label>
	<input class="form-control" type="text" id="firstname" name="firstname"  />	
</div>
</div><div class="col-sm-6">
<div class="form-group">
	<label for="lastname">${i18n.view['field.lastname']}</label>
	<input class="form-control" type="text" id="lastname" name="lastname"  />	
</div>
</div></div>
</c:if>


<div class="row">
<div class="col-sm-12">
<div class="form-group">
	<input type="hidden" name="comp-id" value="${comp.id}" />
	<input type="hidden" name="webaction" value="mailing-registration.submit" />
	<label for="email">${i18n.view['field.email']}</label>
	<input class="form-control" type="text" name="email" />
</div></div></div>
<div class="action d-flex justify-content-end">
<input class="btn btn-primary pull-right" type="submit" value="ok" />
</div>
</form>
</div>
