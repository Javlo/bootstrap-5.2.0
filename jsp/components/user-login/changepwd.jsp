<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><h2>${vi18n['login.change-password']}</h2>

<c:if test="${not empty userName}">

<form class="hidden-print mb-3" id="loginform" action="${info.currentURL}" method="post">
<div>
<input type="hidden" value="user.changePasswordWithToken" name="webaction" />
<input type="hidden" value="${param.pwtoken}" name="token" />
</div>
<div class="form-group">
	<input class="username form-control" type="text" readonly title="${vi18n['form.login']}" value="${userName}" />
</div>
<div class="form-group row">
<div class="col-sm-6">
<input class="username form-control" type="password" name="password" placeholder="${vi18n['form.password']}" />
</div><div class="col-sm-6">
<input class="username form-control" type="password" name="password2" placeholder="${vi18n['form.password2']}" />
</div></div>
<button type="submit" class="submit btn btn-primary btn-xs">${vi18n['global.ok']}</button>
</form>

</c:if>

<c:if test="${empty userName}">
<div class="alert alert-danger">${vi18n["user.message.password-bad-token"]}</div>
</c:if>