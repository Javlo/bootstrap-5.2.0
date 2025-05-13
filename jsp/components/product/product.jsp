<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><%@ taglib uri="/WEB-INF/javlo.tld" prefix="jv"
%><form role="form" class="mb-3 add-basket" id="product-form-${compid}" method="post" action="${action}">
	<input type="hidden" name="webaction" value="products.buy">
	<input type="hidden" name="cid" value=${compid}>
	<div class="list-group">
		<div class="line list-group-item name">
			<h2>${productName}</h2>
		</div>
		<div class="line list-group-item price d-flex justify-content-between">
			<span class="label">${vi18n['ecom.price']}</span> <span class="price">${priceDisplay} ${currencyDisplay}</span>
		</div>
		<c:if test="${not empty description}">
			<div class="line list-group-item description">
				<p>${description}</p>
			</div>
		</c:if>
		<div class="line list-group-item stock d-flex justify-content-between form-inline">
		
			<c:if test="${virtualStock ge offset}">
		
			<label class="quantity-label" for="product-${compid}"><span>${vi18n['ecom.quantity']}</span></label>
			<input class="form-control digit" id="product-${compid}" type="number" min="1" name="quantity" value="${offset}" maxlength="3">
			<span class="buy"><button class="btn btn-default btn-primary buy" type="submit" name="buy">
					<svg style="vertical-align: baseline;" xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="currentColor" class="bi bi-basket" viewBox="0 0 16 16">
  <path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1v4.5a2.5 2.5 0 0 1-2.5 2.5h-9A2.5 2.5 0 0 1 1 13.5V9a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h1.217L5.07 1.243a.5.5 0 0 1 .686-.172zM2 9v4.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V9H2zM1 7v1h14V7H1zm3 3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 4 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 6 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3A.5.5 0 0 1 8 10zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5zm2 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 1 .5-.5z"></path>
</svg>
					${vi18n['ecom.buy']}
				</button></span>
			<c:if test="${not empty specialLink}">
				<span class="special-link">${specialLink}</span>
			</c:if>
			<c:if test="${not empty vi18n['ecom.delivery-info']}">
				<span class="delivery-info">${vi18n['ecom.delivery-info']}</span>
			</c:if>
			</c:if>
			<c:if test="${virtualStock < offset}">
				<span class="soldout">${vi18n['ecom.soldout']}</span>
			</c:if>
		</div>
	</div>
</form>