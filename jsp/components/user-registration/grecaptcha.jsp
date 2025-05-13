<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%><c:if test="${globalContext.specialConfig.googleRecaptcha}">
		<script src="https://www.google.com/recaptcha/api.js"></script>
		<input type="hidden" name="g-recaptcha-response" id="recaptcha-token-${compid}" />
		<script>
			function grecaptchaFallBack${compid}(token) {
				document.getElementById("recaptcha-token-${compid}").value = token;
				document.getElementById("recaptcha-token-${compid}").form.submit();
			}
		</script>
</c:if>