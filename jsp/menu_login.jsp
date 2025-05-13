<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@
taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="modal-dialog login-menu modal-sm">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">
				<c:if test="${empty info.userName}">${i18n.view['login.action']}</c:if>
				<c:if test="${not empty info.userName}"><i class="bi bi-person-fill"></i> <span class="dt-user-name">${info.userName}</span></c:if>
			</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
		<div class="modal-body">
			<div class="login">
				<div id="${param.prefixId}login-message-container"></div>
				<div class="d-none-logged">

					<c:if test="${not empty google_signinURL || not empty facebook_signinURL}">
						<div class="row">
							<c:if test="${not empty google_signinURL}">
								<div class="col-md-${not empty facebook_signinURL?'6':'12'}">
									<a target="_blank" href="${google_signinURLPopup}" class="btn btn-outline-primary btn-login"> <img src="${info.rootTemplateURL}/img/login/google.svg" /> ${vi18n['login.social.google']}
									</a>
								</div>
							</c:if>
							<c:if test="${not empty facebook_signinURL}">
								<div class="col-md-6">
									<a target="_blank" href="${facebook_signinURLPopup}" class="btn btn-outline-primary btn-login"> <img src="${info.rootTemplateURL}/img/login/facebook.svg" /> ${vi18n['login.social.facebook']}
									</a>
								</div>
							</c:if>
						</div>
					</c:if>

					<jsp:include page="login_info.jsp" />

					<form name="login" method="post" action="${info.currentURL}" ${param.noAjaxMenuLogin?'':'onsubmit="formLogin${param.prefixId}(this); return false;"'}>
						<div class="form-group">
							<label class="sr-only" for="menu-username">${i18n.view['form.login']}</label>
							<div class="input">
								<input class="form-control" id="${param.prefixId}menu-username" type="text" name="j_username" value="" placeholder="${i18n.view['form.login']}" />
							</div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="menu-password">${i18n.view['form.password']}</label>
							<div class="input">
								<input class="form-control" id="${param.prefixId}menu-password" type="password" name="j_password" value="" placeholder="${i18n.view['form.password']}" />
							</div>
						</div>
						<div class="form-group form-check">
							<input type="checkbox" class="form-check-input" id="${param.prefixId}menu-autologin" name="autologin">
							<label class="form-check-label" for="menu-autologin">${i18n.view['login.auto']}</label>
						</div>
						<div class="action">
							<a class="forget" data-bs-toggle="collapse" href="#${param.prefixId}forget-password-email" role="button" aria-expanded="false" aria-controls="${param.prefixId}forget-password-email"> ${i18n.view['user.message.forget-password']} </a>
							<input type="submit" class="btn btn-primary" value="${i18n.view['form.submit']}" />
						</div>
					</form>
					<div class="collapse forget-password-email" id="${param.prefixId}forget-password-email">
						<form name="login" method="post" action="${info.currentURL}" id="${param.prefixId}forget-password-email-form">
							<div class="form-group">
								<input name="webaction" value="user.askChangePassword" type="hidden" />
								<label class="sr-only" for="menu-forget-email">${i18n.view['form.youremail']}</label>
								<div class="input">
									<input class="form-control" id="${param.prefixId}menu-forget-email" type="email" name="email" value="" placeholder="${i18n.view['form.youremail']}" />
								</div>
							</div>
							<div class="action">
								<input type="submit" class="btn btn-primary" value="${i18n.view['global.send']}" />
							</div>
						</form>
					</div>
				</div>
				<div class="d-logged">
					<c:url var="logoutUrl" value="${info.currentURL}" context="/">
						<c:param name="webaction" value="user.logout" />
					</c:url>
					<a href="${logoutUrl}" class="btn btn-primary btn-block">${i18n.view['form.logout']}</a>
				</div>
			</div>
		</div>
		<c:set var="registerPage" value="${info.pageByName['register']}" />
		<c:if test="${not empty registerPage}">
			<div class="d-none-logged">
				<c:if test="${!globalContext.specialConfig.createAccountWithToken}">
					<a class="register card-footer" href="${registerPage.url}">${i18n.view['form.create-account']}</a>
				</c:if>
			</div>
			<div class="d-logged">
				<c:if test="${!contentContext.currentUser.editor}">
					<a class="register card-footer" href="${registerPage.url}">${i18n.view['form.update-account']}</a>
				</c:if>
			</div>
		</c:if>
		<c:if test="${contentContext.currentUser.editor}">
			<c:if test="${contentContext.asViewMode}">
				<div class="card-footer">
					<a class="register btn btn-warning" href="${info.currentPreviewURL}">EDIT</a>
				</div>
			</c:if>
			<c:if test="${!contentContext.asViewMode}">
				<div class="card-footer">
					<a class="register btn btn-warning" href="${info.currentViewURL}">VIEW</a>
				</div>
			</c:if>
		</c:if>
		<c:if test="${not empty shadowUser}">
			<div class="card-footer">
				<form action="${info.currentPreviewURL}" method="post">
					<button type="submit" class="register btn btn-warning btn-block" name="webaction" value="user.restoreshadowaccess">
						<i class="fas fa-undo"></i> ${shadowUser.login}
					</button>
				</form>
			</div>
		</c:if>
	</div>
</div>

<script>
<c:if test="${empty info.userName}">
formLogin${param.prefixId}(null);
setInterval(function(){ 
	formLogin${param.prefixId}(null);	    
}, 3000);
</c:if>
function formLogin${param.prefixId}(form) {
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	    	try {
               var data = JSON.parse(xhttp.responseText);
               //console.log(data);
			   if (data["logged"]) {
					setDomData("user-name", data["login"]);
					setDomData("firstname", data["firstname"]);
					setDomData("lastname", data["lastname"]);
					document.getElementsByTagName("body")[0].classList.remove("user-not-logged-in");
					document.getElementsByTagName("body")[0].classList.add("user-logged-in");
					document.getElementById("${param.prefixId}login-message-container").innerHTML='<div class="alert alert-success" role="alert">'+data["message"]+'</div>';
			   } else {
				   if (data["error"] != null) { 
				   	document.getElementById("${param.prefixId}login-message-container").innerHTML='<div class="alert alert-danger" role="alert">'+data["error"]+'</div>';
				   }
			   }
           } catch(err) {
               console.log(err.message + " in " + xhttp.responseText);
               return;
           }
	    }
	};
	if (form != null)  {
		var login = form.querySelectorAll("input[name='j_username']")[0].value;
		var password = form.querySelectorAll("input[name='j_password']")[0].value;
		xhttp.open("GET", "${info.ajaxLoginUrl}?login="+login+"&password="+password, true);
	} else {
		xhttp.open("GET", "${info.ajaxLoginUrl}", true);
	}
	xhttp.send();
}
</script>