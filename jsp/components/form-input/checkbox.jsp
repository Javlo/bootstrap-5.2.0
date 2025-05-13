<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"
%>
<div class="form-block">
<div class="mb-3 form-line form-check">
  <input id="input_${compid}" type="${field.type}" name="${field.name}" />
  <label for="input_${compid}">${field.legend}</label>
</div>
<c:if test="${not empty field.description}"><div class="form-description">${field.description}</div></c:if>
<c:if test="${not empty field.descriptionLarge}"><div class="form-description-large">${field.descriptionLarge}</div></c:if>
<c:if test="${not empty field.tips}"><div class="form-tips">${field.tips}</div></c:if>
</div>

