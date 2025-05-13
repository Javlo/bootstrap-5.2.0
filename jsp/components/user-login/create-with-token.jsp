<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<c:if test="${empty info.userName}">
<div class="widgetbox edit-user">

<div class="local-create">
	<h2>${i18n.view['user.register']}</h2>
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.register" />
			<input type="hidden" name="comp-id" value="${compid}" />
			<input type="hidden" name="createToken" value="${not empty param.initToken?param.initToken:param.createToken}" />
		</div>
		<div class="row">
		<div class="col-sm-12 align-self-end">
			<div class="form-group">
				<label for="emailc">${i18n.view['form.email']}</label>
				<input type="email" class="form-control" id="emailc" name="email" value="${not empty param.email?param.email:newEmail}" readonly="readonly" />
			</div>
		</div><div class="col-sm-4 align-self-end">
			<div class="form-group">
				<label for="pwd1">${i18n.view['form.password']}</label>
				<input type="password" class="form-control" id="pwd1" name="password" />
			</div>
		</div><div class="col-sm-4 align-self-end">
			<div class="form-group">
				<label for="pwd2">${i18n.view['form.password2']}</label>
				<input type="password" class="form-control" id="pwd2" name="passwordbis" />
			</div></div><div class="col-sm-4 align-self-end text-right">
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="${i18n.view['user.register']}" />
				</div>
			</div>				
		</div>
	</form>	
</div>

</div>

</c:if>

<c:if test="${not empty messages.globalMessage && not empty webaction}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div></c:if>

