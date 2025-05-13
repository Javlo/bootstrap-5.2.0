<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${not empty messages.globalMessage}">
<div class="message ${messages.globalMessage.typeLabel}">
	<span>${messages.globalMessage.message}</span>
</div>
</c:if>

<c:set var="basketPage" value="${info.pageByName.basket}" />
<c:if test="${not empty basketPage && empty param.basketLink}"><a class="back-basket" href="${basketPage.url}">${i18n.view['ecom.back-basket']}</a></c:if>


<c:if test="${empty param.pwkey}">

<c:if test="${not empty user}">
<form id="user-logout" class="standard-form" action="${info.currentURL}" method="post">
<div class="row">
	<div class="col-md-6">
		<c:set var="displayName" value="${user.userInfo.firstName} ${user.userInfo.lastName}" />
		<h3>${i18n.view['user.welcome']}, <span>${empty user.userInfo.firstName && empty user.userInfo.lastName?user.name:displayName}</span></h3>		
	</div>
	<div class="col-md-6">
	<c:if test="${!user.userInfo.externalLoginUser}">	
		<input type="hidden" name="${info.staticData.compId}" value="${comp.id}" />
		<input type="hidden" name="webaction" value="user-registration.logout" />
		<input class="btn btn-secondary" type="submit" name="logout" value="${i18n.view['form.logout']}" />	
	</c:if>
	<c:if test="${user.userInfo.externalLoginUser}">
		<a class="facebook-app" href="https://www.facebook.com/bookmarks/apps">facebook</a>
	</c:if>
	</div>
</div>
</form>
</c:if>

<c:if test="${empty user}">
<jsp:include page="fb_login.jsp" />
<jsp:include page="${info.rootTemplateFolder}/jsp/login.jsp" />
<c:if test="${empty user}">
<a class="text-right" id="forget-password-id" href="#" onclick="javascript:hideshow(document.getElementById('forget-password-id'));javascript:hideshow(document.getElementById('reset-password-with-email'));return false;">${i18n.view['user.message.forget-password']}</a>
<div id="reset-password-with-email" class="reset-password">
	<form name="reset-password" method="post" class="form-inline">
	<fieldset>
	<legend>${i18n.view['user.reset-password']}</legend>
	<input type="hidden" name="webaction" value="user-registration.resetPasswordWithEmail" />	
	<div class="form-group">	    	    
	    <div class="input-group mr-sm-2">
	    <div class="input-group-prepend">
	      <div class="input-group-text">@</div>
	    </div>
	    <input id="reset-email" type="text" name="email" value="" class="form-control" placeholder="${i18n.view['form.email']}"/>	    
  	</div>
  	<input class="btn btn-secondary" type="submit" value="${i18n.view['form.submit']}" />
	</div>
	</fieldset>
	</form>
</div>
<script type="text/javascript">
function hideshow(which){
if (!document.getElementById)
return
if (which.style.display=="block")
which.style.display="none"
else
which.style.display="block"
}
document.getElementById('reset-password-with-email').style.display="none";
document.getElementById('forget-password-id').style.display="block";
</script>
</c:if>

</c:if>

<div class="widgetbox edit-user">
<c:if test="${empty noform}">
<form id="form-edit-user" class="standard-form" action="${info.currentURL}" method="post">

<div>
	<c:if test="${empty user}"><input type="hidden" name="webaction" value="user-registration.register" /></c:if>	
	<c:if test="${not empty user}"><input type="hidden" name="webaction" value="user-registration.update" /></c:if>
	<input type="hidden" name="user" value="${user.name}" />
	<input type="hidden" name="${info.staticData.compId}" value="${comp.id}" />
</div>

