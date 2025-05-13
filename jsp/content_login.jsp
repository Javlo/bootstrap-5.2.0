<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="${info.language}" xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://ogp.me/ns/fb#">
<head>
<meta charset="utf-8">
<meta name="referrer" content="unsafe-url">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>${info.pageTitle}<c:if test="${info.pageTitle != info.globalTitle}"> - ${info.globalTitle}</c:if></title>
<link href="${info.rootTemplateURL}/scss/bootstrap.css" rel="stylesheet" />
</head>
<body class="login">
	<div class="container-scroller">
		<div class="container-fluid page-body-wrapper full-page-wrapper">
			<div class="content-wrapper d-flex align-items-center auth px-0">
				<div class="row w-100 mx-0">
					<div class="col-md-6 col-lg-4 col-xl-3 mx-auto">
						<div class="auth-form-light text-left py-5 px-4 px-sm-5">
							<div class="brand-logo">
								<img src="${info.logoUrl}" alt="logo">
							</div>

							<c:if test="${messages.globalMessage.needDisplay}">
								<div class="pt-3 pb-1">
									<div class="alert alert-${messages.globalMessage.bootstrapType}" role="alert">
										<span>${messages.globalMessage.messageDisplay}</span>
									</div>
								</div>
							</c:if>

							<h4>${info.globalTitle}</h4>


              <c:if test="${not empty info.userName}">
              <div class="alert alert-warning">${vi18n['user.no-page-access']}</div>
              </c:if>

							<c:if test="${empty param.pwtoken and empty param.resetpwd}">
								<h6 class="fw-light">${vi18n['login.title']}</h6>
								<form class="pt-3" action="${info.currentURL}" method="post">
									<div class="form-group">
										<input type="text" class="form-control form-control-lg" placeholder="${i18n.view['form.login']}" name="j_username" />
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-lg" placeholder="${i18n.view['form.password']}" name="j_password" />
									</div>
									<div class="mt-3">
										<button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">${vi18n['login.action']}</button>
									</div>
									<a class="changelink mt-2 d-block" href="${info.currentURL}?resetpwd=true">${i18n.view['user.reset-password']}</a>
								</form>
							</c:if>
							<c:if test="${not empty param.resetpwd}">
								<h6 class="fw-light">${vi18n['user.message.email-for-reset']}</h6>
								<form name="change_password_email" method="post" action="${info.currentURL}">
									<input type="hidden" name="webaction" value="user.askChangePassword" />
									<div class="form-group">
										<label for="email">${vi18n['form.email']}</label>
										<div class="input">
											<input class="form-control" id="email" type="text" name="email" value="" />
										</div>
									</div>
									<div class="d-flex justify-content-end">
										<a class="btn btn-default me-1" href="${info.currentURL}">${vi18n['global.cancel']}</a>
										<input class="btn btn-primary" type="submit" value="${i18n.view['form.submit']}" />
									</div>
								</form>
							</c:if>
							<c:if test="${not empty param.pwtoken}">
								<form name="change_password" method="post" action="${info.currentURL}">
									<div class="panel panel-default">
										<input type="hidden" name="webaction" value="user.changePasswordWithToken" />
										<input type="hidden" name="token" value="${param.pwtoken}" />
										<div class="panel-body">
											<div class="line form-group">
												<label for="password">${i18n.view['form.new-password']}</label>
												<div class="input">
													<input class="form-control" id="password" type="password" name="password" value="" />
												</div>
											</div>
											<div class="line form-group">
												<label for="password2">${i18n.view['form.new-password2']} :</label>
												<div class="input">
													<input class="form-control" id="password2" type="password" name="password2" value="" />
												</div>
											</div>
											<div class="pull-right">
												<a class="btn btn-default" href="${info.currentURL}">${i18n.view["global.cancel"]}</a>
												<input class="btn btn-primary" type="submit" value="${i18n.view['form.submit']}" />
											</div>
										</div>
									</div>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<!-- content-wrapper ends -->
		</div>
		<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
</body>
</html>
