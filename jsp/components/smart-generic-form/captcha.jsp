<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
 %><div class="line captcha">
	<c:if test="${empty comp.recaptchaKey ||  empty comp.recaptchaSecretKey}">			
	<div class="${not empty requestService.parameterMap.webaction && empty requestService.parameterMap.captcha || not empty error_captcha?'error':''}">
		<label for="captcha"><img src="${info.captchaURL}" alt="captcha" /></label>
		<label for="captcha">${ci18n['label.captcha']}*</label>
		<input type="text" id="captcha" name="captcha" value="" />
	</div>
	</c:if><c:if test="${comp.captcha && not empty comp.recaptchaKey && not empty comp.recaptchaSecretKey}">
	<input type="hidden" name="g-recaptcha-response" id="captcha-input-${compid}" value="" />
	
	<script>
	grecaptcha.ready(function() {
    	grecaptcha.execute('${comp.recaptchaKey}', {action: 'submit'}).then(function(token) {
			document.getElementById('captcha-input-${compid}').value = token;
    	});
	});
</script>
	
	</c:if>
</div>
