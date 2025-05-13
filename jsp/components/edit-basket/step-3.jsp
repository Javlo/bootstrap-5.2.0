<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt"
%><!-- STEP 3 -->
<hr />
<form method="post" action="${info.currentURL}" role="form">
	<fieldset>
		<legend>${i18n.view["ecom.delivery-address"]}</legend>
		<div class="row">
			<div class="col-md-6">
				<div class="form-group">
					<label for="firstName">${i18n.view["field.firstname"]}</label> <span class="value">${basket.firstName}</span>
				</div>
				<div class="form-group">
					<label for="lastName">${i18n.view["field.lastname"]}</label> <span class="value">${basket.lastName}</span>
				</div>
				<div class="form-group">
					<c:if test="${comp.style == 'company'}">
						<div class="line">
							<label for="organization">${i18n.view['form.company']}</label> <span class="value">${basket.organization}</span>
						</div>
						<div class="form-group">
							<label for="vat">${i18n.view['form.vat']}</label> <span class="value">${basket.VATNumber}</span>
						</div>
					</c:if>
					<label for="email">${i18n.view["field.email"]}</label> <span class="value">${basket.contactEmail}</span>
				</div>
				<c:if test="${comp.style == 'company'}">
			</div>
			<div class="col-md-6">
				</c:if>
				<div class="form-group">
					<label for="phone">${i18n.view["form.address.phone"]}</label> <span class="value">${basket.contactPhone}</span>
				</div>
				<c:if test="${comp.style != 'company'}">
			</div>
			<div class="col-md-6">
				</c:if>
				<div class="form-group">
					<label for="country">${i18n.view["form.address.country"]}</label> <span class="value">${basket.country}</span>
				</div>
				<div class="form-group">
					<label for="address">${i18n.view["form.address.street"]}</label> <span class="value">${basket.address}</span>
				</div>
				<div class="form-group">
					<label for="zip">${i18n.view["form.address.zip"]}</label> <span class="value">${basket.zip}</span>
				</div>
				<div class="form-group">
					<label for="city">${i18n.view["form.address.city"]}</label> <span class="value">${basket.city}</span>
				</div>
			</div>
		</div>

		<div class="d-flex justify-content-end align-items-center">
			<input class="form-check-input" type="checkbox" value="true" name="accept" id="accept" required="required">
			<label class="form-check-label" for="accept">${vi18n['ecom.accept']}</label>
		</div>


		<div class="d-flex justify-content-end">
			<button class="btn btn-secondary" name="webaction" value="basket.back" onclick="document.getElementById('accept').removeAttribute('required'); return true;">
				${i18n.view["global.back"]}
			</button>
			<button class="btn btn-primary" name="webaction" value="basket.pay">${i18n.view["ecom.pay-proceed"]}</button>
		</div>
	</fieldset>
</form>
