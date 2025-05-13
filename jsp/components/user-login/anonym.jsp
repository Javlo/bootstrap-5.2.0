<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"%><c:if test="${not empty info.userName}">
<div class="widgetbox edit-user">
<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
    <input type="hidden" name="webaction" value="user-login.logout" />
	<input type="hidden" name="user" value="${user.name}" />
</div>
<button type="submit" name="logout" class="btn btn-default" aria-label="Input group example" aria-describedby="btnGroupAddon"> ${i18n.edit['global.logout']} : ${user.name}</button>
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
				<label for="email">${i18n.view['form.email']}</label>
				<input type="email" class="form-control" value="${user.userInfo.email}" id="email" name="email" />
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
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.login" />
		</div>
		<div class="row">
			<div class="col-md-5 align-items-end">
				<div class="form-group">
					<label for=login>${i18n.view['user.login']}</label>
					<input type="text" class="form-control" value="${param.login}" id="login" name="login"/>					
				</div>
			</div><div class="col-md-5 align-items-end">
				<div class="form-group">
					<label for="pwd">${i18n.view['form.password']}</label>
					<input type="password" class="form-control" id="pwd" name="password" />
				</div>
			</div><div class="col-md-2 align-items-end d-flex">
				<div class="form-group ml-auto">
					<input type="submit" class="btn btn-primary" value="${i18n.view['login.action']}" />
				</div>
			</div>
		</div>
	</form>
</div>

<div class="local-create">
	<h2>${i18n.view['user.register']}</h2>
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user-login.register" />
			<input type="hidden" name="comp-id" value="${compid}" />
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="form-group">
					<label for="login">${i18n.view['user.login']}</label>
					<input type="text" class="form-control" value="${param.login}" id="login" name="login"/>
					<c:if test="${not empty fields['login_message']}"><small class="form-text text-muted">${fields['login_message']}</small></c:if>
				</div>
			</div>
		</div><div class="row"><div class="col-sm-6 align-self-end">
			<div class="form-group">
				<label for="pwd1">${i18n.view['form.password']}</label>
				<input type="password" class="form-control" id="pwd1" name="password" />
			</div>
		</div><div class="col-sm-6 align-self-end">
			<div class="form-group">
				<label for="pwd2">${i18n.view['form.password2']}</label>
				<input type="password" class="form-control" id="pwd2" name="passwordbis" />
			</div></div>
			</div>			
			<c:if test="${not empty fields['optin'] || not empty fields['optout'] || not empty fields['validation_msg']}"><div class="row">
			<div class="col-sm-12"><c:if test="${not empty fields['validation_msg']}">
					<div class="form-check"><label class="form-check-label"><input name="valid" type="checkbox" class="form-check-input" /> <jv:autolink>${fields['validation_msg']}</jv:autolink>*</label></div>
				</c:if>
				 <c:if test="${not empty fields['optin']}"><div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="optin" ${not empty param.optin?' checked="checked"':''} />
						${i18n.view['registration.message.optin']}	
					</label>	
				</div></c:if><c:if test="${not empty fields['optout']}"><div class="form-check">
					<label class="form-check-label">
						<c:if test="${empty param.webaction}">
								<input type="checkbox" class="form-check-input" name="optout" checked="checked" />
						</c:if><c:if test="${not empty param.webaction}">
							<input type="checkbox" class="form-check-input" name="optout" ${not empty param.optout?' checked="checked"':''} />
						</c:if>
						${i18n.view['registration.message.optout']}				
					</label>	
				</div></c:if>			
			</div>
		</div></c:if>
			<div class="text-right">
				<div class="form-group">
					<input type="submit" class="btn btn-default" value="${i18n.view['user.register']}" />				
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