<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${empty webaction}">
<div class="widgetbox edit-user">
<h3><span>${i18n.edit['user.change-password']}</span></h3>
<div class="content">
<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">
<div>
	<input class="form-control" type="hidden" name="webaction" value="changePassword" />
	<input class="form-control" type="hidden" name="user" value="${user.name}" />
</div>
<div class="row">
<div class="col-sm-6">
<div class="form-group">
	<label for="password">${i18n.edit['user.current-password']}</label>
	<input class="form-control" type="password" id="password" name="password" value="" /> 
</div>
</div><div class="col-sm-6">
<div class="form-group">
	<label for="newpassword">${i18n.edit['user.new-password']}</label>
	<input class="form-control" type="password" id="newpassword" name="newpassword" value="" />	 
</div>
</div>
</div>
<div class="action text-right"><input class="btn btn-secondary" type="submit" name="ok" value="${i18n.edit['global.ok']}" /></div>
</form>
</div>
</div>
</c:if>

<div class="widgetbox edit-user">
<c:if test="${empty webaction}"><h3><span>${i18n.edit['user.title.edit']} : ${user.name}</span></h3></c:if>
<div class="content">
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
<div class="col-sm-6">
	<div class="form-group">
		<label for="login">login</label>
		<input class="form-control" type="text" id="login" name="login" value="${userInfoMap['login']}" /> 
	</div>
	<c:if test="${not empty webaction}">
		<div class="form-group">
			<label for="password">${i18n.view['form.password']}</label>
			<input class="form-control" type="password" id="password" name="password" value="" /> 
		</div>	
		<div class="form-group">
			<label for="password2">${i18n.view['form.password2']}</label>
			<input class="form-control" type="password" id="password2" name="password2" value="" />		 
		</div>
	</c:if>
	<div class="form-group">
		<label for="firstName">firstName</label>
		<input class="form-control" type="text" id="firstName" name="firstName" value="${userInfoMap['firstName']}" /> 
	</div>
	<div class="form-group">
		<label for="lastName">lastName</label>
		<input class="form-control" type="text" id="lastName" name="lastName" value="${userInfoMap['lastName']}" /> 
	</div>
	<div class="form-group">
		<label for="email">email</label>
		<input class="form-control" type="text" id="email" name="email" value="${userInfoMap['email']}" /> 
	</div>
	<div class="form-group">
		<label for="organization">organization</label>
		<c:if test="${empty list.organization}">
		<input class="form-control" type="text" id="organization" name="organization" value="${userInfoMap['organization']}" />
		</c:if> 
		<c:if test="${not empty list.organization}">
		 	<select id="organization" name="organization">
		 		<option></option>
		 		<c:forEach var="organization" items="${list.organization}">
		 			<option value="${organization.key}"${userInfoMap['organization'] == organization.key?' selected="selected"':''}>${organization.value}</option>
		 		</c:forEach>		 		
		 	</select>
		 </c:if> 
	</div>
	<div class="form-group">
		<label for="phone">phone</label>
		<input class="form-control" type="text" id="phone" name="phone" value="${userInfoMap['phone']}" /> 
	</div>
	<div class="form-group">
		<label for="mobile">mobile</label>
		<input class="form-control" type="text" id="mobile" name="mobile" value="${userInfoMap['mobile']}" /> 
	</div>
</div>
<div class="col-sm-6">
	<div class="form-group">
		<label for="address">address</label>
		<input class="form-control" type="text" id="address" name="address" value="${userInfoMap['address']}" /> 
	</div>
	<div class="form-group">
		<label for="postCode">postCode</label>
		<input class="form-control" type="text" id="postCode" name="postCode" value="${userInfoMap['postCode']}" /> 
	</div>
	<div class="form-group">
		<label for="city">city</label>
		<input class="form-control" type="text" id="city" name="city" value="${userInfoMap['city']}" /> 
	</div>
	<div class="form-group">
		<label for="country">country</label>
		<c:if test="${empty list.countries}">
			<input class="form-control" type="text" id="country" name="country" value="${userInfoMap['country']}" />
		</c:if>
		 <c:if test="${not empty list.countries}">
		 	<select id="country" name="country" class="form-control">
		 		<option></option>
		 		<c:forEach var="country" items="${list.countries}">
		 			<option value="${country.key}"${userInfoMap['country'] == country.key?' selected="selected"':''}>${country.value}</option>
		 		</c:forEach>		 		
		 	</select>
		 </c:if>
	</div>
	<div class="form-group">
		<label for="preferredLanguageRaw">preferred Language</label>
		<input class="form-control" type="text" id="preferredLanguageRaw" name="preferredLanguageRaw" value="${userInfoMap['preferredLanguageRaw']}" /> 
	</div>	
	<div class="form-group">
		<label for="info">info</label>
		<textarea id="info" name="info" class="form-control">${userInfoMap['info']}</textarea>
	</div>
</div>
</div>
<div class="form-group">
		<label for="function">area of specialisation</label>
		<c:if test="${empty list.functions}">
		<input class="form-control" type="text" id="function" name="function" value="${userInfoMap['function']}" />
		</c:if>
		 <c:if test="${not empty list.functions}">		 	
	 		<c:forEach var="function" items="${list.functions}" varStatus="status">
	 		<div class="form-check form-check-inline"> <label class="form-check-label">
	 			<input class="form-check-input" type="checkbox" name="function" id="function-${status.index}" value="${function.key}" ${not empty functions[function.key]?' checked="checked"':''}/> ${function.value}
			</label></div>
	 		</c:forEach>
		 </c:if> 
	</div>
</fieldset>

<div class="action text-right">
	<input class="btn btn-secondary" type="submit" name="back" value="${i18n.edit['global.back']}" />
	<input class="btn btn-primary" type="submit" name="ok" value="${i18n.edit['global.ok']}" />
</div>

</form>

</div>
</div>

