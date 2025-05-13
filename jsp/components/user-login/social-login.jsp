<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${not empty info.userName}">
<div class="widgetbox edit-user">
<div class="content">
<div class="row">
<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
    <input type="hidden" name="webaction" value="user-login.logout" />
	<input type="hidden" name="user" value="${user.name}" />
</div>

<button class="btn btn-default pull-right" type="submit" name="logout">
  ${i18n.edit['global.logout']} <span class="badge">${user.name}</span>
</button>

</form>
</div></div></div>
</c:if>

<c:if test="${empty info.userName}">
<div class="widgetbox edit-user">
<div class="content">
<div class="social-box">
	<div class="form-group"><div class="row"><c:if test="${not empty facebook_signinURL}"><div class="col-sm-${not empty google_signinURL?'6':'12'}">
	<a class="btn btn-block btn-social btn-lg btn-facebook" href="${facebook_signinURL}"><i class="fab fa-facebook"></i>Login with facebook</a>
	</div></c:if><c:if test="${not empty google_signinURL}"><div class="col-sm-${not empty facebook_signinURL?'6':'12'}">	
	<a class="btn btn-block btn-social btn-lg btn-google" href="${google_signinURL}"><i class="fab fa-google"></i>Login with google</a>
	</div></c:if></div></div>
</div></div></div></c:if>

<c:if test="${not empty messages.globalMessage && not empty webaction}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div></c:if>
