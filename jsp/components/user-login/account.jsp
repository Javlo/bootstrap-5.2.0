<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${not empty info.userName}">
<div class="widgetbox edit-user">


<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
    <input type="hidden" name="webaction" value="user-login.logout" />
	<input type="hidden" name="user" value="${user.name}" />
</div>

<button type="submit" name="logout" class="btn btn-secondary" aria-label="Input group example" aria-describedby="btnGroupAddon"> ${i18n.edit['global.logout']} : ${user.name}</button>

</form>
<form id="local-user-data" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.update" />
			<input type="hidden" name="login" value="${user.login}" />
			<input type="hidden" name=comp-id value="${compid}" />
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="firstname">${i18n.view['form.firstName']}</label>
					<input type="text" class="form-control" value="${user.userInfo.firstName}" id="firstname" name="firstName" />
				</div>
			</div><div class="col-sm-6">
				<div class="form-group">
					<label for="lastname">${i18n.view['form.lastName']}</label>
					<input type="text" class="form-control" value="${user.userInfo.lastName}" id="lastname" name="lastName" />
				</div>
			</div>
		</div><div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="email">${i18n.view['form.email']}</label>
					<input type="email" class="form-control" value="${user.userInfo.email}" id="email" name="email" />
				</div>
			</div><div class="col-sm-6">
				<div class="form-group">
					<label for="mobile">${i18n.view['form.address.phone']}</label>
					<input type="text" class="form-control" value="${user.userInfo.mobile}" id="mobile" name="mobile" />
				</div>
			</div>
		</div><div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="address">${i18n.view['form.address']}</label>
					<input type="text" class="form-control" value="${user.userInfo.address}" id="address" name="address" />
				</div>
			</div><div class="col-sm-6">
				<div class="form-group">
					<label for="city">${i18n.view['form.address.city']}</label>
					<input type="text" class="form-control" value="${user.userInfo.city}" id="city" name="city" />
				</div>
			</div>
		</div><div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="country">${i18n.view['form.address.country']}</label>
					<input type="text" class="form-control" value="${user.userInfo.country}" id="country" name="country" />
				</div>
			</div><div class="col-sm-6">
				<div class="form-group">
					<label for="postCode">${i18n.view['form.address.zip']}</label>
					<input type="text" class="form-control" value="${user.userInfo.postCode}" id="postCode" name="postCode" />
				</div>
			</div>
		</div><c:if test="${not empty fields['optin'] || not empty fields['optout']}"><div class="row">
			<div class="col-sm-12">
				 <c:if test="${not empty fields['optin']}"><div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="optin" ${not empty user.rolesMap[fields['optin']]?' checked="checked"':''} />
						${i18n.view['registration.message.optin']} ${info.globalTitle}
					</label>	
				</div></c:if><c:if test="${not empty fields['optout']}"><div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="optout" ${not empty user.rolesMap[fields['optout']]?' checked="checked"':''} />
						${i18n.view['registration.message.optout']}				
					</label>	
				</div></c:if>					
			</div>
		</div></c:if>
		<div class="form-group text-right">
			<input type="submit" class="btn btn-primary" value="${i18n.view['global.update']}" />				
		</div>		
	</form>
</div>
</c:if>

<c:if test="${empty info.userName}">
<div class="widgetbox edit-user">

<div class="local-login">
	<h2>${i18n.view['user.login']}</h2>
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.login" />
		</div>
		<div class="row">
			<div class="col-sm-5 align-self-end">
				<div class="form-group">
					<label for="email">${i18n.view['form.email']}</label>
					<input type="email" class="form-control" value="${param.email}" id="email" name="email"/>
				</div>
			</div><div class="col-sm-4 align-self-end">
				<div class="form-group">
					<label for="pwd">${i18n.view['form.password']}</label>
					<input type="password" class="form-control" id="pwd" name="password" />
				</div>
			</div><div class="col-sm-3 align-self-end text-right">
				<div class="form-group">
				<input type="submit" class="btn btn-primary" value="${i18n.view['login.action']}" />
				</div>
			</div>
		</div>
	</form>
</div>

<div class="social-box">
	<div class="form-group"><div class="row"><c:if test="${not empty facebook_signinURL}"><div class="col-sm-${not empty google_signinURL?'6':'12'}">
	<a class="btn btn-block btn-social btn-lg btn-facebook" href="${facebook_signinURL}"><i class="fab fa-facebook"></i>Login with facebook</a>
	</div></c:if><c:if test="${not empty google_signinURL}"><div class="col-sm-${not empty facebook_signinURL?'6':'12'}">	
	<a class="btn btn-block btn-social btn-lg btn-google" href="${google_signinURL}"><i class="fab fa-google"></i>Login with google</a>
	</div></c:if></div></div>
</div></div>

<hr />

<div class="local-create">
	<h2>${i18n.view['user.register']}</h2>
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.register" />
			<input type="hidden" name="comp-id" value="${compid}" />
		</div>
		<div class="row">
		<div class="col-sm-3 align-self-end">
			<div class="form-group">
				<label for="emailc">${i18n.view['form.email']}</label>
				<input type="email" class="form-control" value="${param.email}" id="emailc" name="email" />
			</div>
		</div><div class="col-sm-3 align-self-end">
			<div class="form-group">
				<label for="pwd1">${i18n.view['form.password']}</label>
				<input type="password" class="form-control" id="pwd1" name="password" />
			</div>
		</div><div class="col-sm-3 align-self-end">
			<div class="form-group">
				<label for="pwd2">${i18n.view['form.password2']}</label>
				<input type="password" class="form-control" id="pwd2" name="passwordbis" />
			</div></div><div class="col-sm-3 align-self-end text-right">
				<div class="form-group">
					<input type="submit" class="btn btn-secondary" value="${i18n.view['user.register']}" />				
				</div>
			</div>
		</div>
	</form>	
</div>


</c:if>

<c:if test="${not empty messages.globalMessage && not empty webaction}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div></c:if>
