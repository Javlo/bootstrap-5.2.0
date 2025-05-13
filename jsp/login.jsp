<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="login">
	<form name="login" method="post">
	<fieldset>
	<legend>${i18n.view['user.login']}</legend>
	<div class="row">
	<div class="col-md-6">
	<div class="form-group">
		<label for="j_username">${i18n.view['form.login']} : </label>
	    <div class="input"><input class="form-control" id="j_username" type="text" name="j_username" value="" /></div>
	</div>
	</div><div class="col-md-6">
	<div class="form-group">
		<label for="password">${i18n.view['form.password']} : </label>
		<div class="input"><input class="form-control" id="password" type="password" name="j_password" value="" /></div>
	</div>
	</div>
	</div>
	<div class="action text-right">
	<input class="btn btn-primary" type="submit" value="${i18n.view['form.submit']}" />
	</div>
	</fieldset>
	</form>
</div>