<fieldset>
<c:if test="${not empty user}">
<legend>${i18n.view['user.update']}</legend>
</c:if>
<c:if test="${empty user}">
<legend>${i18n.view['user.register']}</legend>
</c:if>
<div class="row">
<div class="col-md-6">
	<div class="form-group">
		<label for="email-login">${i18n.view['form.email']}</label>
		<input class="form-control" type="text" id="email-login" name="email-login" value="${userInfoMap["email"]}" /> 
	</div>
	<c:if test="${empty user}">
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
		<label for="firstName">${i18n.view['form.firstName']}</label>
		<input class="form-control" type="text" id="firstName" name="firstName" value="${userInfoMap["firstName"]}" /> 
	</div>
	<div class="form-group">
		<label for="lastName">${i18n.view['form.lastName']}</label>
		<input class="form-control" type="text" id="lastName" name="lastName" value="${userInfoMap["lastName"]}" /> 
	</div>
	<div class="form-group">
		<label for="mobile">${i18n.view['form.adress.phone']}</label>
		<input class="form-control" type="text" id="mobile" name="mobile" value="${userInfoMap["mobile"]}" /> 
	</div>
	<c:if test="${not empty param.company}">
	<c:if test="${not empty vi18n['form.company.message']}"><p class="message">${vi18n['form.company.message']}</p></c:if>
	<div class="form-group">
		<label for="organization">${i18n.view['form.company']}</label>
		<input class="form-control" type="text" id="organization" name="organization" value="${userInfoMap["organization"]}" /> 
	</div>
	<div class="form-group">
		<label for="vat">${i18n.view['form.vat']}</label>
		<input class="form-control" type="text" id="vat" name="vat" value="${userInfoMap["vat"]}" /> 
	</div></c:if>
</div>
<div class="col-md-6">
	<div class="form-group">
		<label for="address">${i18n.view['form.adress']}</label>
		<textarea class="form-control" id="address" name="address">${userInfoMap["address"]}</textarea> 
	</div>
	<div class="form-group">
		<label for="postCode">${i18n.view['form.adress.zip']}</label>
		<input class="form-control" type="text" id="postCode" name="postCode" value="${userInfoMap["postCode"]}" /> 
	</div>
	<div class="form-group">
		<label for="city">${i18n.view['form.adress.city']}</label>
		<input class="form-control" type="text" id="city" name="city" value="${userInfoMap["city"]}" /> 
	</div>
	<div class="form-group">
		<label for="country">${i18n.view['form.adress.country']}</label>
		<c:if test="${empty list.countries}">
			<input class="form-control" type="text" id="country" name="country" value="${userInfoMap["country"]}" />
		</c:if>
		 <c:if test="${not empty list.countries}">
		 	<select class="form-control" id="country" name="country">
		 		<option></option>
		 		<c:forEach var="country" items="${list.countries}">
		 			<option value="${country.key}"${userInfoMap["country"] == country.key?' selected="selected"':''}>${country.value}</option>
		 		</c:forEach>		 		
		 	</select>
		 </c:if>
	</div>
</div>
</div>
<div class="form-group">
	<label for="info">info</label>
	<textarea class="form-control" id="info" name="info">${userInfoMap["info"]}</textarea>
</div>
</fieldset>

<div class="text-right">
	<input class="btn btn-secondary"  type="submit" name="back" value="${i18n.edit['global.back']}" />
	<input class="btn btn-primary" type="submit" name="ok" value="${i18n.edit['global.ok']}" />
</div>
</form>
</c:if>
</c:if>

<c:if test="${not empty user || not empty param.pwkey}">

<div class="edit-user">
<h3><span>${i18n.view['user.change-password']}</span></h3>
<div class="content">
<form id="form-edit-user" action="${info.currentURL}" method="post">
<div>
	<input type="hidden" name="webaction" value="user-registration.changePassword" />
	<input type="hidden" name="user" value="${user.name}" />
</div>

<c:if test="${empty param.pwkey}">
<div class="row">
<div class="col-md-6">
<div class="form-group">
	<label for="password">${i18n.view['user.current-password']}</label>
	<input class="form-control" type="password" id="password" name="password" value="" /> 
</div>
</div>
</div>
</c:if>
<c:if test="${not empty param.pwkey}">
	<input type="hidden" id="pwkey" name="pwkey" value="${param.pwkey}" />
</c:if>
<div class="row">
<div class="col-md-6">
<div class="form-group">
	<label for="newpassword1">${i18n.view['user.new-password']}</label>
	<input class="form-control" type="password" id="newpassword1" name="newpassword1" value="" />
</div>
</div><div class="col-md-6">
<div class="form-group">
	<label for="newpassword2">${i18n.view['user.new-password-confirm']}</label>
	<input class="form-control" type="password" id="newpassword2" name="newpassword2" value="" />
</div>
<div class="text-right">		
	<input class="btn btn-secondary" type="submit" name="ok" value="${i18n.view['global.ok']}" />	
</div> 
</div>
</div>
</form>
</div>
</div>
</c:if>

</div>


