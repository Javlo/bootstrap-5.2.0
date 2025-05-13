<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"
%>
<!-- conditions script -->
<script>
	function form${compid}Change() {
		var form = document.getElementById('form-${compid}');
		<c:forEach var="field" items="${comp.fields}"><c:if test="${not empty field.conditionField}">
        var field = document.querySelector('[name="${field.name}"]');
        if (field == null) {
          field = document.getElementById('${field.name}');
        }
        var conditionField = document.querySelector('[name="${field.conditionField}"]');
        if (conditionField == null) {
          conditionField = document.getElementById('${field.conditionField}');
        }
		    var value = getFormFieldValue(conditionField);

		    //var inputWrapper = form['${field.name}'];
        var inputWrapper = field;
		    while (inputWrapper != null && !inputWrapper.classList.contains('row')) {
		    	inputWrapper = inputWrapper.parentElement;
		    }
		    if(inputWrapper==null) {
		    	//inputWrapper = form['${field.name}'];
          inputWrapper = field;
		    }

        if(inputWrapper==null) {
          console.log("warning : inputWrapper not found '${field.name}'.");
        }

        if (value != null && value.length > 0 && value ${field.conditionOperator} ${field.conditionTest}) {
          inputWrapper.classList.add('visible');
          inputWrapper.classList.remove('hidden');
          if (field.getAttribute("data-required") == null) {
            field.setAttribute("data-required", field.getAttribute("required") != null);
          }
          if (field.dataset.required) {
            field.setAttribute("required","");
          }
        } else {
          inputWrapper.classList.add('hidden');
          inputWrapper.classList.remove('visible');
          if (field.dataset.required) {
            field.removeAttribute("required");
          }
        }
		</c:if></c:forEach>
	}
	var form = document.getElementById('form-${compid}');
	form.onChange = form${compid}Change;
  window.onload = function () {
	  form${compid}Change();
  }
</script>
