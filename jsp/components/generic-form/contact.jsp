<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${not empty msg}">	<div class="message">
		<div class="${msg.typeLabel}"><p>${msg.message}</p></div>
	</div>	</c:if>	<c:if test="${empty valid}">
<form method="post" action="${info.currentURL}">
<input type="hidden" name="webaction" value="gform.submit" />
<input type="hidden" name="comp_id" value="${comp.id}" />
<div class="row">
<div class="col-md-6">
<div class="form-group">
	<label for="name">${ci18n['field.name']}</label>
	<input class="form-control" id="name" name="name" value="${param.name}" />
</div>
</div><div class="col-md-6">
<div class="form-group">
	<label for="firstname">${ci18n['field.firstname']}</label>
	<input class="form-control" id="firstname" name="firstname" value="${param.firstname}" />
</div>
</div>
</div>
<div class="form-group${not empty errorFiles['Email']?' error':''}">
	<label for="email">${ci18n['field.email']}*</label>
	<input type="email" class="form-control" id="email" name="Email" value="${param.Email}" />
</div>
<div class="form-group">
	<label for="company">${ci18n['field.company']}</label>
	<input class="form-control" id="company" name="company" value="${param.company}" />
</div>
<div class="form-group">
	<label for="message">${ci18n['field.message']}</label>
	<textarea class="form-control" id="message" name="message">${param.message}</textarea>
</div>

<fieldset>				
	<legend>${ci18n['field.captcha']}*</legend>			
	<div class="captcha ${not empty param.webaction && empty param.captcha || not empty error_captcha?'error':''}">
	<label for="captcha"><img src="${info.captchaURL}" alt="captcha" /></label>
		<input type="text" id="captcha" name="captcha" value="" />
	</div>
</fieldset>	

<div class="d-flex justify-content-end mb-3">
	<button type="submit" class="btn btn-primary">${vi18n['form.submit']}</button>
</div>

</form>
</c:if>