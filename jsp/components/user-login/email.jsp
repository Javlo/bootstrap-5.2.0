<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>

<c:if test="${not empty param.pwtoken}">
<jsp:include page="changepwd.jsp" />
</c:if>
<c:if test="${empty param.pwtoken}">

<div class="widgetbox edit-user">

<c:if test="${empty info.userName}">
<div class="local-create">
	<h2>${i18n.view['user.register']}</h2>
	<form id="local-user" action="${info.currentURL}" method="post">
		<div>
			<input type="hidden" name="webaction" value="user.createuserwidthemail" />
			<input type="hidden" name="comp-id" value="${compid}" />
		</div>
		<div class="row">
		<div class="col-md-8 align-self-end">
			<div class="form-group">
				<label for="emailc">${i18n.view['form.email']}</label>
				<input type="email" class="form-control" id="emailc" name="email" value="${newEmail}" />
			</div>
		</div><div class="col-md-4 align-self-end text-right">
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="${i18n.view['user.register']}" />
				</div>
			</div>
		</div>
	</form>	
</div>
</c:if>
<c:if test="${not empty info.userName}">
<form id="local-user-data" action="${info.currentURL}" method="post" enctype="multipart/form-data">
		<div>
			<input type="hidden" name="webaction" value="user-login.update" />
			<input type="hidden" name="login" value="${user.login}" />
			<input type="hidden" name=comp-id value="${compid}" />
		</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="email">${i18n.view['form.email']}</label>
					<input type="email" class="form-control" value="${user.userInfo.email}" id="email" name="email" readonly="readonly"/>
				</div>
			</div><div class="col-md-6">
				<div class="form-group">
					<label for="mobile">${i18n.view['form.address.phone']}</label>
					<input type="text" class="form-control" value="${user.userInfo.mobile}" id="mobile" name="mobile" />
				</div>
		</div>
		</div><div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="firstname">${i18n.view['form.firstName']}</label>
					<input type="text" class="form-control" value="${user.userInfo.firstName}" id="firstname" name="firstName" />
				</div>
			</div><div class="col-md-6">
				<div class="form-group">
					<label for="lastname">${i18n.view['form.lastName']}</label>
					<input type="text" class="form-control" value="${user.userInfo.lastName}" id="lastname" name="lastName" />
				</div>
			</div>
		</div>
		<c:if test="${param.company}">
			<div class="row">
			<div class="col-sm-6">
				<div class="form-group">
					<label for="organization">${i18n.view['form.organization']}</label>
					<input type="text" class="form-control" value="${user.userInfo.organization}" id="organization" name="organization" />
				</div>
			</div><div class="col-sm-6">
				<div class="form-group">
					<label for="vat">${i18n.view['form.vat']}</label>
					<input type="text" class="form-control" value="${user.userInfo.vat}" id="vat" name="vat" />
				</div>
			</div>
			</div>	
		</c:if>
		<c:if test="${not empty fields['optin'] || not empty fields['optout']}"><div class="row">
			<div class="col-md-12">
				 <c:if test="${not empty fields['optin']}"><div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="optin" ${not empty user.rolesMap['optin']?' checked="checked"':''} />
						${i18n.view['registration.message.optin']} ${info.globalTitle}
					</label>	
				</div></c:if><c:if test="${not empty fields['optout']}"><div class="form-check">
					<label class="form-check-label">
						<input type="checkbox" class="form-check-input" name="optout" ${not empty user.rolesMap['optout']?' checked="checked"':''} />
						${i18n.view['registration.message.optout']}				
					</label>	
				</div></c:if>					
			</div>
		</div></c:if>
		
		<c:if test="${param.changeAvatar}">
			<jsp:include page="avatar.jsp" />
		</c:if>
		
		<div class="form-group text-right">
			<input type="submit" class="btn btn-primary" value="${i18n.view['global.update']}" />
		</div>		
	</form>
</c:if>
</div>

<c:if test="${not empty messages.globalMessage && not empty webaction}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div></c:if>

</c:if>