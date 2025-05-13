<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%><%@taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"%><!-- STEP 2 -->
<c:if test="${empty contentContext.currentUser}">
	<jsp:include page="${info.rootTemplateFolder}/jsp/login.jsp" />
	<c:if test="${not empty info.pageByName.register}">
		<div class="registration-link">
			<a href="${info.pageByName.register.url}">${i18n.view["user.register"]}</a>
		</div>
	</c:if>
</c:if>

<form id="billing-info-form" action="${info.currentURL}" method="post" role="form">
	<fieldset>
		<legend>${i18n.view["ecom.delivery-address"]}</legend>
		<c:set var="user" value="${contentContext.currentUser}" />
		<input type="hidden" name="webaction" value="basket.registration" />
		<div class="user">${user.name}</div>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="firstName">${i18n.view["field.firstname"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="firstName" name="firstName" value="${basket.firstName}" />
				</div>
				<div class="form-group">
					<label for="lastName">${i18n.view["field.lastname"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="lastName" name="lastName" value="${basket.lastName}" />
				</div>
				<c:if test="${comp.style == 'company'}">
					<div class="form-group">
						<label for="organization">${i18n.view['form.company']}</label>
						<input class="form-control" type="text" id="organization" name="organization" value="${basket.organization}" />
					</div>
					<div class="form-group">
						<label for="vat">${i18n.view['form.vat']}</label>
						<input class="form-control" type="text" id="vat" name="vat" value="${basket.VATNumber}" />
					</div>
				</c:if>
				<div class="form-group">
					<label for="email">${i18n.view["field.email"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="email" name="email" value="${basket.contactEmail}" />
				</div>
				<c:if test="${comp.style == 'company'}">
			</div>
			<div class="col-md-6">
				</c:if>
				<div class="form-group">
					<label for="phone">${i18n.view["form.address.phone"]}</label>
					<input class="form-control" type="text" id="phone" name="phone" value="${basket.contactPhone}" />
				</div>
				<c:if test="${comp.style != 'company'}">
			</div>
			<div class="col-md-6">
				</c:if>
				<div class="form-group">
					<label for="country">${i18n.view["form.address.country"]}<span class="compulsory-star">*</span></label>
					<c:if test="${empty list.countries}">
						<input class="form-control" type="text" id="country" name="country" value="${basket.country}" />
					</c:if>
					<c:if test="${not empty list.countries}">
						<select class="form-control" id="country" name="country">
							<option></option>
							<c:forEach var="country" items="${list.countries}">
								<option value="${country.key}" ${basket.country == country.key?' selected="selected"':''}>${country.value}</option>
							</c:forEach>
						</select>
					</c:if>
				</div>
				<div class="form-group">
					<label for="address">${i18n.view["form.address.street"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="address" name="address" value="${basket.address}" />
				</div>
				<div class="form-group">
					<label for="zip">${i18n.view["form.address.zip"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="zip" name="zip" value="${basket.zip}" />
				</div>
				<div class="form-group">
					<label for="city">${i18n.view["form.address.city"]}<span class="compulsory-star">*</span></label>
					<input class="form-control" type="text" id="city" name="city" value="${basket.city}" />
				</div>
			</div>
		</div>
		<div class="action mb-3 d-flex justify-content-end">
			<input class="btn btn-secondary" type="submit" name="back" value="${i18n.view['global.back']}" />
			<input class="btn btn-primary" type="submit" value="${i18n.view['global.next']}" />
		</div>

	</fieldset>
</form>
