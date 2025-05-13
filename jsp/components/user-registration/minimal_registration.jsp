<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${not empty info.userName && userInfoMap['accountType'] == 'default'}">
<div class="widgetbox edit-user">
<h3><span>${i18n.edit['user.change-password']}</span></h3>
<div class="content">

<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
	<input type="hidden" name="webaction" value="changePassword" />
	<input type="hidden" name="user" value="${user.name}" />
</div>
<div class="row">
<div class="col-md-6">
<div class="form-group">
	<label for="password">${i18n.view['user.current-password']}</label>
	<input class="form-control" type="password" id="password" name="password" value="" /> 
</div>
</div><div class="col-md-6">
<div class="form-group">
	<label for="newpassword">${i18n.view['user.new-password']}</label>
	<input class="form-control" type="password" id="newpassword" name="newpassword" value="" />	 
</div>
<button class="btn btn-default pull-right" type="submit" name="ok">${i18n.view['global.ok']}</button>
</div>
</div>
</form>
</div>
</div>
</c:if>

<div class="widgetbox edit-user">

<c:if test="${not empty info.userName}"><h3><span>${i18n.edit['user.title.edit']} : ${user.name}</span></h3></c:if>
<div class="content">
<c:if test="${empty info.userName}"><div class="social-box">
	<div class="form-group"><div class="row"><c:if test="${not empty facebook_signinURL}"><div class="col-sm-6">
	<a class="btn btn-block btn-social btn-lg btn-facebook" href="${facebook_signinURL}"><i class="fab fa-facebook"></i>Sign in with facebook</a>
	</div></c:if><c:if test="${not empty google_signinURL}"><div class="col-sm-6">	
	<a class="btn btn-block btn-social btn-lg btn-google" href="${google_signinURL}"><i class="fab fa-google"></i>Sign in with google</a>
	</div></c:if></div></div>
</div></c:if>

<c:if test="${not empty messages.globalMessage && not empty webaction}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div>
</c:if>


<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
	<c:if test="${empty webaction}"><input type="hidden" name="webaction" value="updateCurrent" /></c:if>
	<c:if test="${not empty webaction}"><input type="hidden" name="webaction" value="${webaction}" /></c:if>
	<input type="hidden" name="user" value="${user.name}" />
</div>

<fieldset>
<legend>${i18n.edit['user.info']}</legend>
<div class="row">
<div class="col-sm-${empty info.userName?'6':'12'}">
	<div class="form-group">
		<label for="login">login</label>
		<input class="form-control" type="text" id="login" name="login" value="${userInfoMap["login"]}" readonly="readonly" /> 
	</div>
	<c:if test="${empty info.userName}">
		<div class="form-group">
			<label for="password">${i18n.view['form.password']}</label>
			<input class="form-control" type="password" id="password" name="password" value="" /> 
		</div>	
		<div class="form-group">
			<label for="password2">${i18n.view['form.password2']}</label>
			<input class="form-control" type="password" id="password2" name="password2" value="" />		 
		</div>
	</div><div class="col-sm-6">
	</c:if>
	<div class="form-group">
		<label for="firstName">firstName</label>
		<input class="form-control" type="text" id="firstName" name="firstName" value="${userInfoMap["firstName"]}" /> 
	</div>
	<div class="form-group">
		<label for="lastName">lastName</label>
		<input class="form-control" type="text" id="lastName" name="lastName" value="${userInfoMap["lastName"]}" /> 
	</div>
	<div class="form-group">
		<label for="email">email</label>
		<input class="form-control" type="text" id="email" name="email" value="${userInfoMap["email"]}" /> 
	</div>	
</div>
</div>
</fieldset>

<div class="btn-group pull-right">
	<button class="btn btn-default" type="submit" name="back">${i18n.edit['global.back']}</button>
	<button class="btn btn-primary pull-right" type="submit" name="ok">${i18n.edit['global.ok']}</button>
</div>

</form>

</div>
</div>

